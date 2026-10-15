---
id: ai-scripts-index
type: index
status: active
scope: ai
updated: 2026-10-03
---

# AI Scripts

## Purpose

This folder stores tested automation used by the AIA for deterministic PROAD operations.

## Entry Points

-   [`promote-proad.ps1`](./promote-proad.ps1) is the mandatory Windows PowerShell 5.1-compatible coordinator for externally backed up, human-approved, recoverable version promotion.

## Invocation

Run the maintained script through a clean PowerShell process. A process-local execution-policy override may be used when direct local script execution is disabled:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\ai\scripts\promote-proad.ps1
```

The default mode is read-only validation. The promotion sequence is deliberately split:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\ai\scripts\promote-proad.ps1 -Prepare
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\ai\scripts\promote-proad.ps1 -Commit -TransactionId <id> -ApprovedManifestHash <sha256>
```

`-Prepare` creates and verifies a complete external backup, builds and validates a candidate outside `proad/`, and produces a review report. When no approved active template exists, supply an explicitly reviewed generic project directory with `-ProjectSource`. `-ClientMarker` values reject known client identifiers.

Candidate construction treats a nested `proad/` directory containing its own `ai/session-bootstrap.md` as an independent sub-PROAD boundary and excludes it. Complete backup and integrity recovery preserve that nested workspace mechanically without promoting or otherwise managing its content.

Candidate construction mechanically excludes the complete top-level development-host `raw/` directory. Candidate validation fails if any top-level `raw/` path appears. Reusable client Raw scaffolding belongs under `project/raw/` and can enter the candidate only through the explicitly reviewed generic project source.

After human checkout, `-Commit` accepts only the exact prepared transaction and approved candidate-manifest hash. It rechecks the workspace, activates only `proad-template/`, validates the result, and proves that every non-template path remains identical to the backup. Use `-Recover -TransactionId <id>` for maintained full-workspace recovery and `-TestSafety` for the isolated detection-and-restoration test.

Maintainer testing may add `-TestFaultAfterActivation` to a fixture commit. The switch is mechanically rejected unless `-Workspace` names a uniquely identified `proad-promotion-fixture-<32 hex>` directory; it must never be used against a live workspace.

Transaction data and the append-only promotion outcome log are stored in sibling paths outside `proad/`. After final transaction cleanup, the transaction parent is removed only when it is the exact expected path and completely empty. An unfinished or failed recovery retains its verified backup and blocks another preparation.

Template directories are derived only from eligible file paths. An intentionally empty directory must contain an eligible `.gitkeep`, `.gitignore`, or `index.md`; an unmarked live directory is never promoted independently.
