---
id: roadmap-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-06
---

# Roadmap Agreements

## Purpose

Define the single repository-wide model for keeping a PROAD roadmap useful, concise, and connected to the work it represents.

## Core Role

- Every PROAD project must contain `project/roadmap.md`.
- The roadmap is the primary human-facing progress document.
- It should show what the project is trying to achieve, what is active, what is complete, and what comes next.
- It must remain concise and must not become the project knowledge base, task log, or research archive.
- Detailed plans, tasks, research, evidence, implementation records, and substantial reports belong in `docs/` and are linked when useful.

## Every Roadmap Item

Every step, substep, or gate must have:

- a stable identifier when it may be referenced;
- a current status;
- a concise description of what it does; and
- an outcome stating what must be achieved, established, or decided.

The local roadmap defines the status values used by the project.

## Lifecycle

### Planned

A planned item needs enough information to explain its intended role and outcome. Do not create empty task or delivery documents merely to satisfy structure before the work is ready to begin.

### Active

Active work must expose a clear place where its execution is managed when the work is substantial enough to require tasks, substeps, or working records.

That execution location may be:

- a dedicated task document;
- a working document that clearly manages the execution structure; or
- the roadmap item itself when the work is genuinely small and remains concise.

### Completed

A completed item must link to or clearly identify its durable result. A human or AIA must not need to scan folders, infer filenames, or rely on chat history to find what the work produced.

The durable result may be a report, implemented result, decision record, document, spreadsheet, delivery hub, or another stable artifact appropriate to the work.

Do not mark an item complete when its stated outcome has not been achieved or its durable result is missing or undiscoverable.

#### Time Accounting At Completion

- Before marking a roadmap step or substep `completed`, the AIA must check for a matching entry in the project's declared working-time record, using the stable roadmap identifier when available.
- The same check applies when the human asks for completion and when the AIA discovers an already-completed item without a matching time-accounting decision.
- When no matching entry or decision exists, the AIA must prompt the human with a retrospective time estimate and ask for confirmation of one of these outcomes:
  - record the confirmed working time under the applicable chargeable or project-specific classification;
  - mark the work `non-chargeable`; or
  - mark the time-accounting decision `deferred` for later resolution.
- AIA-proposed time is an estimate until the human confirms it. The AIA must not silently record estimated time as actual time, infer zero time, or treat a missing entry as non-chargeable.
- `Time accounting: deferred` is an accounting marker, not the roadmap item's lifecycle status. The work may remain `completed`, but the unresolved accounting decision must stay explicit and discoverable until resolved.
- If the project has no declared authoritative working-time record, the AIA must ask where the confirmed time or accounting decision should be stored rather than inventing a new log or destination.
- A completed step or substep is compliant only when it has confirmed time recorded, is explicitly non-chargeable, or carries an explicit deferred time-accounting marker.

### Deferred

A deferred item preserves completed work and useful links, explains why work is not continuing, and states the condition for resumption when known. Deferred work is not complete and must not silently resume without the applicable authorization.

## Tasks And Deliveries

Use separate `Tasks` and `Delivery` links when that distinction materially improves execution and retrieval:

- `Tasks` exposes detailed execution, progress, and output mappings.
- `Delivery` exposes the canonical durable result.

Do not require two documents when one clearly structured document can responsibly manage both the work and its resulting artifact. Do not duplicate findings merely to satisfy navigation terminology.

When a task document exists, completed tasks should identify their durable outputs or their contribution to the primary delivery.

## Substeps

- Use substeps only for meaningful internal stages or outcomes, not for every supporting file.
- A completed substep must have an identifiable durable result or an explicit contribution to the parent delivery.
- Supporting records do not automatically become roadmap substeps.

## Gates

A gate records a decision rather than ordinary execution.

- A planned gate identifies the decision question and the input needed to decide it.
- A decided or passed gate links to or clearly identifies the durable decision record.
- A gate decision does not automatically authorize unrelated or commercially unapproved downstream work.

## Supporting Evidence

Supporting analyses, evidence, source artifacts, and working files may remain separate from the primary delivery. They must be discoverable through the relevant working or delivery structure when they are needed to understand or verify the result.

## Integrity

- Roadmap links and referenced anchors must resolve.
- Broken links are non-compliant and must be repaired or explicitly reported when the missing target cannot be restored safely.
- Preserve stable IDs and backlinks when restructuring existing work.
- Keep completed history accurate; do not rewrite incomplete work as complete for the sake of a cleaner roadmap.
- Resolve uncertainty about roadmap position, meaning, status, or authority before making a structural change.

## Practical Test

For each roadmap item, a human should be able to answer:

> What does this item do, where is substantial active work managed, and—if it is complete—where is its durable result?

If those answers are clear and the links resolve, the item satisfies the roadmap information-management model.

## Local Usage Contract

The local usage contract, status vocabulary, and genuinely project-specific roadmap behavior belong in [`../project/roadmap.md`](../project/roadmap.md) or active project-specific agreements. Project-specific documents must not duplicate or redefine this generic model unless an explicit local exception is necessary.
