---
id: work-lifecycle-and-archiving-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-09-08
---

# Work Lifecycle and Archiving Agreements

## Purpose

Define how completed, cancelled, superseded, obsolete, or abandoned work should leave active navigation while its durable outcomes, useful evidence, and project history remain appropriately discoverable.

## Scope

These agreements apply to:

- individual todo and backlog entries;
- completed todo sections;
- roadmap task documents and substep records;
- implementation guides and working notes;
- superseded project documents;
- supporting evidence and historical artifacts;
- references affected by consolidation, archival, movement, or removal.

They do not require every completed task or intermediate artifact to be retained.

## Lifecycle Classifications

Before changing completed or inactive material, classify it as one of the following:

- **Completed and still operational:** the work is finished, but its result remains active guidance or a maintained project resource.
- **Completed with a durable delivery:** the task entry is no longer needed, but its result must remain discoverable through the roadmap, delivery structure, or another authoritative access point.
- **Superseded:** newer material or direction replaces the record, but the older material may still explain project history or preserve evidence.
- **Cancelled:** the work was deliberately stopped before achieving its intended outcome.
- **Abandoned:** the work ceased without a formal completion or cancellation decision; its remaining value must be assessed before cleanup.
- **Obsolete with no enduring value:** the material no longer guides work, proves a meaningful outcome, or contributes useful historical context.

Do not infer that completed means archived, or that obsolete means safe to delete.

## Todo and Backlog Cleanup

- Active todo and backlog files are working entry points, not permanent completion logs.
- Remove completed entries from active task lists when their durable result is independently discoverable and the entry no longer helps current work.
- Retain a completed entry temporarily when it communicates an unresolved handoff, verification, dependency, or follow-up action.
- Remove an entire completed section when none of its entries remains operationally useful.
- Move substantial reusable guidance out of a todo body into an appropriate dedicated document and leave only a concise linked task while the work is active.
- Do not preserve task-body duplication after a dedicated authoritative record exists.
- A framework development-backlog candidate should be removed or marked completed when its intended outcome has been incorporated into the live framework or deliberately rejected.

## Retain, Consolidate, Archive, or Remove

Choose the smallest action that preserves necessary value:

### Retain in place

Retain material when it remains current operational guidance, an authoritative delivery, or an active access point.

### Consolidate

Consolidate material when several temporary or overlapping records can be represented accurately by one durable authoritative document. Preserve unique facts, decisions, qualifications, sources, and links during consolidation.

### Archive

Archive material when it is no longer active but remains useful as project history, evidence of a delivery or decision, or occasional reference.

Archived material should normally move to the appropriate supporting-material area when it is a non-deliverable historical artifact. Do not move an authoritative project delivery merely because its originating task is complete.

### Remove

Remove material only when it has no enduring operational, evidentiary, contractual, historical, or retrieval value and no active record depends on it.

When uncertainty remains between archival and removal, prefer archival until the human decides otherwise.

## Archive Requirements

An archived Markdown document must:

- use `status: archived` when its metadata model supports status;
- use metadata appropriate to its archive location and role;
- include a concise archive notice near the beginning;
- explain why it was archived;
- identify the replacement or current guidance when one exists;
- state clearly that it must not govern current work when it has been superseded;
- retain its stable filename unless the document's purpose changed or the existing name became misleading;
- remain reachable from an appropriate hub or historical access point without cluttering active navigation.

Client-supplied originals, contractual records, approvals, and other source evidence should be preserved unchanged. If explanation is needed, add it through metadata permitted by the source format, a surrounding archive record, or a linked note rather than rewriting the source artifact.

## Roadmap and Delivery Continuity

- Before removing a completed task entry or task document, confirm that the roadmap step's durable delivery remains identifiable and discoverable.
- Completed roadmap outcomes must not depend on an archived task log as their only discovery path.
- A task document may be archived after completion when its execution history remains useful, but the roadmap must continue to point to the delivery rather than treating the archive as the outcome.
- If work was superseded before delivery, preserve enough linkage to show what replaced it and why the active direction changed.

## Reference Cleanup

Every consolidation, move, archive, rename, or removal must update affected references in the same approved operation.

The AIA must:

- identify incoming references before mutation;
- update links to moved or renamed material;
- remove links that no longer serve active navigation;
- add the archived item to the appropriate hub when retention requires discoverability;
- prevent orphaned retained documents;
- avoid leaving duplicate active and archived guidance without a clear authority boundary.

## Verification

After lifecycle maintenance, verify that:

- active todo and backlog entry points contain only current or intentionally retained work;
- every removed task's durable result remains discoverable when one exists;
- archived documents have the required status and notice;
- current guidance and superseded guidance are clearly distinguished;
- all changed links resolve;
- no retained file became orphaned;
- no unique facts, decisions, qualifications, evidence, or client-supplied source material were unintentionally lost;
- no project-specific archive content was introduced into reusable framework or template material.

For substantial consolidation or high-value records, compare the source and destination explicitly and report anything omitted, materially reworded, duplicated, or left without a reference.

## Clarification Boundary

Ask the smallest differentiating question before mutation when it is unclear:

- whether material remains operational;
- whether a durable delivery exists elsewhere;
- whether historical or evidentiary value justifies archival;
- whether removal is intended;
- which hub should expose an archived record;
- which record becomes authoritative after consolidation.
