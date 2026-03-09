# Skill Selection Guide

Use this guide to decide which skill to apply.

## Default recommendation

If you are unsure, start with:
- `openclaw-manus`

It is the general execution-upgrade skill.

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
- no -> `openclaw-manus`

## Layering pattern

A useful pattern is:
- default to `openclaw-manus`
- switch to `openclaw-ops` when the task becomes runtime/incident-heavy
- switch to `openclaw-research` when current-source verification becomes central
- switch to `openclaw-coding` when implementation changes and validation become the main work
- switch to `openclaw-docs` when the main work becomes doc review or doc-to-code correction

## Future direction

As more skills are added, this guide can expand into a more complete routing map.
