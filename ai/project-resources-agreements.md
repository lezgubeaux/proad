---
id: project-resources-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-03
---

# Project Resources Agreements

## Purpose

Define how every project's operational resource hub is maintained.

## Agreements

- [`../project/resources.md`](../project/resources.md) is the primary project access point for operational resources, services, and frequently needed URLs.
- It links to [`../project/resources/entry-points.md`](../project/resources/entry-points.md) and [`../project/resources/index.md`](../project/resources/index.md).
- `project/resources/entry-points.md` stores the client-owned resource menu and entries.
- The entry-points menu uses an HTML `<ul>` and remains sorted alphabetically by section title.
- Adding, renaming, or removing a project resource section updates that menu in the same change.
- Menu links target stable anchors belonging to their corresponding sections.
- Other project files link to the main resource hub rather than duplicating individual resource links.
- Long entries move into `project/resources/`, leaving a concise description and link in `entry-points.md`.
- Secrets must not be stored in PROAD; the hub may identify their protected external location.
