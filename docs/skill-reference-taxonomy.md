# Skill Reference Taxonomy

This file defines a lightweight taxonomy for the reference files under each skill's `references/` directory.

The goal is not to force every skill into identical filenames.
The goal is to make the structure easier to understand, maintain, and delegate against.

## Core idea

Each skill should make it obvious which references cover:
- **working mode**
- **reporting / output structure**
- **validation / evidence boundaries**
- **examples**
- **skill-specific operating knowledge**

Some skills express these with the same filename.
Some express them with skill-specific names.
That is acceptable as long as the role is clear.

## Shared reference concepts

### 1. Working mode
Purpose:
- how the skill should be used on non-trivial tasks
- staged execution
- delegation / review posture
- progress expectations

Typical filename:
- `working-mode.md`

Current pattern:
- present across the main skills and should remain the default place for execution posture

### 2. Reporting / output structure
Purpose:
- expected response structure
- what sections should be visible
- how scope, progress, blockers, or deliverables are reported

Possible filenames:
- `reporting-format.md`
- skill-specific guidance embedded in loop / evidence docs

Current pattern:
- `openclaw-manus` uses `reporting-format.md`
- other skills may express reporting expectations through validation or loop docs

### 3. Validation / evidence boundaries
Purpose:
- what counts as confirmed
- how to distinguish fact vs inference
- how to talk about blocked or unvalidated states

Possible filenames:
- `validation-patterns.md`
- `validation-boundaries.md`
- `evidence-requirements.md`
- related sections inside synthesis/release docs

Current pattern:
- coding / ops lean on `validation-patterns.md`
- docs uses `validation-boundaries.md`
- release uses `evidence-requirements.md`
- research uses `synthesis-patterns.md` for fact / inference separation

### 4. Examples
Purpose:
- show expected behavior concretely
- provide reusable few-shot style patterns
- show good blocked / validated / progressive responses

Typical filename:
- `examples.md`

Current pattern:
- `openclaw-manus` has a dedicated `examples.md`
- other skills may rely more on repo-level examples under `examples/`

### 5. Skill-specific operating knowledge
Purpose:
- the domain-specific loop/checklist/policy that makes the skill distinct

Examples:
- `execution-loop.md`
- `research-loop.md`
- `routing-loop.md`
- `release-loop.md`
- `ops-checklist.md`
- `source-hierarchy.md`
- `tool-selection-policy.md`
- `layout-selection.md`

This is where intentional asymmetry is expected.

## Per-skill reading pattern

A reader or delegated worker should usually read references in this order:

1. `working-mode.md` if the task is multi-step or delegated
2. the skill's main loop / checklist / policy file
3. the validation/evidence-oriented reference
4. the reporting/examples reference if output shape matters
5. any remaining skill-specific reference only if needed

## Practical convention

When adding or revising a skill, aim for this minimum structure:
- one entry point for **working mode**
- one entry point for **validation/evidence boundary**
- one entry point for the **main operating loop or checklist**
- optional reporting/examples file when the skill needs more explicit output control

A skill does **not** need every filename to match other skills.
It **does** need each concept to be discoverable.

## Maintenance guidance

When delegating work, describe reference roles, not just guessed filenames.

Preferred:
- "update the validation/evidence boundary reference"
- "patch the working-mode guidance"
- "extend the main routing loop"

Less reliable:
- "edit reporting-format.md" without checking whether that skill actually has one

## Current quick map

- `openclaw-manus`
  - broad reference baseline with working mode, reporting, examples, execution loop, and policy docs
- `openclaw-coding`
  - loop + diff strategy + validation + working mode
- `openclaw-docs`
  - review loop + drift checklist + validation boundaries + working mode
- `openclaw-ops`
  - incident loop + checklist + validation + working mode
- `openclaw-research`
  - research loop + source hierarchy + synthesis boundaries + working mode
- `openclaw-runtime`
  - routing loop + fallback + manual routing + layout selection + working mode
- `openclaw-release`
  - release loop + evidence requirements + boundary checks + working mode

## Success criteria

This taxonomy is working if:
- delegated workers stop guessing the wrong file names
- maintainers can quickly find where reporting vs validation vs loop guidance lives
- skill-specific differences remain allowed, but not confusing
