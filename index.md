---
id: proad-index
type: index
status: active
scope: proad-template
updated: 2026-10-03
---

# PROAD Template

## Purpose

This repository stores the PROAD collaboration framework in plain Markdown.

It separates human-facing project operation from AI-managed knowledge and AI operating agreements.

## Entry Points

-   [`README.md`](./README.md) provides the root-level overview for the current PROAD workspace.
-   [`ai/session-bootstrap.md`](./ai/session-bootstrap.md) is the session-start handoff entry point for giving document control to the AIA.
-   `developer/` contains human-facing guidance for working with PROAD itself as a framework.
-   `docs/` stores the AI-managed starter knowledge repository.
-   `project/` contains the human-facing workspace for understanding and driving the project.
-   `project/docs/` stores human-facing supporting project documents referenced from the roadmap when needed.
-   `project/ai/` stores project-specific working agreements that apply only to the live project.
-   `ai/` contains the AI working agreements, operating rules, and session bootstrap material.
-   [`project/raw/`](./project/raw/index.md) preserves client-project thinking before it is mature enough to classify.
-   `proad-template/`, when present, stores the canonical reusable starter structure produced during version promotion. It is not required in an installed workspace.
-   [`CHANGELOG.md`](./CHANGELOG.md) is reserved for published standalone PROAD version history.
