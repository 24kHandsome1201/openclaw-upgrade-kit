# Skill Selection Guide

Use this guide to decide which skill to apply.

## Default recommendation

If you are unsure, start with:
- `openclaw-manus`

It is the general execution-upgrade skill.

The full packaged skill set is broader than the recommended starting set:
- **Recommended first skills** are the ones most users need first (`openclaw-manus`, then the domain skills).
- **Full skill set** also includes advanced/specialized support skills like `openclaw-runtime` and `openclaw-release`.

## Skill chooser

### Choose `openclaw-manus` for:
- general execution-oriented work
- mixed tasks that span planning, inspection, and delivery
- repository reviews when you do not yet need a specialized skill
- docs review when no dedicated docs skill is available

### Choose `openclaw-ops` for:
- service failures
- logs and config issues
- runtime debugging
- connectivity / process / port checks
- deployment/runtime validation
- incident-style operational tasks

### Choose `openclaw-research` for:
- latest-information tasks
- source-backed comparisons
- differentiation analysis
- vendor/docs/API verification
- tasks where freshness and source quality matter

### Choose `openclaw-coding` for:
- bug fixing
- implementation changes
- repository cleanup
- small focused refactors
- test/build/lint troubleshooting
- code changes requiring validation

### Choose `openclaw-docs` for:
- README review
- setup/runbook validation
- doc-to-code drift detection
- release note consistency checks
- documentation correction tied to real implementation

### Choose `openclaw-runtime` for:
- routing decisions between skills
- fallback policy questions
- host/runtime layout selection
- integration-path design
- manual handoff between general and specialized skills
- tasks where the main work is choosing or explaining execution lanes rather than doing the domain task itself

### Choose `openclaw-release` for:
- release-readiness checks
- dry-run review and evidence collection
- packaging/archive verification
- deciding whether a release should be treated as ready, risky, or blocked
- tasks where the main work is release gating rather than coding or runtime diagnosis

## Decision shortcut

Ask:

### Is this primarily an ops/runtime problem?
- yes -> `openclaw-ops`
- no -> continue

### Is freshness / source quality the main issue?
- yes -> `openclaw-research`
- no -> continue

### Is the main task editing or validating code?
- yes -> `openclaw-coding`
- no -> continue

### Is the main task reviewing or correcting documentation against implementation?
- yes -> `openclaw-docs`
- no -> continue

### Is the main task routing, fallback, or runtime-integration choice?
- yes -> `openclaw-runtime`
- no -> continue

### Is the main task release-readiness, dry-run evidence, or packaging verification?
- yes -> `openclaw-release`
- no -> `openclaw-manus`

## Layering pattern

A useful pattern is:
- default to `openclaw-manus`
- switch to `openclaw-ops` when the task becomes runtime/incident-heavy
- switch to `openclaw-research` when current-source verification becomes central
- switch to `openclaw-coding` when implementation changes and validation become the main work
- switch to `openclaw-docs` when the main work becomes doc review or doc-to-code correction
- switch to `openclaw-runtime` when the task is mainly about choosing lanes, fallback, runtime layout, or handoff behavior
- switch to `openclaw-release` when the task becomes release-gating, dry-run review, or packaging-evidence work

## Fallback relationship

Use `openclaw-manus` as the general fallback when:
- the task is mixed or still being discovered
- multiple lanes are active at once
- a specialized skill finishes its narrow role and the task returns to broader execution

`openclaw-runtime` and `openclaw-release` are usually not the first skill for a brand-new user task. They are support-specialized skills that become valuable once routing or release-readiness is the dominant problem.

## Future direction

As more skills are added, this guide can expand into a more complete routing map.
