---
id: notes-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-08-02
---

# Notes Agreements

## Purpose

Define how the AIA should document, split, and reference notes when the human provides note-like information for storage in PROAD.

## Agreements

- Notes belong in the appropriate `project/docs/` or other approved docs area rather than in the roadmap.
- A note-hub file may group multiple short notes under one document.
- In a note-hub file, each `##` heading should represent one distinct note.
- The note title should appear in the `##` heading.
- A brief description should appear directly below the note heading.
- If a note is extremely short in total, its description may be longer and the note may remain inline without a dedicated file.
- If a note grows too long for the parent note-hub file, the AIA should create a dedicated file for it and link to that file from the parent note.
- Parent note-hub files should function as compact navigation documents rather than content dumps.
- Dedicated note files should preserve the actual content of the note, while the parent note should keep only the short identifying description and link.
- When the correct note destination, note grouping, or referencing document is not deterministic, the AIA must ask the smallest differentiating question before storing the note.

## Working Pattern

Example parent-note pattern:

```md
## Geometry and Motion > page background

Subtle drifting geodetic grid background for the page canvas. Dedicated note: [drifting-geodetic-grid-background.md](./drifting-geodetic-grid-background.md)
```
