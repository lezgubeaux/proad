---
id: proad-changelog
type: changelog
status: active
scope: repository-root
updated: 2026-10-15
---

# Changelog

## Purpose

This file is reserved for published PROAD version history.

## Usage

-   Add entries here when an approved `proad-template/` state is released as a standalone PROAD version.
-   Do not use this file to log ordinary live development or individual template-maintenance steps.

## Working version

Unnumbered development line after `v4.3`.

-   Add entries here as meaningful reusable changes accumulate after `v4.3`.

## v4.3

Current version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Reframed the root README as a public, evaluator-facing introduction that explains PROAD's context-engineering problem, authority model, scope-drift protection, operating principles, and guided repository tour before installation details.
    -   Required every completed roadmap step or substep to have confirmed working time, an explicit non-chargeable decision, or a distinct deferred time-accounting marker; missing decisions now trigger a human-confirmed retrospective estimate rather than silent zero-time assumptions.
-   Notes: this version improves both public comprehension of the framework and explicit completion-time accountability.

## v4.2

Current version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Made version-specific project migrations a first-class reviewed part of existing-installation updates and recorded the required `v4.1` migration.
-   Notes: framework synchronization and declared project migrations now form one staged, reviewed, and verified update transaction without restoring blanket project overwrites.

## v4.1

Current version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Retired `template-management: overwrite` under `project/`, restored the complete client-ownership boundary for existing-installation updates, and moved reusable project-resource rules into framework `ai/`.
-   Notes: existing-installation updates now update framework files only and leave the complete client-owned `project/` tree unchanged; new project components require explicit project migrations.

## v4.0

Current version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Added quiet zero-friction Raw capture with minimal metadata, separating non-promotable top-level PROAD-development Raw from reusable `project/raw/` client scaffolding, with selective rummaging, temporary `USE / KEEP / DELETE` decisions, and mechanically enforced promotion boundaries.
    -   Defined a recoverable single-development-host transfer protocol for existing-client and new-installation targets, including exact migration of live framework state, approved template state, and development Raw while preserving both client project trees and cleaning the old host only after target verification.
    -   Replaced in-workspace promotion staging with a two-stage, externally backed up transaction requiring exact candidate approval, post-activation protected-workspace verification, and verified full-workspace recovery on failure.
    -   Restricted project metadata validation to YAML front matter so instructional examples cannot be mistaken for duplicate operational values.
    -   Made promotion cleanup remove the external transaction container when it is exactly identified and empty, while retaining non-empty or unexpected paths.
    -   Corrected the human usage guide to distinguish reusable-change preparation, two-stage version promotion, and release, and to describe `exclude` installation/update behavior accurately.
    -   Defined nested sub-PROAD installations as independent opaque workspaces, allowed explicit cross-links without management implications, and excluded sub-PROAD trees from promotion candidates while retaining byte-preserving backup protection.
    -   Removed the abandoned automated-updater proposal and made the direct metadata-driven existing-installation protocol authoritative, including complete exclusion of non-Markdown project files and explicit preservation and no-deletion rules.
-   Notes: this major version establishes the externally recoverable promotion model, explicit development-host transfer lifecycle, and separate framework and client Raw boundaries.

## v3.2

Current version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Revalidated the corrected promotion boundary through a second complete version promotion using the approved generic project scaffold tree.
-   Notes: this version confirms repeatable promotion without importing live client-project content.

## v3.1

Previous corrective version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Corrected promotion so the complete live client `project/` tree is excluded from automatic copying regardless of file metadata.
    -   Required the promoted project tree to come from one explicitly reviewed generic scaffold source.
    -   Added staged local-link validation and optional client-marker rejection before template activation.
    -   Rebuilt the generic project scaffolds without client content and restored missing project-AI linkage.
-   Notes: this version corrects the v3.0 promotion-selection defect while retaining its transactional staging, source-integrity, and rollback safeguards.

## v3.0

Previous major version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Added completed-work lifecycle and archiving agreements covering active todo cleanup, durable-delivery continuity, consolidation, archival, removal, reference maintenance, and post-change verification.
    -   Added a mandatory PowerShell-compatible promotion tool with read-only validation, isolated fault testing, transactional staging, explicit new-scaffold approval, hash verification, and rollback activation.
    -   Prevented empty client-only directories from entering the template by deriving its directory tree exclusively from eligible files and verifying exact staged directory parity.
    -   Allowed missing header-only context scaffolds to be initialized during existing-installation updates without overwriting or importing populated client context.
    -   Added preserved project overview and project changelog scaffolds as standard, discoverable project documents with distinct responsibilities from the roadmap, resources, context, task records, and framework changelog.
    -   Required existing projects to initialize new core-document scaffolds from established information and made major engagement facts discoverable through natural overview and roadmap paths.
    -   Made the human-facing project overview mandatory AIA orientation and linked it from the project-AI entry point without conflating it with optional context documents.
    -   Simplified roadmap governance into one lifecycle-based information-management agreement and made project-specific agreements part of mandatory session bootstrap without adding another validation layer.
    -   Made template promotion mechanically read-only toward the complete live PROAD source, with explicit `exclude` semantics and before/after path-and-content-hash verification that rolls template activation back on any source drift.
-   Notes: this major version establishes mechanically enforced promotion safety and the expanded standard project-information model.

## v2.3

Current version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Added discoverable, non-automatic project-context files with a mandatory general scaffold, specialized context conventions, synchronized reference maintenance, and safe one-time template introduction for new excluded scaffolds.
-   Notes: this workspace is the active PROAD development host for the `v2.3` line.

## v2.2

Previous version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Fixed new project installation requirements so an installed PROAD workspace no longer needs to contain a `proad-template/` folder.
    -   Made version promotion transactional through mandatory runtime preflight, fail-fast execution, verified sibling staging, atomic-style activation, rollback preservation, and isolated safety testing.
-   Notes: this workspace is the active PROAD development host for the `v2.2` line.

## v2.1

Previous version line.

-   Status: active
-   Development host: `Leunovo`
-   Changes:
    -   Replaced `installation-update` with unified `template-management` metadata using `overwrite`, `preserve`, and `exclude` across promotion, new installation, and existing-installation updates.
    -   Defined excluded template scaffolds as new-installation content that is retained during promotion and skipped during existing-installation updates, while live client-owned counterparts are not promoted.
    -   Separated reusable project hubs from client-specific resource entries, supporting-material entries, operational tasks, and project agreements.
    -   Formalized roadmap-step responsibilities for descriptions, outcomes, task execution, canonical deliveries, supporting evidence, discoverability, and completion.
-   Notes: this workspace is the active PROAD development host for the `v2.1` line.

## v2.0

Previous version line.

-   Status: previous
-   Development host: `Leunovo`
-   Changes:
    -   Added the mandatory working-graphics scaffold, including the general editable-source and export-master assets area, local Git-ignore behavior, supporting-material hub linkage, and governing agreements.
    -   Added deterministic project-only installation metadata, overwrite/preserve update behavior, and separate preserved files for supporting-material entries, resource entry points, and operational tasks.
    -   Added a bootstrap-discoverable PROAD development backlog with a detailed deferred proposal for an automated installation updater.
    -   Simplified version promotion into a mechanical whole-state copy from live PROAD and removed the obsolete selective project-promotion workflow.
-   Notes: this workspace is the active PROAD development host for the `v2.0` line.

## v1.4

Previous version line.

-   Status: previous
-   Development host: `Leunovo`
-   Changes:
    -   Added an unnumbered working-version log for concise summaries of meaningful changes between numbered releases.
    -   Added the human-facing `project/docs/index.md` scaffold to keep the mandatory supporting-document folder present and locally explained.
    -   Added the mandatory human-facing `project/todo-list.md` scaffold for operational tasks outside the roadmap.
    -   Restricted `proad-template/` updates to version promotion and moved reusable-change preparation entirely into the live host workflow.
    -   Integrated the reusable project-resources hub, expansion folder, maintenance agreement, and index references into the live PROAD source.
-   Notes: this was the approved reusable source for the `v1.4` line.

## v1.3.1

Previous version line.

-   Status: previous
-   Development host: `Leunovo`
-   Notes: this was the approved reusable source for the `v1.3.1` line.

## v1.3

Previous version line.

-   Status: previous
-   Development host: `Leunovo`
-   Notes: this was the approved reusable source for the `v1.3` line.

## v1.2.2

Previous version line.

-   Status: previous
-   Development host: `Leunovo`
-   Notes: this was the approved reusable source for the `v1.2.2` line.

## v1.2.1

Previous version line.

-   Status: previous
-   Development host: `Leunovo`
-   Notes: this was the approved reusable source for the `v1.2.1` line.

## v1.2

Previous version line.

-   Status: previous
-   Development host: `Leunovo`
-   Notes: this was the approved reusable source for the `v1.2` line.

## v1.1.2

Previous version line.

-   Status: previous
-   Development host: `VerQuin`
-   Notes: this was the approved reusable source for the `v1.1.2` line.
-   formalized PROAD release/install structure and version tracking
-   added human-facing usage guidance and root-level product docs
-   clarified template promotion, standalone installation, and client/sub-project installation boundaries
-   added scope safeguards for independently installed PROAD workspaces

## v1.1

Previous version line.

-   Status: previous
-   Development host: `VerQuin`
-   Standalone target: `D:\_www\proad`
-   Notes: current approved template state is promoted from the VerQuin `proad/` workspace into `proad-template/`, then into the standalone PROAD project.
-   Notes: this was the approved reusable source for the `v1.1` line.

## v1.0

Previous version line.

-   Status: previous
-   Development host: `VerQuin`
-   Notes: initial tracked PROAD version line before the current `v1.1` line.
