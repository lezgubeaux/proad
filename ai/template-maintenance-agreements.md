---
id: template-maintenance-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-11
---

# Template Maintenance Agreements

## Purpose

`proad-template/` is the canonical starter structure produced for new PROAD installations.

It contains the folders, files, bootstrap content, local instructions, and minimum structural agreements required to initialize a functional PROAD project.

The template is not a demonstration project.

It must remain generic, reusable, and free of project-specific information.

An installed PROAD workspace does not need to contain `proad-template/`.

When present, `proad-template/` must not be edited during ordinary live `proad/` work or reusable-change preparation. If it is absent, it must not be created until version promotion is authorized.

Moving an existing approved template baseline between development hosts is governed separately by [`development-host-transfer-agreements.md`](./development-host-transfer-agreements.md) and does not constitute version promotion.

## Live Framework State

- The single active development-host `proad/` workspace serves as both the proving workspace for its active project and the working version of the PROAD framework. An ordinary non-host installation may prove project-specific behavior but is not a reusable-framework development workspace.
- Reusable framework-controlled files in the live workspace must remain generic, internally integrated, and promotion-ready.
- Live `project/` is the active client's workspace and is never an automatic promotion source.
- Reusable project scaffolds are retained from the approved template or supplied through a separate, explicitly reviewed generic project-scaffold source during promotion.
- Every metadata-bearing Markdown file under live `project/` must declare a valid `template-management` value under [`template-management-agreements.md`](./template-management-agreements.md).
- Version promotion must not be used as a late review, sanitization, classification, or selection stage.

## AIA Responsibility

When the human states that a completed change should become reusable PROAD behavior, the AIA must prepare that change in the live host `proad/` workspace for later version promotion.

Typical statements include:

-   "Add this to the PROAD template."
-   "This should become part of the model."
-   "Make this standard for new PROAD projects."
-   "Apply this to the template."
-   "The last change should become part of PROAD."

The AIA must interpret such statements as an instruction to separate and prepare reusable PROAD behavior in the live host workspace, not as authorization to edit the canonical template.

Only version promotion creates or updates `proad-template/`. Reusable-change preparation must leave an existing `proad-template/` unchanged and must not create one when it is absent.

## Update Process

For ordinary reusable-change preparation in the live host workspace, the AIA must:

-   identify the underlying reusable principle
-   separate reusable structure from project-specific content
-   determine which live framework folders, files, headers, bootstrap sections, or agreements are affected
-   prepare reusable files and wording in the live host workspace
-   preserve established file-naming and structural conventions
-   update relevant indexes and entry-point documents
-   avoid copying client names, project names, statuses, dates, paths, or examples that belong only to the current project
-   verify that the prepared reusable state can become a clean starting point for an unrelated project
-   report which live reusable files were created, changed, renamed, or removed

## Version Promotion

When the human requests that a PROAD version promotion begin, the AIA must first perform the selective rummage of top-level PROAD-development `raw/`, when that host-only directory exists, as defined in [`raw-agreements.md`](./raw-agreements.md). Client `project/raw/` is outside this promotion trigger. Relevant development captures are surfaced for `USE`, `KEEP`, or `DELETE`; unrelated captures remain quiet. If no capture is materially relevant, state that briefly and continue. Candidate preparation must not start until this rummage is complete and any surfaced decision that affects the proposed version is resolved.

When the promotion proceeds, the AIA must:

-   finalize the live version number and working-version changelog under [`proad-release-agreements.md`](./proad-release-agreements.md)
-   use the live `proad/` workspace as the framework source and its local `proad-template/` folder as the only mutable workspace target
-   store the complete verified backup, candidate, transaction state, reports, quarantine, and promotion log outside the live `proad/` workspace
-   create the validated `proad-template/` target when it does not exist
-   exclude the complete live `project/` tree from automatic copying
-   exclude the complete top-level development-host `raw/` directory from automatic copying
-   use the existing approved template's complete generic `project/` tree by default, or require a separate explicitly reviewed generic project-scaffold source when the target is absent or project scaffolds are changing
-   reject any project-scaffold source located inside live `project/`
-   validate every project scaffold's metadata and genericness before staging
-   copy eligible live framework files outside `project/` together with the reviewed generic project scaffolds
-   stop before mutation if a live `project/` file has missing or unsupported `template-management` metadata
-   preserve source paths, filenames, file contents, metadata, and directory structure exactly for every included file
-   avoid regenerating, rewriting, sanitizing, or independently reconstructing copied files during promotion
-   treat the complete live `proad/` source, including every `template-management: exclude` file and directory, as read-only throughout promotion
-   interpret `template-management: exclude` only as exclusion from template copying; it never authorizes deletion, movement, replacement, reconstruction, or other mutation of the live source
-   verify path, object-type, size, and SHA-256 content parity for every included file
-   verify project-scaffold parity against the explicitly reviewed generic source
-   verify that no live client-project file was promoted, no included source file was omitted, no stale target-only file remains, and no nested template/reference tree was created
-   verify that no top-level `raw/` path appears in the candidate and that any reusable `project/raw/` scaffold came only from the reviewed generic project source

## Mandatory Safe-Promotion Protocol

Version promotion must be a two-stage transaction: prepare an immutable candidate for human checkout, then commit that exact approved candidate. On a supported Windows PowerShell runtime, the AIA must use [`scripts/promote-proad.ps1`](./scripts/promote-proad.ps1). Ad hoc promotion, replacement, cleanup, or recovery commands are prohibited.

The governing invariants are:

-   nothing under the live `proad/` workspace except `proad-template/` may differ after promotion
-   the activated template must equal the approved candidate and satisfy every deterministic promotion agreement
-   success requires post-activation validation; command success alone is insufficient
-   failure requires restoration and verification of the complete pre-promotion workspace
-   a failed or unverified recovery must retain the only verified backup and all available recovery evidence

### Preparation

Preparation must:

-   refuse to start while another unfinished transaction exists
-   reject reparse points in the workspace or approved project-scaffold source
-   create a uniquely identified transaction directory outside `proad/`
-   copy the complete live `proad/`, including its current template, to that external directory
-   inventory the source and backup by relative path, object type, file size, and SHA-256 content hash
-   stop unless the backup exactly matches the pre-promotion source
-   build the candidate entirely outside `proad/`
-   use no live `project/` file as a project-scaffold source
-   copy no file from live top-level `raw/`
-   exclude every independently bootstrapped nested sub-PROAD from candidate construction while retaining it in byte-preserving full-workspace backup and integrity verification
-   validate metadata, exact candidate structure and content, local links, and other deterministic rules
-   produce an immutable candidate manifest and a human-readable difference report
-   leave the complete live `proad/` unchanged

### Human Checkout And Approval

The human must review the prepared candidate before activation. The review must identify the transaction and candidate-manifest hash and expose additions, modifications, removals, machine-validation results, and semantic warnings.

Human approval determines whether the content is intentionally reusable, complete, generic, and free of client-specific knowledge. Human approval cannot override a failed deterministic check. Approval applies only to the exact candidate-manifest hash; a changed candidate requires new preparation and approval.

### Commit And Final Validation

Immediately before activation, the complete live workspace must still equal the verified backup. Drift invalidates the transaction.

Commit may mutate only the exact active `proad-template/` path. After activation it must:

-   verify the active template against the approved candidate manifest
-   rerun deterministic template checks
-   compare the complete live workspace outside `proad-template/` with the verified backup
-   treat every non-template difference as promotion failure
-   record the outcome only in the external promotion log
-   declare completion only after every check passes

The standard guarantee is that no unauthorized non-template change may survive promotion. The transaction lock prevents overlapping compliant promotions; before-and-after verification detects other drift. Absolute prevention against unrelated privileged software requires an operating-system write boundary and is outside the script's guarantee.

### Recovery And Cleanup

On any hard failure, recovery must restore the complete workspace, not only selected files. Recovery must first build and verify a restoration tree outside the active path, quarantine the failed workspace, activate the verified restoration, and compare it with the original backup manifest. It must not begin by recursively deleting the active workspace.

The external backup and recovery evidence may be deleted only after either successful promotion or verified full restoration. After removing the final completed, restored, aborted, or preparation-failed transaction, the maintained procedure must also remove the external transaction parent when—and only when—it is the exact expected path and completely empty. If recovery cannot be verified, the backup and quarantine must remain, the transaction must be marked `recovery-failed`, and further promotion must stop pending human direction.

Transaction state must be written durably at meaningful stages so a later invocation detects incomplete preparation, activation, validation, or recovery. Manual recovery must use the maintained script and exact transaction identifier.

### Promotion-Safety Test Isolation

Fault tests must use one uniquely named external test root, must not mutate live `proad/`, and must verify both difference detection and byte-identical restoration before cleanup. They must also prove that exact empty-directory cleanup succeeds, non-empty directories remain, and mismatched cleanup paths are rejected. A post-activation fault may be injected only in a disposable full-workspace fixture whose name satisfies the maintained script's strict fixture pattern. Cleanup may remove only that exact validated test root.

## Clarification Boundary

The AIA should ask a question when it cannot reliably determine:

-   whether the human intends a local project change or a reusable PROAD change
-   whether the exact implementation should be copied or only the underlying principle
-   whether an existing live framework agreement should be amended or a new component created
-   whether the change introduces a mandatory or optional component

The AIA should ask the smallest question needed to resolve the ambiguity.

## Bootstrap Content

Template files may contain bootstrap sections where they help the human or AIA understand how the file should be used.

Bootstrap content may include:

-   about
-   purpose
-   human usage guidance
-   AIA instructions
-   allowed values
-   expected structure
-   placeholders
-   examples that are clearly generic

Bootstrap content must not overwhelm the working document or require the human to study PROAD before using it.

## Template Integrity

The template must always:

-   use plain files and folders
-   remain understandable without proprietary software
-   contain no current-project data
-   preserve mandatory PROAD components
-   distinguish human-facing project files from AIA-managed records
-   provide enough local guidance for an unfamiliar AIA to begin working safely

The reviewed generic project-scaffold source is the only promotion source for `project/`. It may be the existing approved template or a separate temporary/reference tree prepared specifically for the promotion. The live client project must never fill this role.

## Promotion Principle

Do not copy the history of how a solution was discovered.

Promote only the final reusable structure, agreement, instruction, or bootstrap pattern that should exist in future projects.
