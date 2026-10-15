---
id: context-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-09-05
---

# Context Agreements

## Purpose

Define how optional project-context files are identified, presented, maintained, and supplied to the AIA.

Context files preserve descriptive project knowledge that can help restore or specialize a working session. They are not framework bootstrap files and do not contain operating rules.

## Identification

-   Project-context files belong directly under `project/ai/`.
-   Every context file must use `type: context`.
-   Every context filename must end in `-context.md`.
-   The general project context must use the exact path `project/ai/project-context.md`.
-   Specialized files should use stable role-based names such as `visual-design-context.md` or `web-development-context.md`.
-   Every context file under `project/ai/` must use `template-management: exclude` to identify it as client-owned content.
-   A context file may initially contain only its required metadata header.

## Content Boundary

-   Context files contain narrative background, terminology, stakeholders, constraints, history, intent, and other descriptive knowledge useful for understanding the project or a bounded work area.
-   Context files must not define AIA rules or framework behavior. Rules belong in the appropriate agreement file.
-   Context files must not replace the roadmap, task documents, deliveries, or other canonical current-state records.
-   When context conflicts with a more specific or authoritative project record, the AIA must surface the conflict rather than silently choosing one.
-   Context should remain useful as recovery material without becoming a duplicate project knowledge base.

## Loading Model

-   `ai/session-bootstrap.md` loads this agreement but must not automatically load any project-context file.
-   The human chooses when to provide or identify a context file for an AIA session.
-   Loading one context file does not imply that other context files should also be loaded.
-   Specialized context should be loaded only when relevant to the active work.

## Presentation And Discovery

-   `project/ai/index.md` is the canonical registry of all context files available in the current project.
-   Every context file must be linked from that registry with a short explanation of what it covers and when it is useful.
-   `project/index.md` must directly present `project/ai/project-context.md` and link to `project/ai/index.md` as the complete context registry.
-   A specialized context file must also be linked from the matching roadmap item or its task document when that relationship exists.
-   If the correct roadmap or task relationship is not deterministic, the AIA must ask the smallest differentiating question before storing the specialized context.

## Maintenance

-   Adding, renaming, moving, or removing a context file must update `project/ai/index.md` and every applicable project-index, roadmap, and task reference in the same approved operation.
-   No context file may remain unlisted in `project/ai/index.md`.
-   No registry, roadmap, task, or project-index link may remain after its context file is removed or renamed.
-   When the human asks to append or inject information, preserve existing relevant context and integrate the supplied material coherently.
-   When the human explicitly supplies complete replacement content, replace the existing narrative while preserving valid operational metadata unless instructed otherwise.
-   The AIA must not guess whether supplied content is an addition or a complete replacement when the instruction is ambiguous.

## Template Scaffold

`project/ai/project-context.md` is a mandatory generic new-installation scaffold. It may remain header-only until the project receives useful context.

The template-owned scaffold and its live client-owned counterpart use the same path and `template-management: exclude`. Promotion and installation must follow the explicitly approved new-scaffold and retained-scaffold rules in [`template-maintenance-agreements.md`](./template-maintenance-agreements.md) and [`template-management-agreements.md`](./template-management-agreements.md).

Framework synchronization does not inspect or mutate `project/`. A missing context scaffold may be introduced only by an applicable declared migration under [`project-migrations.md`](./project-migrations.md).
