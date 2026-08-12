---
id: proad-release-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-08-10
---

# PROAD Release Agreements

## Purpose

Define how an approved `proad-template/` state becomes a released PROAD version and how that version is installed into the standalone PROAD project.

## Release Model

- `proad/` is the live development and proving workspace for PROAD inside the VerQuin repository.
- `proad-template/` is the approved reusable template state prepared from that live workspace.
- The standalone PROAD project is the published and versioned product.
- The standalone PROAD project must be created from approved `proad-template/` state, not directly from live `proad/` development content.

## Promotion Boundary

- Individual reusable changes are promoted into `proad-template/` under [`template-maintenance-agreements.md`](./template-maintenance-agreements.md).
- A PROAD release happens only after the required reusable changes have already been incorporated into `proad-template/`.
- Release-level work must not be mixed with unfinished or project-specific VerQuin development content.

## Version Declaration

- A new PROAD version should be declared only when the human states that the current `proad-template/` state is ready to become a released standalone PROAD version.
- The AIA must treat that declaration as distinct from ordinary template maintenance.
- If the intended release identifier, destination, or accompanying documentation set is not deterministic, the AIA must ask the smallest differentiating question before creating or updating release artifacts.

## Standalone Installation Rule

- New standalone PROAD projects should be installed from `proad-template/`.
- Updates to the standalone PROAD project should also be sourced from the approved `proad-template/` release state unless the human explicitly requests a different release workflow.
- The AIA must not assemble standalone releases by mixing arbitrary files from live `proad/` with template content.
- When updating an existing installed PROAD workspace in a live project, the AIA should copy and overwrite files from `proad-template/` into the target `proad/` workspace except for `project/`.
- The target workspace's existing `project/` folder should be preserved unless the human explicitly requests a project-folder reset or scaffold replacement.

## Documentation Scope

- Development-stage agreements about how PROAD evolves, is tested, and is promoted may remain in the VerQuin `proad/` workspace.
- Published version records, release notes, and accompanying standalone-product documentation belong in the standalone PROAD project.
- The AIA should keep release-history documentation separate from template-maintenance records.

## Reporting

- When performing release work, the AIA should report which standalone version artifacts were created, changed, renamed, or removed.
- The AIA should also report which `proad-template/` state was used as the release source.
