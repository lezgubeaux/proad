---
id: global-working-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-08-11
---

# Global Working Agreements

## Purpose

Store repository-wide working agreements and limitations that apply to the AIA across the entire PROAD workspace.

## GO Rule

-   Execution is read-only by default until the user sends a valid standalone `GO` or `go`.
-   `GO` authorizes only the immediately following assistant response.
-   After that single response, execution permission expires automatically and the assistant returns to read-only mode.
-   If approval is not written as a standalone `GO` line, it does not unlock execution.

## Current Rules

-   Work should be advisory-first unless the human explicitly authorizes execution.
-   GitHub repository access is available to the AIA as read-only.
-   The AIA must not use git unless the human explicitly asks for git actions.
-   The AIA must not browse the web, use plugins, or use external connectors unless the human explicitly asks for them.
-   These rules apply across the current `proad/` workspace.
-   Unless explicitly instructed otherwise, the AIA must operate only within `proad/` and treat work outside it as out of scope.
-   Each installed `proad/` workspace must stay scoped to the project or sub-project where it is installed and must not silently absorb sibling or parent project concerns.
-   AIA rule documents belong under `ai/`.
-   When a `proad/` workspace becomes the active PROAD development host, it must contain its own `proad-template/` folder.
-   File naming should follow [`file-naming-standard.md`](./file-naming-standard.md).
-   Note handling should follow [`notes-agreements.md`](./notes-agreements.md).
-   Supporting material handling should follow [`supporting-material-agreements.md`](./supporting-material-agreements.md).
-   Roadmap behavior should follow [`roadmap-agreements.md`](./roadmap-agreements.md).
-   Release/version behavior should follow [`proad-release-agreements.md`](./proad-release-agreements.md).
-   Template promotion behavior should follow [`template-maintenance-agreements.md`](./template-maintenance-agreements.md).
-   Outside explicit template-maintenance or version-promotion work, the AIA must not edit `proad-template/`.
-   Ordinary PROAD development should happen in the live host `proad/` workspace, while `proad-template/` should be treated as a promotion target only.
-   Metadata headers are operational, not decorative. They exist to support later querying, filtering, indexing, and retrieval.
-   Operational metadata is authoritative for live installed `proad/` workspaces. `proad-template/` is excluded from strict metadata identity with live `proad/` when template-specific header values or references are required.
-   When asked to store information, the AIA must not guess its destination, filename, metadata shape, or linkage.
-   Before storing non-trivial information, the AIA must determine which existing document should reference it.
-   If the target reference is not deterministic, the AIA must ask the smallest differentiating question that makes the next action deterministic.
-   When creating a file that is not purely an AIA-instruction document, the AIA must always ask which document should reference it.
-   Any newly added non-instruction file should be linked from an appropriate existing access document. The preferred default is the `index.md` of the same folder when one exists; otherwise use the nearest appropriate hub, parent note, supporting-material document, roadmap reference, or other established access point.
-   Repository root should use `index.md`.
-   Every top-level folder should use its own `index.md`.
-   Whenever a new top-level child folder under `proad/` is created, an `index.md` must be created with it.
-   Index files explain purpose and point to major entry points.
-   Index files must never become file catalogs.
