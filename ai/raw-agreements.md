---
id: raw-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-03
---

# Raw Agreements

## Purpose

Define zero-friction capture and selective reconsideration of useful thinking before its proper classification is known, while keeping PROAD-framework development Raw separate from client-project Raw.

## Definition

Raw stores things worth not losing before they are mature enough to know where they belong.

Raw is deliberately pre-classification. It may contain an idea, problem, concern, bug, risk, feature, research question, architectural issue, misunderstanding, rejected approach, unresolved discussion, partial solution, or substantial AI-derived context.

The governing principle is:

> Capture first. Classify later.

## Two Distinct Locations

### PROAD Development Raw

- Top-level `raw/` is reserved for thinking about PROAD itself.
- It may exist only on the active PROAD development host.
- The complete top-level `raw/` directory, including its index, is development-host state and must never enter `proad-template/`, a new installation, or an existing-installation update.
- Its presence—not a reusable runtime checker—identifies that the development host has a framework Raw area.
- It may move to another workspace only as a complete, verified part of a development-host transfer governed by [`development-host-transfer-agreements.md`](./development-host-transfer-agreements.md).

### Client-Project Raw

- [`../project/raw/`](../project/raw/) stores thinking about the active client project.
- [`../project/raw/index.md`](../project/raw/index.md) is the reusable project scaffold and stable human-facing entry point.
- New installations should receive this scaffold through the explicitly reviewed generic `project/` source.
- Every capture beneath `project/raw/` is client-owned and must use `template-management: exclude`.

Neither Raw area may become a roadmap section, todo category, ideas database, research archive, or mandatory review inbox. The human should not need to understand the eventual destination before asking for a capture.

## Capture

When the human asks to "put this in Raw" or clearly requests equivalent preservation:

1. Preserve the complete useful context, including reasoning, alternatives, qualifications, rejected approaches, implications, and unresolved questions when they matter.
2. Do not force ordinary project-management fields or prematurely convert the thought into formal work.
3. Use a filename in the form `YYYY-MM-DD-short-descriptive-name.md` following [`file-naming-standard.md`](./file-naming-standard.md).
4. Use only the metadata needed for basic identification. A top-level PROAD-development capture uses:

```yaml
---
created: YYYY-MM-DD
id: raw-short-name
origin: ai-session
project: project-name
status: raw
type: raw
---
```

   A client-project capture under `project/raw/` adds:

```yaml
template-management: exclude
```

5. Select the location from subject matter: PROAD-framework thinking goes to top-level `raw/` on the development host; client-project thinking goes to `project/raw/`. Ask the smallest differentiating question when the subject is genuinely ambiguous.
6. Adapt `origin` and `project` accurately. Do not invent values when they cannot be determined.
7. Do not require priority, dependencies, roadmap position, acceptance criteria, deadline, action plan, or final classification.
8. Link the capture from another document only when a current relationship genuinely requires it. Raw does not need ordinary index cataloguing merely to exist.

When an AI cannot write to the active local PROAD safely, it should produce a correctly named downloadable Markdown file for the human to place in `proad/raw/` for PROAD-development thinking or `proad/project/raw/` for client-project thinking. Raw capture must not require branch knowledge, repository-write authority, or direct GitHub mutation.

## Quiet Operation

- Ordinary session bootstrap must load these agreements but must not enumerate or read either Raw area.
- Do not ask the human to maintain inbox zero or routinely review every Raw item.
- Do not surface Raw material merely to prove it was checked.
- Expected volume is small. Do not introduce summaries, generated catalogs, indexing machinery, cloud intake, or automated import until actual use demonstrates the need.

## Rummage Triggers

### PROAD Version Promotion

When top-level development Raw exists, a human request to start PROAD version promotion is its mandatory rummage trigger.

Before preparing the promotion candidate, the AIA must:

1. inspect filenames and minimal metadata for current top-level development Raw captures;
2. consider what was completed, what changed, and what the next version is likely to represent;
3. open full captures only when their relevance is plausible; and
4. surface only materially relevant candidates.

This rummage happens before normal promotion preparation. It must not happen after the version has already been promoted, and it must not silently delay promotion when no Raw item is relevant.

### Client-Project Work

Client-project Raw does not depend on PROAD version promotion. Inspect it only when:

- the human explicitly asks to rummage through project Raw; or
- current project work makes a particular capture plausibly relevant.

This is not permission for broad routine rummaging or for inventing a recurring project-review burden.

## Rummage Output

Rummage produces a short temporary decision list in the conversation, not a permanent report by default.

For each surfaced candidate, briefly state why it may matter now and recommend one primitive decision:

- `USE` — reconsider the thought now;
- `KEEP` — leave it in Raw unchanged; or
- `DELETE` — remove it because it no longer warrants preservation.

Do not show unrelated Raw items. When nothing is materially relevant, say so briefly and continue the normal promotion process.

## USE, KEEP, And DELETE

### USE

`USE` means the thought is relevant enough to reconsider. It does not predetermine a destination.

Only after selection should the AIA determine whether the useful result has become an agreement, roadmap change, todo, implementation, research record, project knowledge, or a combination. Apply the normal rules of the selected destination.

### KEEP

Leave the capture in Raw without rewriting or reclassifying it.

### DELETE

Delete only with the authorization required by the active PROAD agreements. Resolve the exact target first and report what was removed.

## Lifecycle Boundary

Natural pruning should keep Raw small, but no fixed archive model is established yet.

- Obviously irrelevant material may be deleted when authorized.
- Useful material may be transformed, moved, or represented elsewhere after `USE`.
- Potentially useful unresolved material remains Raw.
- Do not preserve or delete the original automatically after `USE`; decide the smallest safe lifecycle action from its remaining evidentiary or contextual value.

## Promotion, Installation, And Update Boundary

- The complete top-level development-host `raw/` directory is excluded from promotion, installation, and update operations.
- No top-level Raw index or capture may appear in a candidate or installed PROAD that is not the active development host.
- Live client `project/raw/` is part of the client-owned `project/` tree and is never an automatic promotion source.
- The reusable `project/raw/index.md` scaffold must come only from the explicitly reviewed generic project source.
- New installations receive generic `project/raw/index.md`, not development-host Raw or client captures.
- Framework synchronization skips the complete `project/` tree, including `project/raw/`. Adding the scaffold to an older project requires the applicable declared migration under [`project-migrations.md`](./project-migrations.md).
- Promotion tooling must exclude top-level `raw/` mechanically and must reject any candidate containing it; prose-only compliance is insufficient.
- Development-host transfer is the sole exception to ordinary non-transferability: it moves the complete directory exactly and removes the old-host copy only after the new copy is verified.
