# v0.1.0 - Initial execution-upgrade MVP

## Summary

First public MVP of `openclaw-upgrade-kit`.

This release introduces a reusable upgrade layer for making OpenClaw-style agents more execution-oriented through skills, policies, examples, and benchmarks.

## Highlights

- added `openclaw-manus`, a general execution-upgrade skill
- added `openclaw-ops`, a specialized ops / incident-response skill
- added execution, tool-selection, reporting, and task-pattern references
- added before/after examples for coding, ops, research, and docs tasks
- added benchmark rubric and starter benchmark tasks
- added installation, launch, and integration documentation

## Core idea

> You only need to tell your agent how to work.

## Why this release matters

Most open agents can answer.
This project focuses on helping them:
- plan before acting
- use tools before guessing
- gather evidence before claiming
- report progress during long tasks
- deliver results instead of commentary

## Included skills

### `openclaw-manus`
General behavior upgrade for:
- planning
- tool-first execution
- evidence gathering
- progress reporting
- concrete delivery

### `openclaw-ops`
Specialized ops behavior for:
- service troubleshooting
- log inspection
- config validation
- runtime checks
- safe corrective actions

## Known limitations

This release does not yet include:
- deep runtime integration
- memory/state orchestration
- browser automation
- multi-agent coordination
- a universal one-command installer

## Next steps

- expand benchmark coverage
- add more task-specialized skills
- improve OpenClaw integration guidance
- explore runtime-level upgrade patterns
