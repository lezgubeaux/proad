---
id: proad-readme
type: readme
status: active
scope: repository-root
updated: 2026-08-10
---

# PROAD

PROAD is a plain-Markdown human-AI collaboration framework for operating a project through a bounded `proad/` workspace.

## What This Folder Represents

This folder represents the contents of an installed `proad/` folder.

When PROAD is installed into another project, the contents of this template are copied into that project's `proad/` folder.

PROAD may also be installed inside an intentional sub-project of a larger client project, such as a plugin or other bounded component, when that sub-project needs its own local roadmap, docs, and AI guidance.

Install shape:

- standalone PROAD project: these template contents are installed directly into the standalone project root
- client project using PROAD: these template contents are installed into the client project's `proad/` subfolder

## Current Version

The current PROAD version line is `v1.1.2`.

This template represents the approved reusable source for that current version line.

## Development Host History

- `VerQuin` hosted PROAD development for `v1.0` through `v1.1.2`.

This host history exists to make the current development source explicit and to avoid assuming that some other project is the active PROAD development container.

## Main Parts

- [`index.md`](./index.md) explains the PROAD workspace structure and major entry points.
- [`developer/`](./developer/index.md) contains human-facing guidance for working with PROAD itself.
- [`ai/`](./ai/index.md) contains AI-side operating agreements and rules.
- [`project/`](./project/index.md) contains the human-facing workspace for the project being operated through PROAD.
- [`docs/`](./docs/index.md) contains the AI-managed knowledge repository for that project.

## Scope Rule

Each installed `proad/` workspace should stay scoped to the project or sub-project where it is installed.

If PROAD is attached to a plugin or another bounded sub-project, that local `proad/` should support that sub-project only and should not drift into parent-project concerns.

## Release Files

- [`CHANGELOG.md`](./CHANGELOG.md) records PROAD version history and the current release line.
