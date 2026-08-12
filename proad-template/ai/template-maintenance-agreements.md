---
id: template-maintenance-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-08-10
---

# Template Maintenance Agreements

## Purpose

`proad-template/` is the canonical starter structure for new PROAD projects.

It contains the folders, files, bootstrap content, local instructions, and minimum structural agreements required to initialize a functional PROAD project.

The template is not a demonstration project.

It must remain generic, reusable, and free of project-specific information.

## AIA Responsibility

When the human states that a completed change should become part of the PROAD template, the AIA must update `proad-template/` accordingly.

Typical statements include:

-   "Add this to the PROAD template."
-   "This should become part of the model."
-   "Make this standard for new PROAD projects."
-   "Apply this to the template."
-   "The last change should become part of PROAD."

The AIA must interpret such statements as an instruction to update the canonical template, not merely the current project.

## Update Process

For ordinary reusable-change promotion into `proad-template/`, the AIA must:

-   identify the underlying reusable principle
-   separate reusable structure from project-specific content
-   determine which template folders, files, headers, bootstrap sections, or agreements are affected
-   update the template using generic wording
-   preserve established file-naming and structural conventions
-   update relevant indexes and entry-point documents
-   avoid copying client names, project names, statuses, dates, paths, or examples that belong only to the current project
-   verify that the resulting template still works as a clean starting point for an unrelated project
-   report which template files were created, changed, renamed, or removed

When the human approves a PROAD version promotion or otherwise treats `proad-template/` as the canonical promoted state, the AIA must treat that as a full reusable file-state synchronization task unless the human explicitly defines a narrower scope.

In version promotion, the AIA must:

-   reconcile the full reusable source state against `proad-template/`
-   update the full reusable file state, not only the files changed most recently in the current session
-   verify that essential AI bootstrap, governance, and human-facing usage documents are included when they are part of the reusable PROAD state
-   avoid treating version promotion as selective affected-file detection unless the human explicitly requests that narrower behavior
-   treat version promotion as a copy-based operation, not as a task to regenerate equivalent files from scratch
-   keep copied template file content aligned with the reusable source state while allowing template-specific metadata headers or references where required
-   leave `proad-template/project/` unchanged unless the human explicitly requests a change to the starter project scaffold itself
-   never copy live host-project `project/` content into `proad-template/project/` as part of ordinary version promotion

## Clarification Boundary

The AIA should ask a question when it cannot reliably determine:

-   whether the human intends a local project change or a reusable PROAD change
-   whether the exact implementation should be copied or only the underlying principle
-   whether an existing template agreement should be amended or a new component created
-   whether the change introduces a mandatory or optional component

The AIA should ask the smallest question needed to resolve the ambiguity.

## Bootstrap Content

Template files may contain bootstrap sections where they help the human or AIA understand how the file should be used.

Bootstrap content may include:

-   about
-   purpose
-   human usage guidance
-   AIA instructions
-   allowed values
-   expected structure
-   placeholders
-   examples that are clearly generic

Bootstrap content must not overwhelm the working document or require the human to study PROAD before using it.

## Template Integrity

The template must always:

-   use plain files and folders
-   remain understandable without proprietary software
-   contain no current-project data
-   preserve mandatory PROAD components
-   distinguish human-facing project files from AIA-managed records
-   provide enough local guidance for an unfamiliar AIA to begin working safely

## Promotion Principle

Do not copy the history of how a solution was discovered.

Promote only the final reusable structure, agreement, instruction, or bootstrap pattern that should exist in future projects.
