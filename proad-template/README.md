---
id: proad-readme
type: readme
status: active
scope: repository-root
updated: 2026-08-11
---

# PROAD

PROAD is a plain-Markdown human-AI collaboration framework for operating a project through a bounded `proad/` workspace.

## What This Folder Represents

This folder represents a PROAD workspace.

When PROAD is installed into another project, the contents of the approved template are copied into that project's `proad/` folder.

PROAD may also be installed inside an intentional sub-project of a larger client project, such as a plugin or other bounded component, when that sub-project needs its own local roadmap, docs, and AI guidance.

Install shape:

-   standalone PROAD project: template contents are installed directly into the standalone project root
-   client project using PROAD: template contents are installed into the client project's `proad/` subfolder

## Session Start

To start a PROAD session, point the AIA to [`ai/session-bootstrap.md`](./ai/session-bootstrap.md).

The session bootstrap file is the required entry point for loading PROAD working context.

## Current Version

The current PROAD version line is `v1.2.1`.

`v1.2.1` is the current Leunovo-hosted development line.

## Development Host History

-   `VerQuin` hosted PROAD development for `v1.0` through `v1.1.2`.
-   `Leunovo` hosts PROAD development from `v1.2` onward.

This host history exists to make the current development source explicit and to avoid assuming that some other project is the active PROAD development container.

## Main Parts

-   [`index.md`](./index.md) explains the PROAD workspace structure and major entry points.
-   [`developer/`](./developer/index.md) contains human-facing guidance for working with PROAD itself.
-   [`ai/`](./ai/index.md) contains AI-side operating agreements and rules.
-   [`project/`](./project/index.md) contains the human-facing workspace for the project being operated through PROAD.
-   [`docs/`](./docs/index.md) contains the AI-managed knowledge repository for that project.
-   [`proad-template/`](./proad-template/index.md) contains the reusable template maintained from the active PROAD development host.

## Scope Rule

Each installed `proad/` workspace should stay scoped to the project or sub-project where it is installed.

If PROAD is attached to a plugin or another bounded sub-project, that local `proad/` should support that sub-project only and should not drift into parent-project concerns.

## Release Files

-   [`CHANGELOG.md`](./CHANGELOG.md) records PROAD version history and the current release line.
