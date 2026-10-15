---
id: development-host-transfer-agreements
type: agreements
status: active
scope: repository-wide
applies_to: aia
updated: 2026-10-03
---

# Development Host Transfer Agreements

## Purpose

Define how the single active PROAD development-host role moves safely to another PROAD workspace without mixing client projects, losing unfinished framework work, or leaving two active hosts.

## Single-Host Rule

- There must be exactly one active PROAD development host.
- A top-level `raw/index.md` is the practical development-host marker. It must exist only on the active host.
- A development-host transfer is a distinct controlled operation. It is not an ordinary installation, existing-installation update, version promotion, or standalone release.
- Merely copying an installed PROAD, `proad-template/`, or the standalone release does not transfer development authority.

## Transfer Scope

The transfer moves three distinct bodies of state under different rules:

1. **Live framework state:** the current framework-controlled files from the old live host, including unreleased reusable work. The approved template alone is insufficient because it may lag behind live development.
2. **Approved template state:** the old host's complete `proad-template/`, when present, copied exactly so later promotion retains its known baseline.
3. **Development-host Raw:** the complete top-level `raw/` directory copied byte-for-byte, including its index and every capture.

Client-project state never transfers between hosts. The old host's `project/` remains with the old project, and the target's `project/` remains with the target project.

Completed promotion logs and other historical evidence may be preserved as records, but they are not live transferable transactions. An unfinished promotion transaction blocks host transfer and must first be completed, safely recovered, or otherwise resolved under the promotion agreements.

## Eligible Targets

### Existing Client PROAD

When an existing client project's PROAD becomes the new host:

- preserve its complete client-owned `project/` state;
- update reusable project scaffolds only under normal metadata-driven existing-installation rules;
- replace or add framework-controlled files from the old live host as required by the verified transfer plan;
- do not import any file from the old host's client `project/`.

### New PROAD Installation

When a newly installed PROAD becomes the new host:

- initialize it from the approved generic template state;
- retain its new generic `project/` scaffolding rather than importing the old host's client project;
- then bring its framework-controlled files to the old host's current live working state;
- transfer the approved template state and development-host Raw separately under the rules above.

In both cases, the resulting development framework state must be equivalent. Only the target project's own `project/` content differs.

## Mandatory Transfer Protocol

Development-host transfer must be a prepared, reviewed, and recoverable two-workspace transaction.

### Preparation

Before mutation, the AIA must:

1. obtain explicit source and target paths and confirm which target case applies;
2. resolve both paths absolutely and prove they are distinct PROAD workspaces;
3. confirm that the source is the current host and that the target is not already marked as another active host;
4. refuse to continue while an unfinished promotion or earlier host-transfer transaction exists;
5. identify source framework state, optional approved template state, complete development Raw, and both protected project trees;
6. reject reparse points or ambiguous nested-workspace boundaries that could escape the declared roots;
7. create verified recoverable backups and path/type/size/SHA-256 inventories of both complete workspaces outside both workspaces;
8. construct the proposed target state outside the active target;
9. produce an exact transfer manifest and human-readable report showing additions, replacements, preserved target state, and proposed old-host cleanup;
10. leave both live workspaces unchanged until the exact prepared result is approved.

No generic recursive copy from the old `proad/` onto the target is allowed.

### Activation

After explicit approval of the exact prepared transaction, activation must:

1. verify that neither workspace has drifted from its preparation inventory;
2. activate and validate the prepared target;
3. prove that the target's protected client `project/` content was preserved;
4. prove exact transfer of the current framework state, optional approved template, and complete development Raw;
5. only after the new host passes every check, remove development-host-only state from the old host;
6. validate the old host as an ordinary installed PROAD with its complete client `project/` preserved;
7. prove that top-level `raw/index.md` exists on the new host and no longer exists on the old host;
8. report the final host paths and verification result.

## Old-Host Cleanup

Successful transfer must leave the old workspace as an ordinary installed PROAD:

- remove its complete top-level `raw/` only after the target copy has been verified;
- remove its local `proad-template/` when the old workspace will remain an ordinary client installation;
- remove any other state explicitly classified by current agreements as development-host-only;
- preserve its complete `project/`, ordinary framework installation, and client-owned content;
- preserve completed historical evidence where it is stored unless separate deletion is explicitly authorized.

The cleanup is part of transfer completion, not optional later housekeeping. If cleanup cannot be verified, the operation is incomplete and must not claim that the host role moved successfully.

## Failure And Recovery

- Failure before activation must leave both workspaces unchanged.
- Failure after either workspace is mutated must restore and verify both complete pre-transfer states from their verified backups.
- Recovery must not begin by recursively deleting either live workspace.
- If full restoration cannot be verified, preserve all backups, manifests, quarantine, and transaction evidence; stop and request human direction.
- Never solve a failed transfer by designating both workspaces as development hosts.

## Completion Criteria

A development-host transfer is complete only when:

- the new host contains the verified current live framework state;
- its approved template baseline, when one existed, is preserved exactly;
- its top-level development Raw exactly matches the prepared source Raw;
- neither client project was copied into the other;
- the old host retains its own client project and contains no development-host marker or development-only template target;
- no unfinished transfer transaction remains; and
- the human-facing current-development-state references identify the new host without rewriting historical release records.

