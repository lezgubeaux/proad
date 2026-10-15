---
id: proad-readme
type: readme
status: active
scope: repository-root
updated: 2026-10-15
---

# PROAD

PROAD is a lightweight, Markdown-based context-engineering framework for AI-assisted software and knowledge projects.

Long-running AI work has a recurring failure mode: approved requirements, durable decisions, speculative ideas, temporary implementation details, and outdated assumptions gradually become mixed together. Once their authority is unclear, an AI assistant can recommend work outside the approved scope, revive rejected ideas, or lose important context between sessions.

PROAD creates a controlled project workspace in which information is separated by role, authority, and lifecycle. It gives the developer and the AI assistant explicit ways to determine:

- what governs the current work;
- what is planned, active, completed, or deferred;
- what remains exploratory and non-authoritative;
- which decisions and outcomes must remain discoverable;
- what context must be loaded at the beginning of a session; and
- which part of a larger repository the installation is allowed to govern.

PROAD does not make AI autonomous, replace human review, or guarantee correct output. It makes AI-assisted work easier to evaluate by providing documented requirements, boundaries, retrieval paths, and operating agreements against which proposals and changes can be checked.

## Why It Is More Than Markdown Notes

PROAD uses plain Markdown, but its value comes from the operating model around those files:

- documents have defined responsibilities rather than acting as an undifferentiated note collection;
- metadata supports classification and retrieval;
- indexes expose stable entry points without becoming file catalogs;
- the session bootstrap reconstructs the required operating context in a defined order;
- roadmap work must connect active execution to durable results;
- exploratory Raw material remains separate from approved project scope; and
- reusable framework rules remain distinct from client-owned project content.

The result is portable and Git-friendly while still providing explicit context control.

## Core Principles

- **Authority before recency:** Newer text does not silently override established requirements, agreements, approvals, or project records.
- **Separation by responsibility:** Project operation, structured knowledge, exploratory capture, and AI instructions have distinct locations and roles.
- **Bounded scope:** Each PROAD installation governs only its declared project or component. A nested PROAD remains an independent workspace.
- **Session continuity:** A defined bootstrap process restores the operating rules and primary project orientation for each AI session.
- **Human control:** The AI assistant may analyze and propose, but execution and project authority remain subject to human approval and authoritative documentation.
- **Traceable outcomes:** Roadmap items, working records, decisions, and durable deliveries are linked so completed work remains discoverable.
- **Capture before classification:** Early ideas can be preserved without prematurely treating them as requirements or implementation commitments.

## Workspace Overview

```text
proad/
|-- ai/          AI operating agreements and session bootstrap
|-- project/     Human-facing project workspace and authoritative entry points
|   |-- ai/      Project-specific context and agreements
|   `-- raw/     Unclassified, non-authoritative project capture
|-- docs/        Structured knowledge maintained in support of the project
|-- developer/   Human-facing guidance for operating PROAD
|-- index.md     Workspace map and primary entry points
`-- README.md    Public introduction to the framework
```

An active PROAD development host may also contain framework-development state such as top-level `raw/` and `proad-template/`. These are not required in ordinary installations.

## Example: Preventing Scope Drift

Suppose a stakeholder suggests an experimental feature during a discussion:

1. The idea is captured under `project/raw/` so its useful context is not lost.
2. The capture remains exploratory and does not become approved implementation scope merely because it is recent or detailed.
3. The AI assistant may analyze the idea when relevant, but must continue to evaluate current work against the authoritative project records.
4. If the idea is accepted, its durable result is incorporated into the appropriate roadmap, requirement, agreement, task, or knowledge document.
5. The relevant entry points and links are updated so later sessions can retrieve the accepted direction through the normal bootstrap and project-navigation paths.
6. If the idea remains unresolved or is rejected, it cannot silently displace the approved plan.

This separation lets useful exploration coexist with controlled execution.

## Five-Minute Repository Tour

1. Start with [`ai/session-bootstrap.md`](./ai/session-bootstrap.md) to see how an AI session reconstructs its required working context.
2. Read [`ai/global-working-agreements.md`](./ai/global-working-agreements.md) for the execution, scope, authority, and information-handling rules.
3. Review [`ai/proad-basics.md`](./ai/proad-basics.md) for the framework's human-AI operating model.
4. Compare [`project/`](./project/index.md) with [`project/raw/`](./project/raw/index.md) to see the boundary between active project operation and unclassified capture.
5. Read [`ai/roadmap-agreements.md`](./ai/roadmap-agreements.md) to see how active work must remain connected to outcomes and durable deliveries.
6. Use [`developer/`](./developer/index.md) for human-facing operating and installation guidance.

## Main Entry Points

- [`index.md`](./index.md) maps the workspace and its major components.
- [`ai/session-bootstrap.md`](./ai/session-bootstrap.md) is the mandatory session-start handoff for an AI assistant operating inside PROAD.
- [`project/index.md`](./project/index.md) is the human-facing entry point for the project being operated.
- [`developer/index.md`](./developer/index.md) provides guidance for people installing, updating, or working with PROAD.
- [`CHANGELOG.md`](./CHANGELOG.md) records framework version history.

## Installation Shapes

PROAD can operate as:

- a standalone project, with the approved template installed at the project root;
- a `proad/` workspace inside a client repository; or
- an independent sub-PROAD governing one bounded component of a larger project.

Each installation has its own project workspace, roadmap, structured knowledge, AI guidance, bootstrap, and declared scope.

## Current Version

The current development line is `v4.3`.
