---
id: substep-execution-pattern
type: protocol
status: active
scope: project-ai
applies_to: human-aia
template-management: exclude
updated: 2026-08-22
---

# Substep Execution Pattern

## Purpose

Define the project-specific human–ChatGPT–AIA workflow for moving a roadmap substep from interactive analysis into approved PROAD integration.

## Pattern

1. **Interactive Analysis**
   - Gather evidence.
   - Explore interpretations.
   - Challenge assumptions.
   - Resolve ambiguities.
   - Identify decisions and unresolved questions.
   - Keep this stage conversational and flexible.

2. **Codex Handoff**
   - Identify the roadmap step and substep.
   - State what is complete.
   - State what should be added to the delivery.
   - State what belongs in supporting analysis.
   - State any TODO updates.
   - State any roadmap or task-status updates.
   - State which files should be created, updated, or linked.
   - State explicitly what Codex must not infer.
   - The handoff defines the authorized scope of the proposed integration.

3. **Execution Approval**
   - The handoff defines the authorized scope but does not itself unlock file operations.
   - Codex performs PROAD integration only after a standalone `GO` or `go`.
   - Execution permission applies to that response only.

4. **PROAD Integration**
   - Codex performs the authorized file operations.
   - Update the step delivery.
   - Update task completion or progress.
   - Store supporting analysis only where justified.
   - Maintain links and indexes.
   - Preserve one authoritative location for each piece of information.
   - Do not turn exploratory discussion into project structure unless it was included in the approved handoff.
