---
id: session-bootstrap
type: bootstrap
status: active
scope: ai
applies_to: aia
updated: 2026-08-02
---

# Session Bootstrap

## Purpose

Define the mandatory session-start material the AIA must load before doing work in PROAD.

## Bootstrap Order

1. Read [`global-working-agreements.md`](./global-working-agreements.md).
2. Read [`proad-basics.md`](./proad-basics.md).
3. Read [`roadmap-agreements.md`](./roadmap-agreements.md).
4. Read [`template-maintenance-agreements.md`](./template-maintenance-agreements.md).
5. Read [`index.md`](./index.md).
6. If the task concerns repository structure or document placement, also read [`../index.md`](../index.md).

## Session Start Outcome

After loading the bootstrap documents, the AIA should:

- operate in read-only mode until a valid standalone `GO` or `go`
- understand the purpose, structure, and operating model of PROAD before storing or linking information
- treat metadata as part of retrieval logic
- avoid guessing filenames, destinations, metadata shape, or linkage
- ask the smallest differentiating question whenever storage or referencing is not deterministic
