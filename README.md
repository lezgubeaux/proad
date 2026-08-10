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

This folder represents a PROAD workspace.

When PROAD is installed into another project, the contents of the approved template are copied into that project's `proad/` folder.

PROAD may also be installed inside an intentional sub-project of a larger client project, such as a plugin or other bounded component, when that sub-project needs its own local roadmap, docs, and AI guidance.

Install shape:

-   standalone PROAD project: template contents are installed directly into the standalone project root
-   client project using PROAD: template contents are installed into the client project's `proad/` subfolder

## Current Development State

The current PROAD system is being actively developed inside the VerQuin repository.

At this stage:

-   `D:\_www\verquin.net\_www-2026\proad\` is the live development and proving workspace
-   `D:\_www\verquin.net\_www-2026\proad\proad-template\` is the approved reusable template source
-   `D:\_www\proad\` is the intended standalone PROAD project for published versions

This is an explicit temporary operating state until PROAD development is no longer centered inside VerQuin.

## Current Version

The current PROAD version line is `v1.1.2`.

`v1.1.2` is the closing VerQuin-hosted working version.

## Development Host History

-   `VerQuin` hosted PROAD development for `v1.0` through `v1.1.2`.

This host history exists to make the current development source explicit and to avoid assuming that some other project is the active PROAD development container.

## Main Parts

-   [`index.md`](./index.md) explains the PROAD workspace structure and major entry points.
-   [`developer/`](./developer/index.md) contains human-facing guidance for working with PROAD itself.
-   [`ai/`](./ai/index.md) contains AI-side operating agreements and rules.

-   [`docs/`](./docs/index.md) contains the AI-managed knowledge repository for that project.
-   [`project/`](./project/index.md) contains the human-facing workspace for the project being operated through PROAD.
-   [`proad-template/`](./proad-template/index.md) contains the reusable template that is installed into project `proad/` folders.

## Scope Rule

Each installed `proad/` workspace should stay scoped to the project or sub-project where it is installed.

If PROAD is attached to a plugin or another bounded sub-project, that local `proad/` should support that sub-project only and should not drift into parent-project concerns.

## Release Files

-   [`CHANGELOG.md`](./CHANGELOG.md) records PROAD version history and the current release line.
