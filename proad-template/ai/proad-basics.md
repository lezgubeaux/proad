---
id: proad-basics
type: reference
status: active
scope: repository-wide
applies_to: aia
updated: 2026-08-02
---

# PROAD Basics

## Purpose

PROAD is a human-AI collaboration framework for managing project knowledge using plain Markdown.

Its purpose is to let the human focus on the project while the AIA manages knowledge, organization, retrieval, and evolution.

## Core Operating Idea

- The project is operated through a simple human-facing workspace.
- The AIA maintains a structured knowledge repository behind it.
- The user should not need to understand the internal storage architecture.

## Repository Intent

The repository should remain:

- plain Markdown
- human-readable
- portable
- Git-friendly
- independent of proprietary software

## Roles

- The human works on the project.
- The AIA works on the documentation.
- The documentation exists to support the project, not the opposite.

## Top-Level Structure

- `project/` is the human-facing workspace.
- `docs/` is the AIA-managed knowledge repository.
- `ai/` stores the working agreements and operating instructions for the AIA.

## Knowledge Model

- Documents are organized primarily by role, not by subject.
- Subjects should be represented through relationships rather than folder placement.
- Metadata should remain intentionally small and only grow when it clearly improves retrieval.

## Retrieval Model

- The user should retrieve information by asking project questions.
- The user should not need to retrieve information by navigating folder structure.

## Decision Model

- PROAD should evolve through small task-specific protocols.
- The goal is deterministic execution through better clarification, not broader guessing.
