[CmdletBinding(DefaultParameterSetName='Validate')]
param(
    [Parameter(ParameterSetName='Prepare', Mandatory=$true)][switch]$Prepare,
    [Parameter(ParameterSetName='Commit', Mandatory=$true)][switch]$Commit,
    [Parameter(ParameterSetName='Recover', Mandatory=$true)][switch]$Recover,
    [Parameter(ParameterSetName='TestSafety', Mandatory=$true)][switch]$TestSafety,
    [Parameter(ParameterSetName='Commit', Mandatory=$true)]
    [Parameter(ParameterSetName='Recover', Mandatory=$true)][ValidatePattern('^[0-9a-f]{32}$')][string]$TransactionId,
    [Parameter(ParameterSetName='Commit', Mandatory=$true)][ValidatePattern('^[0-9A-Fa-f]{64}$')][string]$ApprovedManifestHash,
    [Parameter(ParameterSetName='Commit')][switch]$TestFaultAfterActivation,
    [string]$Workspace,
    [Parameter(ParameterSetName='Prepare')][string]$ProjectSource,
    [Parameter(ParameterSetName='Prepare')][string[]]$ClientMarker = @()
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

if ($PSVersionTable.PSVersion.Major -lt 5) { throw 'Windows PowerShell 5.1 or newer is required.' }
if ([string]::IsNullOrWhiteSpace($Workspace)) { $Workspace = Join-Path $PSScriptRoot '..\..' }

function Get-Full([string]$Path) { [IO.Path]::GetFullPath($Path).TrimEnd('\') }
function Test-Inside([string]$Path, [string]$Root) {
    $full = Get-Full $Path
    $rootFull = Get-Full $Root
    $full.StartsWith(($rootFull + '\'), [StringComparison]::OrdinalIgnoreCase)
}
function Get-Relative([string]$Root, [string]$Path) {
    $rootFull = Get-Full $Root
    $full = Get-Full $Path
    $prefix = $rootFull + '\'
    if (-not $full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw "Path is outside expected root: $full" }
    $full.Substring($prefix.Length)
}
function Assert-NoReparsePoints([string]$Root) {
    if (-not (Test-Path -LiteralPath $Root)) { return }
    $rootItem = Get-Item -Force -LiteralPath $Root
    if (($rootItem.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "Reparse point is not allowed: $($rootItem.FullName)" }
    Get-ChildItem -Force -LiteralPath $Root -Recurse | ForEach-Object {
        if (($_.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "Reparse point is not allowed: $($_.FullName)" }
    }
}
function Assert-Workspace([string]$Root) {
    if (-not (Test-Path -LiteralPath $Root -PathType Container)) { throw "Workspace not found: $Root" }
    if (-not (Test-Path -LiteralPath (Join-Path $Root 'ai\session-bootstrap.md') -PathType Leaf)) { throw "Not a PROAD workspace: $Root" }
    Assert-NoReparsePoints $Root
}
function Get-NestedProadRoots([string]$Root) {
    @(
        Get-ChildItem -Force -LiteralPath $Root -Recurse -Directory -Filter 'proad' | Where-Object {
            (Get-Full $_.FullName) -ne (Get-Full $Root) -and
            (Test-Path -LiteralPath (Join-Path $_.FullName 'ai\session-bootstrap.md') -PathType Leaf)
        } | ForEach-Object { Get-Full $_.FullName }
    )
}
function Test-InsideAnyRoot([string]$Path, [object[]]$Roots) {
    foreach ($root in $Roots) {
        if ((Get-Full $Path) -eq (Get-Full $root) -or (Test-Inside $Path $root)) { return $true }
    }
    $false
}
function Test-FrameworkPromotionFile([string]$Relative) {
    $normalized = $Relative.Replace('/','\')
    $top = ($normalized -split '\\')[0]
    if ($top -eq 'project' -or $top -eq 'raw' -or $top -like 'proad-template*') { return $false }
    $true
}
function Get-Inventory([string]$Root, [string[]]$ExcludeTopLevel = @()) {
    $records = New-Object System.Collections.Generic.List[object]
    if (-not (Test-Path -LiteralPath $Root -PathType Container)) { return @() }
    Get-ChildItem -Force -LiteralPath $Root -Recurse | ForEach-Object {
        $relative = Get-Relative $Root $_.FullName
        $top = ($relative -split '\\')[0]
        if ($ExcludeTopLevel -contains $top) { return }
        if (($_.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "Reparse point is not allowed: $($_.FullName)" }
        if ($_.PSIsContainer) {
            $records.Add([pscustomobject]@{ path=$relative; type='directory'; length=$null; sha256=$null })
        } else {
            $records.Add([pscustomobject]@{
                path=$relative
                type='file'
                length=[int64]$_.Length
                sha256=(Get-FileHash -Algorithm SHA256 -LiteralPath $_.FullName).Hash.ToUpperInvariant()
            })
        }
    }
    @($records | Sort-Object path,type)
}
function Convert-InventoryToLines([object[]]$Inventory) {
    @($Inventory | ForEach-Object { "{0}`t{1}`t{2}`t{3}" -f $_.type,$_.length,$_.sha256,$_.path })
}
function Write-Inventory([object[]]$Inventory, [string]$Path) {
    $lines = Convert-InventoryToLines $Inventory
    [IO.File]::WriteAllLines($Path, $lines, (New-Object Text.UTF8Encoding($false)))
}
function Compare-Inventory([object[]]$Expected, [object[]]$Actual, [string]$Label) {
    $expectedLines = @(Convert-InventoryToLines $Expected)
    $actualLines = @(Convert-InventoryToLines $Actual)
    $difference = @(Compare-Object -ReferenceObject $expectedLines -DifferenceObject $actualLines)
    @($difference | ForEach-Object {
        if ($_.SideIndicator -eq '<=') { "$Label missing or changed: $($_.InputObject)" }
        else { "$Label unexpected or changed: $($_.InputObject)" }
    })
}
function Copy-Tree([string]$Source, [string]$Destination) {
    if (Test-Path -LiteralPath $Destination) { throw "Copy destination must not exist: $Destination" }
    Assert-NoReparsePoints $Source
    New-Item -ItemType Directory -Path $Destination | Out-Null
    Get-ChildItem -Force -LiteralPath $Source -Recurse | Sort-Object { $_.FullName.Length } | ForEach-Object {
        $relative = Get-Relative $Source $_.FullName
        $target = Join-Path $Destination $relative
        if ($_.PSIsContainer) {
            if (-not (Test-Path -LiteralPath $target)) { New-Item -ItemType Directory -Path $target | Out-Null }
        } else {
            $parent = Split-Path -Parent $target
            if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
            [IO.File]::Copy($_.FullName, $target, $false)
        }
    }
}
function Copy-FilesInto([string]$Source, [string]$Destination, [scriptblock]$Include) {
    Assert-NoReparsePoints $Source
    Get-ChildItem -Force -LiteralPath $Source -Recurse -File | Where-Object $Include | ForEach-Object {
        $relative = Get-Relative $Source $_.FullName
        $target = Join-Path $Destination $relative
        $parent = Split-Path -Parent $target
        if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
        [IO.File]::Copy($_.FullName, $target, $false)
    }
}
function Get-Management([string]$Path, [string]$Relative) {
    $content = Get-Content -Raw -LiteralPath $Path
    $frontMatter = [regex]::Match($content, '\A(?:\uFEFF)?---\s*\r?\n(?<yaml>.*?)\r?\n---(?:\r?\n|\z)', [Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $frontMatter.Success) { throw "Project Markdown must begin with YAML front matter: $Relative" }
    $matches = [regex]::Matches($frontMatter.Groups['yaml'].Value, '(?m)^template-management:\s*(\S+)\s*$')
    if ($matches.Count -ne 1) { throw "Project Markdown must contain exactly one template-management value: $Relative" }
    $value = $matches[0].Groups[1].Value
    if ($value -notin @('preserve','exclude')) { throw "Unsupported template-management value: $Relative" }
    $value
}
function Test-LocalLinks([string]$Root) {
    $errors = @()
    Get-ChildItem -LiteralPath $Root -Recurse -File -Filter '*.md' | ForEach-Object {
        $file = $_
        $content = Get-Content -Raw -LiteralPath $file.FullName
        $content = [regex]::Replace($content, '(?ms)^```.*?^```\s*', '')
        foreach ($match in [regex]::Matches($content, '(?<!\!)\[[^\]]*\]\(([^)]+)\)')) {
            $target = $match.Groups[1].Value.Trim()
            if ($target -match '^(https?:|mailto:|#)' -or [string]::IsNullOrWhiteSpace($target)) { continue }
            if ($target.StartsWith('<') -and $target.EndsWith('>')) { $target = $target.Substring(1, $target.Length - 2) }
            $target = [uri]::UnescapeDataString(($target -split '#|\?')[0])
            if ([string]::IsNullOrWhiteSpace($target)) { continue }
            $resolved = Get-Full (Join-Path $file.DirectoryName $target.Replace('/', '\'))
            if (-not (Test-Inside $resolved $Root) -and $resolved -ne (Get-Full $Root)) {
                $errors += "Link escapes template: $(Get-Relative $Root $file.FullName) -> $target"
            } elseif (-not (Test-Path -LiteralPath $resolved)) {
                $errors += "Broken local link: $(Get-Relative $Root $file.FullName) -> $target"
            }
        }
    }
    $errors
}
function Test-CandidateDirectories([string]$Root) {
    $errors = @()
    Get-ChildItem -Force -LiteralPath $Root -Recurse -Directory | ForEach-Object {
        if (-not (Get-ChildItem -Force -LiteralPath $_.FullName | Select-Object -First 1)) {
            $errors += "Unexpected empty candidate directory: $(Get-Relative $Root $_.FullName)"
        }
    }
    $errors
}
function Test-CandidateDevelopmentRawBoundary([string]$Root) {
    $errors = @()
    $rawRoot = Join-Path $Root 'raw'
    if (Test-Path -LiteralPath $rawRoot) {
        $errors += 'Top-level development-host raw\ entered candidate.'
    }
    $errors
}
function Test-CandidateProjectRawBoundary([string]$Root) {
    $errors = @()
    $rawRoot = Join-Path $Root 'project\raw'
    $rawIndex = Join-Path $rawRoot 'index.md'
    if (-not (Test-Path -LiteralPath $rawIndex -PathType Leaf)) {
        $errors += 'Candidate is missing reusable project\raw\index.md.'
        return $errors
    }
    Get-ChildItem -Force -LiteralPath $rawRoot -Recurse -File | ForEach-Object {
        $relative = Get-Relative $rawRoot $_.FullName
        if (-not $relative.Equals('index.md', [StringComparison]::OrdinalIgnoreCase)) {
            $errors += "Unexpected client Raw capture in generic candidate: project\raw\$relative"
        }
    }
    $errors
}
function Write-State([string]$Path, [hashtable]$State) {
    $temp = $Path + '.new'
    $json = $State | ConvertTo-Json -Depth 8
    [IO.File]::WriteAllText($temp, $json, (New-Object Text.UTF8Encoding($false)))
    Move-Item -Force -LiteralPath $temp -Destination $Path
}
function Read-State([string]$Path) {
    $raw = Get-Content -Raw -LiteralPath $Path | ConvertFrom-Json
    $state = @{}
    $raw.PSObject.Properties | ForEach-Object { $state[$_.Name] = $_.Value }
    $state
}
function Add-ExternalLog([string]$LogPath, [string]$Message) {
    $line = "{0:u}`t{1}" -f (Get-Date),$Message
    Add-Content -LiteralPath $LogPath -Value $line -Encoding UTF8
}
function Remove-EmptyExactDirectory([string]$Path, [string]$ExpectedPath) {
    $full = Get-Full $Path
    $expected = Get-Full $ExpectedPath
    if (-not $full.Equals($expected, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing cleanup of unexpected directory: $full"
    }
    if (-not (Test-Path -LiteralPath $full)) { return }
    if (-not (Test-Path -LiteralPath $full -PathType Container)) { throw "Cleanup target is not a directory: $full" }
    if (Get-ChildItem -Force -LiteralPath $full | Select-Object -First 1) { return }
    Remove-Item -Force -LiteralPath $full
}

$workspaceRoot = Get-Full $Workspace
$workspaceParent = Split-Path -Parent $workspaceRoot
$workspaceName = Split-Path -Leaf $workspaceRoot
$templateRoot = Join-Path $workspaceRoot 'proad-template'
$transactionsRoot = Join-Path $workspaceParent ($workspaceName + '-promotion-transactions')
$externalLog = Join-Path $workspaceParent ($workspaceName + '-promotion.log')

foreach ($command in @('Get-FileHash','Move-Item','New-Item','Remove-Item')) {
    if (-not (Get-Command $command -ErrorAction SilentlyContinue)) { throw "Required PowerShell command unavailable: $command" }
}
Assert-Workspace $workspaceRoot
if (Test-Inside $transactionsRoot $workspaceRoot -or $transactionsRoot -eq $workspaceRoot) { throw 'Transaction storage must be outside the PROAD workspace.' }
if ($TestFaultAfterActivation -and $workspaceName -notmatch '^proad-promotion-fixture-[0-9a-f]{32}$') {
    throw 'Post-activation fault injection is permitted only in a uniquely named disposable promotion fixture.'
}

function Get-TransactionPath([string]$Id) { Join-Path $transactionsRoot $Id }
function Get-UnfinishedTransactions {
    if (-not (Test-Path -LiteralPath $transactionsRoot -PathType Container)) { return @() }
    @(Get-ChildItem -LiteralPath $transactionsRoot -Directory | Where-Object {
        $statePath = Join-Path $_.FullName 'transaction.json'
        if (-not (Test-Path -LiteralPath $statePath -PathType Leaf)) { return $true }
        $state = Read-State $statePath
        $state.state -notin @('completed','restored')
    })
}
function Restore-WholeWorkspace([string]$TransactionPath, [hashtable]$State, [string]$Reason) {
    $backup = Join-Path $TransactionPath 'backup'
    $restoreStaging = Join-Path $workspaceParent ($workspaceName + '-restore-' + $State.id)
    $quarantine = Join-Path $workspaceParent ($workspaceName + '-failed-' + $State.id)
    if (Test-Path -LiteralPath $restoreStaging) { throw "Unsafe pre-existing restore path: $restoreStaging" }
    if (Test-Path -LiteralPath $quarantine) { throw "Unsafe pre-existing quarantine path: $quarantine" }
    $State.state = 'restoring'; $State.failure = $Reason; Write-State (Join-Path $TransactionPath 'transaction.json') $State
    Copy-Tree $backup $restoreStaging
    $restoreErrors = @(Compare-Inventory (Get-Inventory $backup) (Get-Inventory $restoreStaging) 'Restore staging')
    if ($restoreErrors.Count) { throw ('Recovery staging verification failed: ' + ($restoreErrors -join '; ')) }
    Set-Location -LiteralPath $TransactionPath
    Move-Item -LiteralPath $workspaceRoot -Destination $quarantine
    try {
        Move-Item -LiteralPath $restoreStaging -Destination $workspaceRoot
        $verifyErrors = @(Compare-Inventory (Get-Inventory $backup) (Get-Inventory $workspaceRoot) 'Restored workspace')
        if ($verifyErrors.Count) { throw ('Restored workspace verification failed: ' + ($verifyErrors -join '; ')) }
        $State.state = 'restored'; Write-State (Join-Path $TransactionPath 'transaction.json') $State
        Add-ExternalLog $externalLog "PROMOTION FAILED; transaction=$($State.id); workspace restored and verified; reason=$Reason"
        Remove-Item -Recurse -Force -LiteralPath $quarantine
        Set-Location -LiteralPath $workspaceParent
        Remove-Item -Recurse -Force -LiteralPath $TransactionPath
        Remove-EmptyExactDirectory $transactionsRoot (Join-Path $workspaceParent ($workspaceName + '-promotion-transactions'))
        Write-Output 'PROMOTION RESULT: FAILED; WORKSPACE RESTORED AND VERIFIED'
    } catch {
        $State.state = 'recovery-failed'; $State.failure = $_.Exception.Message
        Write-State (Join-Path $TransactionPath 'transaction.json') $State
        Add-ExternalLog $externalLog "CRITICAL RECOVERY FAILURE; transaction=$($State.id); backup retained at $backup; error=$($_.Exception.Message)"
        throw
    }
}

if ($TestSafety) {
    $testId = [guid]::NewGuid().ToString('N')
    $testRoot = Join-Path $workspaceParent ($workspaceName + '-promotion-safety-test-' + $testId)
    try {
        New-Item -ItemType Directory -Path $testRoot | Out-Null
        $source = Join-Path $testRoot 'source'; New-Item -ItemType Directory -Path $source | Out-Null
        New-Item -ItemType Directory -Path (Join-Path $source 'empty') | Out-Null
        [IO.File]::WriteAllText((Join-Path $source 'one.txt'),'one')
        $nestedMarker = Join-Path $source 'component\proad\ai'
        New-Item -ItemType Directory -Path $nestedMarker -Force | Out-Null
        [IO.File]::WriteAllText((Join-Path $nestedMarker 'session-bootstrap.md'),'fixture marker')
        $nestedRoots = @(Get-NestedProadRoots $source)
        if ($nestedRoots.Count -ne 1 -or -not (Test-InsideAnyRoot (Join-Path $nestedMarker 'session-bootstrap.md') $nestedRoots)) {
            throw 'Nested PROAD boundary detection failed.'
        }
        $rawFixture = Join-Path $source 'raw'
        New-Item -ItemType Directory -Path $rawFixture | Out-Null
        [IO.File]::WriteAllText((Join-Path $rawFixture 'index.md'),'reusable raw index')
        [IO.File]::WriteAllText((Join-Path $rawFixture '2026-09-26-client-thought.md'),'client capture')
        $selection = Join-Path $testRoot 'framework-selection'
        New-Item -ItemType Directory -Path $selection | Out-Null
        Copy-FilesInto $source $selection {
            $relative = Get-Relative $source $_.FullName
            (Test-FrameworkPromotionFile $relative) -and -not (Test-InsideAnyRoot $_.FullName $nestedRoots)
        }
        if (Test-Path -LiteralPath (Join-Path $selection 'raw')) { throw 'Top-level development Raw was selected for promotion.' }
        $projectRawFixture = Join-Path $selection 'project\raw'
        New-Item -ItemType Directory -Path $projectRawFixture -Force | Out-Null
        [IO.File]::WriteAllText((Join-Path $projectRawFixture 'index.md'),'generic project raw index')
        if (@(Test-CandidateProjectRawBoundary $selection).Count) { throw 'Valid generic project Raw scaffold was rejected.' }
        [IO.File]::WriteAllText((Join-Path $projectRawFixture '2026-09-26-client-thought.md'),'client capture')
        if (@(Test-CandidateProjectRawBoundary $selection).Count -eq 0) { throw 'Client project Raw capture was not rejected.' }
        $backup = Join-Path $testRoot 'backup'; Copy-Tree $source $backup
        $before = Get-Inventory $backup
        [IO.File]::WriteAllText((Join-Path $source 'one.txt'),'two')
        New-Item -ItemType Directory -Path (Join-Path $source 'unexpected') | Out-Null
        $detected = @(Compare-Inventory $before (Get-Inventory $source) 'Injected fault')
        if ($detected.Count -lt 2) { throw 'Safety test did not detect injected content and structure faults.' }
        $restored = Join-Path $testRoot 'restored'; Copy-Tree $backup $restored
        $errors = @(Compare-Inventory $before (Get-Inventory $restored) 'Safety restoration')
        if ($errors.Count) { throw ($errors -join '; ') }
        $cleanupEmpty = Join-Path $testRoot 'cleanup-empty'
        New-Item -ItemType Directory -Path $cleanupEmpty | Out-Null
        Remove-EmptyExactDirectory $cleanupEmpty $cleanupEmpty
        if (Test-Path -LiteralPath $cleanupEmpty) { throw 'Exact empty-directory cleanup failed.' }
        $cleanupNonEmpty = Join-Path $testRoot 'cleanup-non-empty'
        New-Item -ItemType Directory -Path $cleanupNonEmpty | Out-Null
        [IO.File]::WriteAllText((Join-Path $cleanupNonEmpty 'retain.txt'),'retain')
        Remove-EmptyExactDirectory $cleanupNonEmpty $cleanupNonEmpty
        if (-not (Test-Path -LiteralPath $cleanupNonEmpty)) { throw 'Non-empty cleanup target was removed.' }
        $mismatchRejected = $false
        try { Remove-EmptyExactDirectory $cleanupNonEmpty (Join-Path $testRoot 'different-directory') }
        catch { $mismatchRejected = $true }
        if (-not $mismatchRejected) { throw 'Unexpected cleanup path was not rejected.' }
        Write-Output 'Injected content and structure faults detected: PASS'
        Write-Output 'Backup restoration verified: PASS'
        Write-Output 'Exact empty-directory cleanup safeguards: PASS'
        Write-Output 'Nested PROAD boundary detection: PASS'
        Write-Output 'Development and client Raw promotion boundaries: PASS'
        Write-Output 'SAFETY TEST RESULT: PASS'
    } finally {
        if (Test-Path -LiteralPath $testRoot) { Remove-Item -Recurse -Force -LiteralPath $testRoot }
    }
    exit 0
}

if ($Prepare) {
    $unfinished = @(Get-UnfinishedTransactions)
    if ($unfinished.Count) { throw "An unfinished promotion transaction already exists: $($unfinished[0].FullName)" }
    $id = [guid]::NewGuid().ToString('N')
    $transactionPath = Get-TransactionPath $id
    New-Item -ItemType Directory -Force -Path $transactionsRoot | Out-Null
    New-Item -ItemType Directory -Path $transactionPath | Out-Null
    $statePath = Join-Path $transactionPath 'transaction.json'
    $state = @{ id=$id; state='preparing'; workspace=$workspaceRoot; created=(Get-Date).ToUniversalTime().ToString('o') }
    Write-State $statePath $state
    try {
        $backup = Join-Path $transactionPath 'backup'
        Copy-Tree $workspaceRoot $backup
        $sourceInventory = Get-Inventory $workspaceRoot
        $backupInventory = Get-Inventory $backup
        $backupErrors = @(Compare-Inventory $sourceInventory $backupInventory 'Backup')
        if ($backupErrors.Count) { throw ($backupErrors -join '; ') }
        $backupManifest = Join-Path $transactionPath 'backup-manifest.tsv'
        Write-Inventory $backupInventory $backupManifest
        $state.backupManifestHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $backupManifest).Hash
        $state.state = 'backup-verified'; Write-State $statePath $state

        if ([string]::IsNullOrWhiteSpace($ProjectSource)) {
            $ProjectSource = Join-Path $workspaceRoot 'proad-template\project'
        }
        $projectSourceRoot = Get-Full $ProjectSource
        if (-not (Test-Path -LiteralPath $projectSourceRoot -PathType Container)) { throw 'No approved generic project source exists. Supply -ProjectSource.' }
        $liveProject = Join-Path $workspaceRoot 'project'
        if ($projectSourceRoot -eq (Get-Full $liveProject) -or (Test-Inside $projectSourceRoot $liveProject)) { throw 'The live client project cannot be the generic project source.' }
        Assert-NoReparsePoints $projectSourceRoot

        Get-ChildItem -LiteralPath $projectSourceRoot -Recurse -File -Filter '*.md' | ForEach-Object {
            $null = Get-Management $_.FullName ('project\' + (Get-Relative $projectSourceRoot $_.FullName))
        }

        $candidate = Join-Path $transactionPath 'candidate-template'
        New-Item -ItemType Directory -Path $candidate | Out-Null
        $nestedProadRoots = @(Get-NestedProadRoots $workspaceRoot)
        Copy-FilesInto $workspaceRoot $candidate {
            $relative = Get-Relative $workspaceRoot $_.FullName
            (Test-FrameworkPromotionFile $relative) -and
            -not (Test-InsideAnyRoot $_.FullName $nestedProadRoots)
        }
        $candidateProject = Join-Path $candidate 'project'
        Copy-Tree $projectSourceRoot $candidateProject

        foreach ($marker in $ClientMarker) {
            if ([string]::IsNullOrWhiteSpace($marker)) { continue }
            $found = Get-ChildItem -LiteralPath $candidateProject -Recurse -File -Filter '*.md' | Select-String -SimpleMatch $marker -List
            if ($found) { throw "Client marker found in generic project source: $marker" }
        }
        $candidateErrors = @(Test-LocalLinks $candidate)
        $candidateErrors += @(Test-CandidateDirectories $candidate)
        $candidateErrors += @(Test-CandidateDevelopmentRawBoundary $candidate)
        $candidateErrors += @(Test-CandidateProjectRawBoundary $candidate)
        if ($candidateErrors.Count) { throw ($candidateErrors -join '; ') }
        $candidateInventory = Get-Inventory $candidate
        $candidateManifest = Join-Path $transactionPath 'candidate-manifest.tsv'
        Write-Inventory $candidateInventory $candidateManifest
        $state.candidateManifestHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $candidateManifest).Hash
        $state.projectSource = $projectSourceRoot
        $state.nestedProadRootsExcluded = $nestedProadRoots.Count
        $state.state = 'candidate-ready'; Write-State $statePath $state

        $oldInventory = if (Test-Path -LiteralPath $templateRoot) { Get-Inventory $templateRoot } else { @() }
        $changes = @(Compare-Inventory $oldInventory $candidateInventory 'Candidate')
        $report = @(
            '# PROAD Promotion Candidate Review','',
            "- Transaction: $id","- Candidate manifest SHA-256: $($state.candidateManifestHash)",
            "- Generic project source: $projectSourceRoot",'- Machine validation: passed','',
            "- Nested sub-PROAD workspaces excluded from candidate: $($nestedProadRoots.Count)",'',
            '## Human approval required','',
            '- Confirm that all candidate content is reusable.','- Confirm that no client-specific content is present.',
            '- Confirm that additions, changes, and removals are intentional.','- Approve this exact transaction and manifest hash.','',
            '## Inventory differences',''
        ) + @($changes | ForEach-Object { '- ' + $_ })
        [IO.File]::WriteAllLines((Join-Path $transactionPath 'candidate-review.md'), $report, (New-Object Text.UTF8Encoding($false)))
        Write-Output "Transaction: $id"
        Write-Output "Candidate manifest SHA-256: $($state.candidateManifestHash)"
        Write-Output "Review: $(Join-Path $transactionPath 'candidate-review.md')"
        Write-Output 'PREPARATION RESULT: CANDIDATE READY; HUMAN APPROVAL REQUIRED'
    } catch {
        Add-ExternalLog $externalLog "PREPARATION FAILED; transaction=$id; error=$($_.Exception.Message)"
        if (Test-Path -LiteralPath $transactionPath) { Remove-Item -Recurse -Force -LiteralPath $transactionPath }
        Remove-EmptyExactDirectory $transactionsRoot (Join-Path $workspaceParent ($workspaceName + '-promotion-transactions'))
        throw
    }
    exit 0
}

if ($Commit -or $Recover) {
    $transactionPath = Get-TransactionPath $TransactionId
    $statePath = Join-Path $transactionPath 'transaction.json'
    if (-not (Test-Path -LiteralPath $statePath -PathType Leaf)) { throw "Transaction not found: $TransactionId" }
    $state = Read-State $statePath
    if ((Get-Full $state.workspace) -ne $workspaceRoot) { throw 'Transaction workspace does not match the requested workspace.' }
    if ($Recover) {
        if ($state.state -in @('preparing','backup-verified','candidate-ready')) {
            Add-ExternalLog $externalLog "PRE-ACTIVATION TRANSACTION ABORTED; transaction=$TransactionId; no workspace mutation required"
            Set-Location -LiteralPath $workspaceParent
            Remove-Item -Recurse -Force -LiteralPath $transactionPath
            Remove-EmptyExactDirectory $transactionsRoot (Join-Path $workspaceParent ($workspaceName + '-promotion-transactions'))
            Write-Output 'RECOVERY RESULT: PRE-ACTIVATION TRANSACTION REMOVED; WORKSPACE UNCHANGED'
        } else {
            Restore-WholeWorkspace $transactionPath $state 'Manual recovery requested.'
        }
        exit 0
    }
    if ($state.state -ne 'candidate-ready') { throw "Transaction is not ready to commit: $($state.state)" }
    if ($state.candidateManifestHash -ne $ApprovedManifestHash.ToUpperInvariant()) { throw 'Approved manifest hash does not match the prepared candidate.' }
    $candidate = Join-Path $transactionPath 'candidate-template'
    $candidateManifest = Join-Path $transactionPath 'candidate-manifest.tsv'
    if ((Get-FileHash -Algorithm SHA256 -LiteralPath $candidateManifest).Hash -ne $state.candidateManifestHash) { throw 'Candidate manifest changed after preparation.' }
    $candidateInventory = Get-Inventory $candidate
    $manifestLines = @(Get-Content -LiteralPath $candidateManifest)
    if (@(Compare-Object $manifestLines (Convert-InventoryToLines $candidateInventory)).Count) { throw 'Candidate content changed after preparation.' }
    $preCommitErrors = @(Compare-Inventory (Get-Inventory (Join-Path $transactionPath 'backup')) (Get-Inventory $workspaceRoot) 'Pre-commit workspace')
    if ($preCommitErrors.Count) {
        $reason = 'Workspace changed after preparation; create a new transaction. ' + ($preCommitErrors -join '; ')
        Add-ExternalLog $externalLog "TRANSACTION INVALIDATED BEFORE ACTIVATION; transaction=$TransactionId; reason=$reason"
        Remove-Item -Recurse -Force -LiteralPath $transactionPath
        throw $reason
    }

    $state.state = 'activating'; Write-State $statePath $state
    try {
        Set-Location -LiteralPath $transactionPath
        $oldTemplate = Join-Path $transactionPath 'old-template'
        if (Test-Path -LiteralPath $templateRoot) { Move-Item -LiteralPath $templateRoot -Destination $oldTemplate }
        Move-Item -LiteralPath $candidate -Destination $templateRoot
        $state.state = 'validating'; Write-State $statePath $state
        if ($TestFaultAfterActivation) {
            [IO.File]::AppendAllText((Join-Path $workspaceRoot 'README.md'), "`r`nINJECTED PROMOTION SAFETY TEST FAULT`r`n")
        }
        $templateErrors = @(Compare-Inventory $candidateInventory (Get-Inventory $templateRoot) 'Activated template')
        $templateErrors += @(Test-LocalLinks $templateRoot)
        $templateErrors += @(Test-CandidateDirectories $templateRoot)
        $templateErrors += @(Test-CandidateDevelopmentRawBoundary $templateRoot)
        $templateErrors += @(Test-CandidateProjectRawBoundary $templateRoot)
        $protectedBefore = Get-Inventory (Join-Path $transactionPath 'backup') @('proad-template')
        $protectedAfter = Get-Inventory $workspaceRoot @('proad-template')
        $protectedErrors = @(Compare-Inventory $protectedBefore $protectedAfter 'Protected workspace')
        if ($templateErrors.Count -or $protectedErrors.Count) {
            throw ((@($templateErrors) + @($protectedErrors)) -join '; ')
        }
        $state.state = 'completed'; Write-State $statePath $state
        Add-ExternalLog $externalLog "PROMOTION COMPLETE; transaction=$TransactionId; candidate=$($state.candidateManifestHash)"
        Set-Location -LiteralPath $workspaceParent
        Remove-Item -Recurse -Force -LiteralPath $transactionPath
        Remove-EmptyExactDirectory $transactionsRoot (Join-Path $workspaceParent ($workspaceName + '-promotion-transactions'))
        Write-Output 'Protected workspace unchanged: PASS'
        Write-Output 'Activated template equals approved candidate: PASS'
        Write-Output 'PROMOTION COMPLETE'
    } catch {
        $reason = $_.Exception.Message
        Restore-WholeWorkspace $transactionPath $state $reason
        throw "Promotion failed and the workspace was restored: $reason"
    }
    exit 0
}

$unfinished = @(Get-UnfinishedTransactions)
Write-Output "Workspace: $workspaceRoot"
Write-Output "External transaction root: $transactionsRoot"
Write-Output "External promotion log: $externalLog"
Write-Output "Unfinished transactions: $($unfinished.Count)"
if ($unfinished.Count) { $unfinished | ForEach-Object { Write-Output "- $($_.FullName)" } }
Write-Output 'VALIDATION RESULT: PASS'
