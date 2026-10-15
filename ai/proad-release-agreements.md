---
id: proad-release-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-03
---

# PROAD Release Agreements

## Purpose

Define how an approved `proad-template/` state becomes a released PROAD version.

## Release Model

- `proad/` is a live development and proving workspace for PROAD.
- `proad-template/` is the approved reusable template state produced from a live workspace during version promotion and is not required before promotion.
- The standalone PROAD project is the published and versioned product.
- The standalone PROAD project must be created from approved `proad-template/` state, not directly from live `proad/` development content.

## Promotion Boundary

- Individual reusable changes are prepared in the live host workspace under [`template-maintenance-agreements.md`](./template-maintenance-agreements.md).
- A PROAD version promotion creates the local `proad-template/` target when absent. It copies eligible live framework files outside `project/`, excludes the complete top-level development-host `raw/` directory, and obtains the complete `project/` tree only from an explicitly reviewed generic scaffold source, normally the existing approved template.
- Promotion derives the target directory tree only from files eligible for promotion or retention; it must not copy live directories independently or preserve an empty client-project directory whose files are excluded.
- No live `project/` file is promoted automatically, regardless of whether it is marked `overwrite`, `preserve`, or `exclude`.
- No top-level development Raw file is promoted. Reusable client Raw scaffolding exists only under `project/raw/` and comes from the reviewed generic project source.
- Retained template `exclude` files are included in new installations and skipped during existing-installation updates.
- Release-level work must not be mixed with unfinished or project-specific VerQuin development content.

## Version Declaration

- A new PROAD version should be declared only when the human states that the current `proad-template/` state is ready to become a released standalone PROAD version.
- The AIA must treat that declaration as distinct from ordinary reusable-change preparation.
- If the intended release identifier, destination, or accompanying documentation set is not deterministic, the AIA must ask the smallest differentiating question before creating or updating release artifacts.

## Promotion Approval

- Version-promotion approval is a two-stage decision: authorization to prepare a candidate, followed by approval of the exact candidate transaction and manifest hash before activation.
- Candidate preparation must not change the live workspace.
- Human checkout is authoritative for semantic reusable-content judgment; deterministic validation remains mandatory and cannot be waived.
- A changed candidate, source workspace, or approved project-scaffold source invalidates the prepared transaction and requires new preparation and approval.

## Working Version Log

- After a numbered PROAD version is promoted, `CHANGELOG.md` must contain an unnumbered `Working version` section immediately above the latest numbered version.
- The working version represents ongoing PROAD development whose eventual release number and version significance have not yet been decided.
- The section should contain a short summary list of meaningful changes accumulated since the latest numbered version.
- At any point during PROAD work, the AIA may determine that a completed `proad/` change is significant enough to add to the working-version summary without requiring a separate human instruction to log it.
- Routine wording corrections, incidental maintenance, and changes without meaningful release value do not need their own summary item.
- When the human promotes the next numbered version, the AIA must convert the accumulated working-version summary into that numbered version's entry and then create a new empty `Working version` section above it.
- A working-version summary item records development significance but does not itself authorize version promotion, release, or installation.

## Installation Reference

Promotion, new installations, and existing-installation updates must follow [`template-management-agreements.md`](./template-management-agreements.md).

## Documentation Scope

- Development-stage agreements about how PROAD evolves, is tested, and is promoted may remain in the VerQuin `proad/` workspace.
- Published version records, release notes, and accompanying standalone-product documentation belong in the standalone PROAD project.
- The AIA should keep release-history documentation separate from template-maintenance records.

## Reporting

- When performing release work, the AIA should report which standalone version artifacts were created, changed, renamed, or removed.
- The AIA should also report which `proad-template/` state was used as the release source.
