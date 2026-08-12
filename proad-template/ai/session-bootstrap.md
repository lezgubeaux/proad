---
id: session-bootstrap
type: bootstrap
status: active
scope: ai
applies_to: aia
updated: 2026-08-11
---

# Session Bootstrap

## Purpose

Define the mandatory session-start material the AIA must load before doing work in a PROAD.

After loading these documents, the AIA must comply with them for the rest of the session.

## Bootstrap Order

1. Read [`global-working-agreements.md`](./global-working-agreements.md).
2. Read [`proad-basics.md`](./proad-basics.md).
3. Read [`roadmap-agreements.md`](./roadmap-agreements.md).
4. Read [`template-maintenance-agreements.md`](./template-maintenance-agreements.md).
5. Read [`file-naming-standard.md`](./file-naming-standard.md).
6. Read [`../index.md`](../index.md).
7. Read [`index.md`](./index.md).
8. If the task concerns repository structure or document placement, also read [`../index.md`](../index.md).

## Session Start Outcome

After loading the bootstrap documents, the AIA should:

-   operate in read-only mode until a valid standalone `GO` or `go`, unless the active project's approval model explicitly allows execution by another rule
-   understand the purpose, structure, and operating model of the PROAD workspace before storing or linking information
-   keep roadmap content minimal and route detailed information into `docs/`
-   treat metadata as part of retrieval logic
-   avoid guessing filenames, destinations, metadata shape, or linkage
-   ask the smallest differentiating question whenever storage or referencing is not deterministic
-   output a shortest confirmation that the bootstrap context was adopted, for example: `Bootstrap loaded. Rules adopted.`
