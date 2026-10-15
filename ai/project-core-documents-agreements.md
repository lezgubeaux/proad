---
id: project-core-documents-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-09-16
---

# Project Core Documents Agreements

## Purpose

Define the responsibilities and maintenance boundaries of the standard project overview and project changelog.

## Required Documents

Every PROAD project must contain:

-   `project/project-overview.md`
-   `project/changelog.md`

Both files must use `template-management: preserve`. New installations receive generic starter versions. Framework synchronization does not mutate `project/`; adding either missing document to an existing installation requires an applicable declared migration under [`project-migrations.md`](./project-migrations.md).

Both files are major human-facing project entry points and must be linked from `project/index.md`.

## Existing-Project Initialization

When these documents are introduced into an existing active project, adding blank starter scaffolds is not sufficient. In the same approved change, the AIA must initialize them from established project information, without inventing facts or copying reusable client content into `proad-template/`.

If essential information is uncertain, the overview must link the authoritative source or identify the uncertainty rather than leave an apparently installed but operationally empty entry point.

## Project Overview

`project/project-overview.md` provides a concise, durable explanation of the active project.

It should help a human or AIA understand:

-   the project name, purpose, intended outcome, and value
-   scope and important operating concepts
-   current capabilities
-   structure and major entry points
-   where configuration and maintenance are managed
-   where environments and important URLs can be found through project resources
-   current limitations
-   unresolved or unconfirmed information
-   where meaningful project changes are recorded

The overview summarizes and links. It must not replace or duplicate the roadmap, resources hub, project context, task records, deliveries, or detailed knowledge documents.

The overview must link to `project/changelog.md`.

## AIA Awareness

-   Human-facing does not mean human-only. The AIA must know that the project overview exists and use it as the primary concise project-orientation document.
-   The session bootstrap must load `project/project-overview.md` after the framework operating documents and indexes.
-   `project/ai/index.md` must link to `../project-overview.md` and identify its orientation role for the AIA.
-   The AIA should direct a human to the overview when it is the clearest answer or navigation starting point, while following its links to authoritative detailed records when necessary.
-   The overview does not replace optional context documents. Context may provide deeper or task-bounded narrative; the overview remains the stable orientation and navigation hub.
-   Overview links in the bootstrap, project index, and project-AI index must be updated together if the overview path changes.

## Human Retrieval And Discoverability

-   Major project facts must be reachable through the documents a human would naturally consult for the corresponding question.
-   The overview must expose the project's current engagement, governing scope, or equivalent high-level operating boundary when one exists.
-   Detailed commercial terms, approvals, or engagement boundaries should live in a clearly named authoritative document and be summarized and linked from the overview.
-   When a roadmap phase is governed by a distinct approval or commercial boundary, the relevant roadmap item must link directly to that record.
-   A technically valid storage location is not sufficient when the information remains hidden behind an unrelated filename or has no obvious navigation path.
-   The AIA must maintain these links when the authoritative record is added, moved, renamed, superseded, or removed.

## Project Changelog

`project/changelog.md` records meaningful user-visible or operational changes to the active project.

-   It must begin with an `Unreleased` section.
-   It may add dated or versioned sections when the project begins releasing.
-   It should record durable changes that help a human understand how the project evolved.
-   It must not duplicate Git commit history, task logs, implementation diaries, or routine wording edits.
-   It must not record PROAD framework changes.
-   It must not claim a release or deployment that has not occurred.

The project changelog is distinct from the root `CHANGELOG.md`, which records PROAD framework versions and development changes.

## Maintenance

-   Keep both documents concise, current, and useful as entry points.
-   Update the overview when the project's durable identity, scope, capabilities, structure, maintenance locations, limitations, or major access paths materially change.
-   Add a changelog entry when a meaningful project-level change becomes durable.
-   Route detailed evidence, plans, tasks, decisions, and implementation records to their established documents and link them when useful.
-   Do not copy client-project content into reusable scaffolds or PROAD framework records.
