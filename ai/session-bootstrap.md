---
id: session-bootstrap
type: bootstrap
status: active
scope: ai
applies_to: aia
updated: 2026-10-11
---

# Session Bootstrap

## Purpose

Define the mandatory session-start material the AIA must load before doing work in a PROAD.

After loading these documents, the AIA must comply with them for the rest of the session.

## Bootstrap Order

1. Read [`global-working-agreements.md`](./global-working-agreements.md).
2. Read [`proad-basics.md`](./proad-basics.md).
3. Read [`project-core-documents-agreements.md`](./project-core-documents-agreements.md).
4. Read [`project-resources-agreements.md`](./project-resources-agreements.md).
5. Read [`project-migrations.md`](./project-migrations.md).
6. Read [`context-agreements.md`](./context-agreements.md).
7. Read [`raw-agreements.md`](./raw-agreements.md). Do not enumerate or read top-level development Raw or `project/raw/` captures during ordinary bootstrap.
8. Read [`development-host-transfer-agreements.md`](./development-host-transfer-agreements.md).
9. Resolve the current installation's role from the exact top-level marker path `../raw/index.md`: if that file exists, classify the installation as the active development host; if it does not, classify it as an ordinary installation. Check only this marker during bootstrap; do not enumerate the directory or read other Raw captures.
10. Read [`roadmap-agreements.md`](./roadmap-agreements.md).
11. Read [`work-lifecycle-and-archiving-agreements.md`](./work-lifecycle-and-archiving-agreements.md).
12. Read [`template-maintenance-agreements.md`](./template-maintenance-agreements.md).
13. Read [`template-management-agreements.md`](./template-management-agreements.md).
14. Read [`development-backlog.md`](./development-backlog.md).
15. Read [`file-naming-standard.md`](./file-naming-standard.md).
16. Read [`../index.md`](../index.md).
17. Read [`index.md`](./index.md).
18. Read [`../project/project-overview.md`](../project/project-overview.md) as the concise orientation to the active project.
19. Read [`../project/ai/index.md`](../project/ai/index.md) to discover project-specific context, agreements, and workflows.
20. Read [`../project/ai/project-agreements.md`](../project/ai/project-agreements.md).
21. When the task concerns a subject governed by another project-specific agreement or workflow listed in `project/ai/index.md`, read and follow that document before acting.
22. If the task concerns repository structure or document placement, also read [`../index.md`](../index.md).

## Session Start Outcome

After loading the bootstrap documents, the AIA should:

-   operate in read-only mode until a valid standalone `GO` or `go`, unless the active project's approval model explicitly allows execution by another rule
-   understand the purpose, structure, and operating model of the PROAD workspace before storing or linking information
-   use the project overview as the primary concise orientation to project identity, scope, current engagement, state, limitations, and authoritative entry points
-   apply project-specific agreements together with repository-wide agreements, without treating duplicated or superseded local wording as a second generic framework
-   keep roadmap content minimal and route detailed information into `docs/`
-   understand Raw capture rules without loading Raw captures unless a defined trigger or current task makes one relevant
-   retain whether the current installation is the active development host or an ordinary installation, and apply the corresponding framework-edit authority
-   treat metadata as part of retrieval logic
-   avoid guessing filenames, destinations, metadata shape, or linkage
-   ask the smallest differentiating question whenever storage or referencing is not deterministic
-   output a shortest confirmation that the bootstrap context was adopted and state the resolved role, for example: `Bootstrap loaded. Rules adopted. Role: development host.` or `Bootstrap loaded. Rules adopted. Role: ordinary installation.`
