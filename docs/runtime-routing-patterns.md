# Runtime Routing Patterns

This document describes how to route tasks between the general execution skill and the specialized skills in `openclaw-upgrade-kit`.

The main idea is simple:
- use `openclaw-manus` as the default execution layer
- switch to a specialized skill when the task shape becomes clearly dominated by one lane
- return to `openclaw-manus` when the task becomes mixed again

## Routing objective

A good routing policy should:
- start quickly without over-classifying
- choose a specialized skill only when the benefit is clear
- allow explicit switching as task shape changes
- preserve a useful fallback path

## Default starting rule

If the task type is unclear, mixed, or still being discovered, start with:
- `openclaw-manus`

Use it as the default because it is the broadest execution-oriented skill.

## Specialized routing table

| Task shape | Preferred skill | Why |
| --- | --- | --- |
| mixed execution task | `openclaw-manus` | best default for planning + inspection + delivery |
| service/runtime incident | `openclaw-ops` | strongest status/log/config/remediation discipline |
| latest-info or comparison task | `openclaw-research` | strongest source/freshness/evidence discipline |
| implementation or repo change | `openclaw-coding` | strongest inspect-edit-validate workflow |
| README/setup/runbook review | `openclaw-docs` | strongest doc-to-code validation discipline |

## Transition rules

Switch from `openclaw-manus` to a specialized skill when:
- more than half of the task clearly falls into one lane
- the next high-value action is specialized
- the relevant evidence source is specialized

Examples:
- the next step is reading logs and checking service state -> `openclaw-ops`
- the next step is checking current docs or public sources -> `openclaw-research`
- the next step is patching code and validating it -> `openclaw-coding`
- the next step is verifying README/setup drift -> `openclaw-docs`

## Return-to-default rule

Switch back to `openclaw-manus` when:
- the task broadens again
- multiple specialized lanes are now active
- final delivery matters more than lane-specific procedure
- the task becomes a mixed operator workflow rather than a narrow subtask

## Mixed-task patterns

### Research -> Coding
Use:
1. `openclaw-research` to verify current facts or compare options
2. `openclaw-coding` if implementation changes are then required
3. `openclaw-manus` if the work becomes a mixed end-to-end execution task

### Ops -> Coding
Use:
1. `openclaw-ops` to inspect runtime state, logs, and config
2. `openclaw-coding` if the root cause requires code changes
3. `openclaw-ops` again for runtime validation if needed

### Docs -> Coding
Use:
1. `openclaw-docs` to identify drift
2. `openclaw-coding` if implementation must change
3. `openclaw-docs` to finish the documentation correction

### Research -> Docs
Use:
1. `openclaw-research` to verify current public facts
2. `openclaw-docs` to correct internal docs or README text

## Routing signals by evidence source

Use the dominant evidence source to help choose the skill:

- logs/status/config -> `openclaw-ops`
- current web/official docs/sources -> `openclaw-research`
- repo files/tests/build output -> `openclaw-coding`
- README/setup/runbook text checked against implementation -> `openclaw-docs`
- mixed evidence sources with broad task flow -> `openclaw-manus`

## Minimal runtime policy

A lightweight runtime can still follow a useful routing policy:

1. start with `openclaw-manus`
2. inspect the first required evidence source
3. switch if a specialized lane becomes obvious
4. keep the specialized skill active while that lane dominates
5. return to `openclaw-manus` for mixed end-to-end execution

## Verifiable check

A routing policy is working well when:
- specialized tasks consistently land on the matching skill
- mixed tasks do not get over-routed too early
- a task can switch lanes without losing structure
- output quality improves in the matching benchmark category
