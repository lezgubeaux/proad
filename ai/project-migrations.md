---
id: project-migrations
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-04
---

# Project Migrations

## Purpose

Define the controlled project changes that accompany a PROAD framework update when a version introduces, relocates, or retires project components.

## Update Model

An existing-installation update has two distinct parts:

1. **Framework synchronization** updates files outside `project/` from the approved template and does not mutate `project/`.
2. **Declared project migrations** apply only the version-specific project changes recorded in this document.

Both parts belong to one prepared update transaction and one review report. Keeping them distinct protects client content without leaving an installation structurally incomplete.

## Migration Rules

- Determine the installed and target PROAD versions before preparation.
- Evaluate every migration newer than the installed version and no newer than the target version.
- Classify each migration as `pending`, `already-applied`, `not-applicable`, or `conflict` before mutation.
- A migration may add a missing file, make a narrowly defined semantic edit, move a known component, or remove a verified obsolete framework scaffold.
- Never replace a complete existing project file with its generic template counterpart.
- Preserve all unrelated content, ordering, links, metadata, and formatting.
- Remove an obsolete file only when its identity and unchanged legacy content are verified. If it contains client changes, preserve it and report a conflict.
- Apply framework synchronization and migrations to an external staged copy after verifying a complete backup.
- The review must show every proposed project addition, edit, move, and removal separately from framework copies.
- Activation requires explicit approval of the exact staged result.
- After activation, verify the framework source parity, the exact approved project differences, all unaffected project files, and local links.
- An update is not complete while an applicable migration is pending or conflicted. It may be reported as framework-updated/project-migration-incomplete only when the human deliberately defers that migration.
- Migrations must be idempotent: rerunning detection after success must classify them as `already-applied` and propose no further mutation.

## v4.1 Project Migration

Applies when an installation older than `v4.1` is updated to `v4.1` or later.

Required result:

1. `project/raw/index.md` exists as the generic Project Raw scaffold. Create it only when missing; never replace an existing Project Raw index or capture.
2. `project/index.md` contains one major-entry-point link to `raw/index.md`. Add only the missing entry without replacing the surrounding client index.
3. `project/ai/index.md` links to `../../ai/project-resources-agreements.md`. Replace the exact legacy `resources-agreements.md` entry when present; add the framework link when neither entry exists; stop on ambiguous or conflicting entries.
4. `project/ai/resources-agreements.md` is removed only when it exactly matches the known pre-v4.1 generic scaffold. Preserve a modified copy and report a conflict requiring human reconciliation.
5. Every project metadata header using the retired exact value `template-management: overwrite` changes only that value to `template-management: preserve`; no other file content changes through this step.
6. All client-authored project content and every unrelated project path remain unchanged.
7. All links affected by the migration resolve after staging.

The migration is already applied only when all required results hold and no retired `overwrite` value remains under `project/`.
