# Default vs Specialized Routing

This file explains when to stay on the default skill and when to move to a specialized one.

## Default skill

The default skill is:
- `openclaw-manus`

Use it when:
- the task is still being clarified
- the task spans multiple lanes
- no single specialized skill clearly dominates
- you want broad planning + execution + reporting behavior

## Specialized skills

Specialized skills should be used when the task becomes narrow enough that one execution style clearly helps.

### `openclaw-ops`
Switch when the task is mostly about:
- incidents
- status checks
- logs
- config
- ports/processes/connectivity
- runtime validation

### `openclaw-research`
Switch when the task is mostly about:
- freshness-sensitive information
- current docs or API checks
- comparisons across sources
- differentiation analysis
- evidence-backed research summaries

### `openclaw-coding`
Switch when the task is mostly about:
- code changes
- bug fixing
- repo cleanup
- narrow refactors
- build/test/lint validation

### `openclaw-docs`
Switch when the task is mostly about:
- README review
- setup-flow checks
- runbook validation
- release-note consistency
- doc-to-code drift correction

## Switching threshold

A practical switching rule:
- stay on `openclaw-manus` while the task is exploratory
- switch once the next several steps are clearly specialized
- return to `openclaw-manus` if the task broadens again

## Examples

### Example 1: unclear repo issue
Start with:
- `openclaw-manus`

If inspection shows the issue is a failing test or broken code path:
- switch to `openclaw-coding`

### Example 2: bot is not replying
Start directly with:
- `openclaw-ops`

If root cause becomes a code regression:
- switch to `openclaw-coding`

### Example 3: compare similar projects
Start with:
- `openclaw-research`

If the result must be turned into internal README or decision docs:
- switch to `openclaw-docs`

### Example 4: README is outdated
Start with:
- `openclaw-docs`

If the docs are actually correct and implementation is wrong:
- switch to `openclaw-coding`

## Anti-patterns

Avoid:
- routing to a specialized skill too early
- keeping a task on `openclaw-manus` after it becomes obviously specialized
- switching lanes on every small sub-step without reason
- treating routing as permanent when the task shape clearly changes

## Verifiable check

This default-vs-specialized split is working if:
- mixed tasks still get strong structure from `openclaw-manus`
- specialized tasks show stronger benchmark results under the specialized skill
- lane switches are easy to explain in one sentence
