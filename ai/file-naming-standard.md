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

Example:

```text
visual-design-guidelines.md
```

Not:

```text
Visual Design Guidelines.md
visual_design_guidelines.md
Visual-Design-Guidelines.md
```

## File Extension

Markdown documents use:

```text
.md
```

## Word Separator

Words are separated exclusively by hyphens.

Correct:

```text
client-feedback.md
```

Incorrect:

```text
client_feedback.md
client feedback.md
clientfeedback.md
```

## Letter Case

Filenames should contain only lowercase letters.

Correct:

```text
seo-guidelines.md
ddbm-overview.md
api-reference.md
```

Incorrect:

```text
SEO-Guidelines.md
API-Reference.md
DDBM-Overview.md
```

Acronyms remain lowercase in filenames.

Document titles may use any appropriate capitalization.

## Numbers

Numbers are written normally.

Examples:

```text
project-review-2026.md
phase-2-plan.md
```

## Ordered Documents

Files whose order is significant may use a two-digit numeric prefix.

Examples:

```text
01-project-roadmap.md
02-current-status.md
03-working-agreements.md
```

Number prefixes are optional and should be used only where ordering has semantic meaning.

Ordinary knowledge documents should not rely on numbering.

## Folder Index

Every top-level folder contains:

```text
index.md
```

Its purpose is to describe the folder's responsibility and important entry points.

It is not intended to be a complete inventory of files.

## Descriptive Names

Filenames should describe the document's purpose rather than its history.

Prefer:

```text
visual-design-guidelines.md
```

Instead of:

```text
new-design.md
latest-design.md
design-v3.md
final-design.md
```

## Stability

Once a document becomes part of the repository, its filename should remain stable.

Changing filenames should be avoided unless:

- the document's purpose fundamentally changes
- the existing name is misleading
- the repository is undergoing an intentional refactoring

## Temporary Documents

Temporary notes should still follow this standard.

Do not create filenames such as:

```text
temp.md
notes.md
misc.md
```

Prefer names that communicate the document's purpose.

## Source of Meaning

A filename identifies a document.

It should not attempt to encode metadata such as:

- status
- ownership
- roadmap position
- approval state

Such information belongs in the document's metadata or content, not in the filename.

## Guiding Principle

A filename should answer only one question:

> "What is this document?"

It should not answer:

- Where is it used?
- Is it approved?
- Is it current?
- Who owns it?
- Which roadmap step references it?

Those relationships belong to the repository, not to the filename.
