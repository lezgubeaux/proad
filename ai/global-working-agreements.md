---
id: global-working-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-11
---

# Global Working Agreements

## Purpose

Store repository-wide working agreements and limitations that apply to the AIA across the entire PROAD workspace.

## GO Rule

-   Execution is read-only by default until the user sends a valid standalone `GO` or `go`.
-   `GO` authorizes only the immediately following assistant response.
-   After that single response, execution permission expires automatically and the assistant returns to read-only mode.
-   If approval is not written as a standalone `GO` line, it does not unlock execution.
-   Within that one authorized response, `GO` covers the complete plan the AIA stated before approval; it is not granted one file or operation at a time. The AIA must not request approval again part-way through that unchanged plan.
-   If execution reveals that the approved plan is materially wrong, incomplete, or requires expanded scope, the AIA must stop, explain the revised plan, and obtain a new `GO` rather than improvise beyond the authorization.
-   The `GO` gate applies to every execution performed during the session, including an explicitly authorized operation outside `proad/`. PROAD's workspace scope determines which agreements govern the content; it does not make execution elsewhere ungated.

## File Inspection

-   Use dedicated file tools to read files, list or match paths, and search file contents. Prefer them over shell commands.
-   Do not use a shell merely to inspect files. This includes `cat`, `head`, `tail`, `grep`, `ls`, `find`, `sed`, `awk`, `type`, `Get-Content`, `Select-String`, `Get-ChildItem`, or a scripting language invoked only to print or match file content.
-   Reserve shell commands for operations that run, such as builds, tests, linters, package managers, version control, development servers, and one-off computations such as timestamps or checksums.
-   If the environment provides no suitable dedicated file tool, a narrowly targeted shell read is allowed. State that limitation in one line before using it.
-   Do not run exploratory or confirmation commands merely to double-check. Treat a successful edit report as confirmation that the edit succeeded. If material information remains unclear, ask the human instead of probing broadly.
-   Prefer one targeted read to multiple broad scans. Read only the portion needed for the current task.

## Development-Host Authority

-   Ordinary reusable-framework development and reusable-change preparation may modify framework-controlled files only in the single active development-host `proad/` workspace.
-   In an ordinary non-host installation, framework-controlled files outside `project/` must not be edited to introduce or prepare reusable framework behavior. Capture or describe the requested framework change and route its implementation to the active development host instead.
-   This restriction does not prohibit changes made by an explicitly authorized installation update, project migration, development-host transfer, or other controlled process governed by its own agreements. Such a process may modify only the files and workspaces its procedure permits.
-   Project-specific work remains governed separately by the active installation's project agreements and does not confer authority to develop the reusable framework there.

## Current Rules

-   Work should be advisory-first unless the human explicitly authorizes execution.
-   GitHub repository access is available to the AIA as read-only.
-   The AIA must not use git unless the human explicitly asks for git actions.
-   The AIA must not browse the web, use plugins, or use external connectors unless the human explicitly asks for them.
-   These agreements govern the current `proad/` workspace. This content boundary does not exempt any outside operation from the session-wide `GO` gate.
-   Unless explicitly instructed otherwise, the AIA must operate only within `proad/` and treat work outside it as out of scope.
-   Each PROAD governs only its own workspace. A nested directory that is itself a PROAD installation is an independent sub-PROAD and must be treated as an opaque boundary by the active PROAD: it must not be interpreted, indexed, reorganized, updated, promoted, or otherwise managed unless the human explicitly activates that installation. Explicit links to or from a sub-PROAD are allowed and do not confer management authority. Safety backup and integrity verification may preserve it byte-for-byte without treating its content as part of the active PROAD.
-   AIA rule documents belong under `ai/`.
-   An installed `proad/` workspace does not need to contain a `proad-template/` folder.
-   If `proad-template/` is absent when version promotion is authorized, the AIA must create it as part of the promotion process.
-   File naming should follow [`file-naming-standard.md`](./file-naming-standard.md).
-   Raw capture and promotion-time rummaging should follow [`raw-agreements.md`](./raw-agreements.md).
-   The single active development-host role may move only under [`development-host-transfer-agreements.md`](./development-host-transfer-agreements.md).
-   Project-context handling should follow [`context-agreements.md`](./context-agreements.md).
-   Project overview and project changelog handling should follow [`project-core-documents-agreements.md`](./project-core-documents-agreements.md).
-   Note handling should follow [`notes-agreements.md`](./notes-agreements.md).
-   Completed-work lifecycle and archive handling should follow [`work-lifecycle-and-archiving-agreements.md`](./work-lifecycle-and-archiving-agreements.md).
-   Supporting material handling should follow [`supporting-material-agreements.md`](./supporting-material-agreements.md).
-   Roadmap behavior should follow [`roadmap-agreements.md`](./roadmap-agreements.md).
-   Promotion, installation, and update behavior for `project/` files should follow [`template-management-agreements.md`](./template-management-agreements.md).
-   Version-specific project changes required by an existing-installation update must follow [`project-migrations.md`](./project-migrations.md).
-   Release/version behavior should follow [`proad-release-agreements.md`](./proad-release-agreements.md).
-   Reusable-change preparation and template promotion behavior should follow [`template-maintenance-agreements.md`](./template-maintenance-agreements.md).
-   The AIA must not edit `proad-template/` during ordinary live `proad/` work.
-   `proad-template/` may be edited only during version-promotion work.
-   Ordinary PROAD development should happen in the live `proad/` workspace, while `proad-template/` should be treated as an optional promotion target only.
-   Metadata headers are operational, not decorative. They exist to support later querying, filtering, indexing, and retrieval.
-   Operational metadata is authoritative for live installed `proad/` workspaces. `proad-template/` is excluded from strict metadata identity with live `proad/` when template-specific header values or references are required.
-   When asked to store information, the AIA must not guess its destination, filename, metadata shape, or linkage.
-   Before storing non-trivial information, the AIA must determine which existing document should reference it.
-   If the target reference is not deterministic, the AIA must ask the smallest differentiating question that makes the next action deterministic.
-   When creating a file that is not purely an AIA-instruction document, the AIA must always ask which document should reference it.
-   Any newly added non-instruction file should be linked from an appropriate existing access document. The preferred default is the `index.md` of the same folder when one exists; otherwise use the nearest appropriate hub, parent note, supporting-material document, roadmap reference, or other established access point.
-   Raw captures are the deliberate exception to ordinary per-file linkage: they remain quietly discoverable through their applicable top-level development-host `raw/` or client `project/raw/` area and do not require cataloguing or an incoming link merely to exist.
-   Repository root should use `index.md`.
-   Every top-level folder should use its own `index.md`.
-   Whenever a new top-level child folder under `proad/` is created, an `index.md` must be created with it.
-   Index files explain purpose and point to major entry points.
-   Index files must never become file catalogs.
