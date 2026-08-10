---
id: using-proad
type: guide
status: active
scope: developer
updated: 2026-08-07
---

# Using PROAD

## Purpose

This guide explains how to ask for common PROAD-level actions without needing to know the internal AI-side process.

## Core Rule

You may request PROAD actions in plain human language.

You do not need to describe the internal promotion, release, installation, or update mechanics unless you want to constrain them.

If a required detail is not deterministic, the AIA should ask the smallest differentiating question before acting.

## Structure Model

- `proad/` is the bounded PROAD workspace inside a project or standalone PROAD release.
- `proad-template/` is the install source and models the inside of an installed `proad/` folder.
- Installing PROAD into a project means copying the contents of `proad-template/` into that project's `proad/` folder.
- The standalone PROAD project is a separate published/versioned product and is not the same thing as the live VerQuin development workspace.

## Current Temporary State

The current host project and version-line context are documented in [`../README.md`](../README.md).

That file is the authoritative human-facing overview for where PROAD is currently being developed and which version line is active.

## Common Actions

### Promote reusable changes into the template

Use this when the current live PROAD development in VerQuin contains a reusable improvement that should become part of the canonical template.

Example requests:

- "Promote the current reusable PROAD changes into `proad-template/`."
- "Make the last approved PROAD change part of the template."

### Release a new PROAD version

Use this when the current approved `proad-template/` state should become a new standalone PROAD version.

Example requests:

- "Release a new PROAD version from the current template state."
- "Declare the current `proad-template/` state as the next PROAD version."

### Install PROAD into a new project

Use this when a new project should receive PROAD from the approved template state.

Example requests:

- "Install PROAD into a new project from the current approved template."
- "Create a new PROAD project from `proad-template/`."

Installed result:

- template contents are copied into the target project's `proad/` folder
- the template is not installed as `proad-template/`
- the template does not need its own nested `proad/` folder

### Update an existing standalone PROAD project

Use this when a standalone PROAD project should be refreshed from a newer approved template state.

Example requests:

- "Update the standalone PROAD project from the current approved template."
- "Apply the latest approved template state to the standalone PROAD project."

## What The AIA May Need To Ask

The AIA should only ask follow-up questions when a required detail is not deterministic.

Typical examples include:

- target folder or destination
- version identifier
- whether the request is about live development, template promotion, or standalone release
- which accompanying documentation should be created or updated
