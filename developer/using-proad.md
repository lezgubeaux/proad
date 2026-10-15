---
id: using-proad
type: guide
status: active
scope: developer
updated: 2026-10-03
---

# Using PROAD

## Purpose

This guide explains how to ask for common PROAD-level actions without needing to know the internal AI-side process.

## Core Rule

You may request PROAD actions in plain human language.

You do not need to describe the internal promotion, release, installation, or update mechanics unless you want to constrain them.

If a required detail is not deterministic, the AIA should ask the smallest differentiating question before acting.

## Session Start

To start a PROAD session, point the AIA to [`../ai/session-bootstrap.md`](../ai/session-bootstrap.md).

That file is the required session-start entry point.

## Structure Model

- `proad/` is the bounded PROAD workspace inside a project or standalone PROAD release.
- `proad-template/` is a version-promotion output and installation source that models the inside of an installed `proad/` folder.
- An installed PROAD workspace does not need to contain `proad-template/`; version promotion creates it when absent.
- Installing PROAD into a client project means copying the contents of `proad-template/` into that project's `proad/` folder.
- PROAD may also be installed as an independent sub-PROAD inside a plugin or another bounded component by placing a separate `proad/` folder there.
- Installing or updating the standalone PROAD project means copying the contents of `proad-template/` into the standalone project root.
- The standalone PROAD project is a separate published/versioned product and is not the same thing as the live host project used for ongoing PROAD development.
- Each installed `proad/` workspace governs only its own declared scope. A nested sub-PROAD remains independent and opaque to ordinary recursive management by another PROAD, while explicit links between them remain allowed.

## Current Development State

The current host project and version-line context are documented in [`../README.md`](../README.md).

That file is the authoritative human-facing overview for where PROAD is currently being developed and which version line is active.

## Common Actions

### Capture something before its destination is known

Use Raw when a project-relevant thought or discussion is worth preserving but is not mature enough to classify.

Example request:

- "Put this in Raw."

For ordinary client-project thinking, the AIA creates a date-prefixed Markdown capture under [`../project/raw/`](../project/raw/index.md) with minimal metadata and the complete useful context. On the active PROAD development host only, thinking about PROAD itself belongs in top-level `raw/`. Both areas remain quiet: neither is loaded during ordinary bootstrap nor becomes a user-maintained inbox.

If the active AI cannot safely write into the local PROAD, ask it for a correctly named downloadable Raw file and place client-project material in `proad/project/raw/`. Do not grant repository-write authority or require branch knowledge merely to capture a thought.

### Move PROAD development to another host

Use this only when another PROAD workspace should take over all ongoing PROAD framework development.

Example request:

- "Prepare to move the PROAD development-host role from this workspace to `<target>`."

The target may be an existing client's installed PROAD or a new installation. In either case, its own `project/` remains its project: client content is never copied from the old host. The transfer separately carries the current live framework state, the approved `proad-template/` baseline when present, and the complete top-level development `raw/`.

The operation is prepared and reviewed before either workspace changes. After approval, the target is validated first; only then is development-only state removed from the old host. Completion requires exactly one host with top-level `raw/index.md`. See [`../ai/development-host-transfer-agreements.md`](../ai/development-host-transfer-agreements.md).

### Prepare reusable PROAD changes

Use this when the current live PROAD development contains an improvement that should be prepared as reusable PROAD behavior for a later version promotion.

Example requests:

- "Prepare the current PROAD change as reusable behavior for the next version promotion."
- "Make the last approved PROAD change ready for the next version."

This preparation happens in the live workspace and does not create or edit `proad-template/`.

### Promote a new PROAD version

Use this when the current live reusable framework state should become the next approved `proad-template/` state.

Example requests:

- "Prepare the real PROAD version-promotion candidate."
- "Promote the approved candidate into `proad-template/`."

Before candidate preparation, the AIA selectively rummages through top-level PROAD-development Raw, when that host-only directory exists, and surfaces only captures that may matter to the version being started. Client `project/raw/` is not part of this promotion trigger. The temporary decisions are `USE`, `KEEP`, or `DELETE`. If nothing is relevant, promotion continues without a Raw review burden.

Promotion is then a two-stage transaction:

1. Candidate preparation creates and verifies an external backup, builds the proposed template outside `proad/`, validates it, and presents its exact transaction ID, manifest hash, and differences for human review. It does not change the active template.
2. After the human approves that exact candidate, a separately authorized commit revalidates the source and candidate, replaces only `proad-template/`, and verifies both the activated template and the complete protected workspace.

If activation or post-validation fails, the maintained procedure restores and verifies the complete pre-promotion workspace. Human approval determines whether candidate content is intentionally reusable, complete, generic, and free of client-specific knowledge; it cannot override failed deterministic checks.

### Release a new PROAD version

Use this when the current approved `proad-template/` state should become a new standalone PROAD version.

Example requests:

- "Release a new PROAD version from the current template state."
- "Declare the current `proad-template/` state as the next PROAD version."

Release consumes an already approved `proad-template/` state. It does not perform, repeat, or substitute for version promotion.

### Install PROAD into a new project

Use this when a new project should receive PROAD from the approved template state.

Example requests:

- "Install PROAD into a new project from the current approved template."
- "Create a new PROAD project from `proad-template/`."

Installed result:

- client project: template contents are copied into the target project's `proad/` folder
- standalone PROAD project: template contents are copied into the standalone project root
- the template is not installed as `proad-template/`
- the template does not need its own nested `proad/` folder

### Update an existing standalone PROAD project

Use this when a standalone PROAD project should be refreshed from a newer approved template state.

Example requests:

- "Update the standalone PROAD project from the current approved template."
- "Apply the latest approved template state to the standalone PROAD project."

### Update PROAD in an existing project

Use this when an existing project's installed `proad/` workspace should be refreshed from the current approved template.

Example request:

- "Update the installed PROAD workspace from the current approved template."

Update behavior:

- approved template files outside `project/` are copied into the installed `proad/` workspace
- `project/raw/index.md` follows its project metadata while all existing client Raw captures are preserved untouched
- framework synchronization leaves the complete existing `project/` tree unchanged
- applicable version-specific project migrations are detected, staged, and shown separately for approval
- migrations may make only their declared narrow project changes and must preserve all unrelated client content
- the update is complete only when both framework synchronization and applicable project migrations verify successfully, unless a migration is explicitly deferred
- non-Markdown files under `project/` are skipped completely during an existing-installation update: they are not created, overwritten, compared, validated, moved, or deleted
- target-only content is preserved
- an existing-installation update deletes nothing unless the human separately and explicitly authorizes a removal

## What The AIA May Need To Ask

The AIA should only ask follow-up questions when a required detail is not deterministic.

Typical examples include:

- target folder or destination
- version identifier
- whether the request is about live development, reusable-change preparation, version promotion, or standalone release
- whether a development-host transfer target is an existing client PROAD or a new installation
- which reviewed generic project-scaffold source should be used when no approved template exists or project scaffolds are changing
- whether the human approves the exact prepared promotion transaction and candidate-manifest hash
- which accompanying documentation should be created or updated
