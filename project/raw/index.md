---
id: project-raw-index
type: index
status: active
scope: project
template-management: preserve
updated: 2026-10-03
---

# Project Raw

## Purpose

Preserve project-relevant thinking that is worth not losing but is not yet mature enough to classify as a todo, roadmap item, agreement, research record, implementation task, or other established project material.

## Capture

Ask the AIA to "put this in Raw." A capture should preserve the complete useful context without forcing an action plan or project-management structure onto it.

Use a concise date-prefixed filename:

```text
YYYY-MM-DD-short-descriptive-name.md
```

Use minimal metadata, including the required project-file management boundary:

```yaml
---
created: YYYY-MM-DD
id: raw-short-name
origin: ai-session
project: project-name
status: raw
type: raw
template-management: exclude
---
```

## Working Principle

Capture first. Classify later.

Project Raw is quiet storage, not another inbox the human must routinely review. It is not loaded during ordinary session bootstrap. Captures are reconsidered only when explicitly requested or when current project work makes a particular item plausibly relevant.

When an item becomes relevant, the immediate choices are:

- `USE` — reconsider it against current project state and only then decide where its useful content belongs;
- `KEEP` — leave it unchanged in Project Raw; or
- `DELETE` — remove it under normal approval and file-safety rules.

This index is reusable project scaffolding. Every other file in `project/raw/` is client-owned capture content and must use `template-management: exclude`.
