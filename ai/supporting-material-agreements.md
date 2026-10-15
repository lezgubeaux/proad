---
id: supporting-material-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-08-18
---

# Supporting Material Agreements

## Purpose

Define what `project/supporting-material.md`, `project/supporting-material-entries.md`, and `project/supporting-material/` are, how they should work, and how the AIA should use them in PROAD projects.

## What It Is

`project/supporting-material.md` is a human-facing hub for non-deliverable but operationally important project-support artifacts.

`project/supporting-material-entries.md` stores the project-specific entries exposed through that hub.

It is not a deliverable itself and it is not a roadmap document.

Its role is to make important supporting material easy to find without requiring deep subfolder organization.

`project/supporting-material/` is the default local folder for human-facing supporting-material files that should remain grouped inside the project workspace.

It exists to give the human a predictable location for supporting artifacts without turning `docs/` into a general file dump.

## What It May Link To

Entries may point to:

- internal project documents
- files inside `project/supporting-material/`
- folders
- external files
- external links
- client-submitted material
- references or assets that support project work

## Agreements

- Every PROAD project should contain `project/supporting-material.md`.
- Every PROAD project should contain `project/supporting-material-entries.md`.
- Every PROAD project should contain `project/supporting-material/`.
- Every PROAD project must contain `project/supporting-material/graphics/`, its local `.gitignore`, `index.md`, and `assets/index.md`.
- The file is mandatory even if it starts nearly empty.
- The folder is mandatory even if it starts empty.
- It should act as a shared access hub for non-deliverable but important project-support material.
- The folder should act as the default local container for supporting-material files that belong inside the project workspace.
- Entries in `project/supporting-material-entries.md` may link to documents, folders, external files, external links, client-submitted material, or other relevant assets.
- Each entry should briefly explain what the material is and why it matters.
- The hub file should remain the primary access point for the human and must link to `project/supporting-material-entries.md`.
- `project/supporting-material-entries.md` must link to `project/supporting-material/graphics/index.md` as the access point for working graphics.
- `project/supporting-material/graphics/` stores non-deployable working graphics that support project design and implementation.
- `project/supporting-material/graphics/assets/` is the general location for editable graphic sources and export masters unless an approved project-specific category has its own folder.
- Production-ready assets consumed by a website or application belong in that project's live implementation files, not in PROAD.
- The graphics folder must use its local `.gitignore` to recursively ignore ordinary working files while keeping directories, every nested `index.md`, and the local `.gitignore` trackable.
- Nested `index.md` files may document meaningful subfolders and should describe folder roles and major entry points rather than catalog every graphic file.
- `docs/` remains the AIA-managed knowledge repository and should not be used merely as a storage location for ordinary supporting artifacts.
- The key is discoverability through linking, not deep subfolder organization.

## Working Pattern

Each entry in `project/supporting-material-entries.md` should help the human answer:

- what is this
- where is it
- why does it matter
