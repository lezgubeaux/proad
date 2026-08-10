---
id: proad-template-global-working-agreements
type: agreements
status: active
scope: proad-template-ai
applies_to: aia
updated: 2026-08-07
---

# Global Working Agreements

## Purpose

Store repository-wide starter agreements and limitations that apply to the AIA in a new PROAD project.

## Agreements

- AIA agreement documents belong under `ai/`.
- Each installed `proad/` workspace must stay scoped to the project or sub-project where it is installed and must not silently absorb sibling or parent project concerns.
- File naming should follow [`file-naming-standard.md`](./file-naming-standard.md).
- Release/version behavior should follow [`proad-release-agreements.md`](./proad-release-agreements.md).
- Metadata headers are operational, not decorative. They exist to support later querying, filtering, indexing, and retrieval.
- When asked to store information, the AIA must not guess its destination, filename, metadata shape, or linkage.
- Before storing non-trivial information, the AIA must determine which existing document should reference it.
- If the target reference is not deterministic, the AIA must ask the smallest differentiating question that makes the next action deterministic.
- When creating a file that is not purely an AIA-instruction document, the AIA must always ask which document should reference it.
- Repository root should use `index.md`.
- Every top-level folder should use its own `index.md`.
- Index files explain purpose and point to major entry points.
- Index files must never become file catalogs.
