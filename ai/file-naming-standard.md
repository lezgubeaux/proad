---
id: proad-template-file-naming-standard
type: standard
status: active
scope: proad-template-ai
applies_to: aia
updated: 2026-08-02
---

# File Naming Standard

## Purpose

This standard defines how files are named throughout the repository.

The objectives are:

- predictability
- portability
- Git compatibility
- easy typing
- deterministic generation by the AIA
- deterministic retrieval by both humans and the AIA

## General Rule

All repository-managed files should use:

- lowercase letters
- hyphens (`-`) as word separators
- no spaces
- no underscores
- no special characters
- no non-ASCII characters

## Ordered Documents

Files whose order is significant may use a two-digit numeric prefix.

Number prefixes are optional and should be used only where ordering has semantic meaning.

Ordinary knowledge documents should not rely on numbering.

## Folder Index

Every top-level folder contains `index.md`.

## Guiding Principle

A filename should answer only one question:

> "What is this document?"
