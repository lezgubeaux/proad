---
id: template-management-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-03
---

# Template Management Agreements

## Purpose

Define the ownership boundary between reusable PROAD framework files and client-owned `project/` content during promotion, installation, and updates.

## Ownership Rule

- Everything under an installed `project/` is client-owned.
- Framework synchronization must not mutate the target `project/` tree. Only an applicable declared migration governed by [`project-migrations.md`](./project-migrations.md) may make separately reviewed project changes.
- Reusable rules that must propagate to every installation belong outside `project/`, normally under `ai/`.
- `template-management: overwrite` is retired and invalid under `project/`.

## Project Metadata

Project Markdown may use:

- `template-management: preserve` for a reusable starter scaffold whose installed copy becomes client-owned; or
- `template-management: exclude` for client-owned content or a starter whose live counterpart must never become reusable source content.

These values help classify scaffolds and live content. Neither value authorizes mutation during an existing-installation update.

## Version Promotion

- The complete live `project/` tree is never an automatic promotion source.
- Project scaffolds come only from an existing approved template or a separate explicitly reviewed generic project source outside live `project/`.
- A reviewed generic project source must contain exactly one supported project metadata value in each Markdown file and no client content.
- Top-level development-host `raw/` is excluded completely and must be mechanically rejected from a candidate.
- Client Raw captures never enter the generic project source; only the generic `project/raw/index.md` scaffold may be present there.
- Promotion must not mutate live `project/`.

## New Installation

- Copy the complete approved template into the new installation.
- Every included generic project scaffold is copied, regardless of whether it uses `preserve` or `exclude`.
- The installed `project/` becomes client-owned immediately.
- New installations receive generic `project/raw/index.md` and no top-level development Raw.

## Existing Installation Update

1. Resolve and validate the approved template source and explicit target installation.
2. Prove that source and target are distinct and do not overlap recursively.
3. Determine every applicable migration from [`project-migrations.md`](./project-migrations.md) and classify its pre-update state.
4. Stage framework files outside `project/` by creating missing files and overwriting matching files.
5. In the same staged transaction, apply only the exact declared project migrations proposed in the review.
6. Preserve every unrelated project path and every target-only framework path; delete nothing except a verified removal explicitly declared by an applicable migration.
7. Verify copied framework files against their source, verify the exact approved project differences, and prove every unaffected project path byte-for-byte unchanged.
8. Report framework synchronization and project migrations separately. Do not call the update complete while an applicable migration remains pending or conflicted unless the human explicitly defers it.

## Development-Host Transfer

Development-host transfer follows [`development-host-transfer-agreements.md`](./development-host-transfer-agreements.md). Neither host's client `project/` may populate or replace the other's.
