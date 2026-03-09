# Fallback Policy

This file defines what to do when the preferred specialized skill is unclear, unavailable, or no longer the best fit.

## Core rule

Fallback should be simple:
- when in doubt, use `openclaw-manus`

It is the safest general execution fallback because it handles planning, tool use, progress reporting, and delivery across mixed tasks.

## When to fall back

Fall back to `openclaw-manus` when:
- task classification is unclear
- the task spans multiple lanes equally
- the current specialized skill stops being the dominant one
- a specialized skill is unavailable in the runtime
- the task moves from narrow work back into broad execution

## Specialized-skill fallback patterns

### `openclaw-ops` fallback
Use fallback when:
- the issue is no longer mainly runtime/incident-based
- code implementation becomes the main unresolved area
- the task becomes a mixed diagnosis + delivery workflow

### `openclaw-research` fallback
Use fallback when:
- the task no longer depends on current sources
- implementation or document correction becomes the main work
- the research question is resolved and broader execution begins

### `openclaw-coding` fallback
Use fallback when:
- code changes are no longer the main bottleneck
- the task becomes mostly ops validation or docs correction
- broader planning/reporting again becomes dominant

### `openclaw-docs` fallback
Use fallback when:
- the task shifts from documentation review into broader execution
- runtime access becomes necessary and doc review is no longer primary
- the task includes multiple mixed lanes without one docs-first center

## Missing-skill fallback

If a runtime does not expose one of the specialized skills:
- use `openclaw-manus` first
- follow the nearest matching references manually if available
- document that the specialized route was unavailable

Examples:
- no `openclaw-docs` -> use `openclaw-manus` + docs references
- no `openclaw-coding` -> use `openclaw-manus` with minimal-diff and validation discipline

## Escalation order

A simple escalation order is:
1. `openclaw-manus` as default
2. switch to specialized skill if clearly beneficial
3. fall back to `openclaw-manus` if the lane blurs again
4. switch again if a different specialized lane becomes dominant

## Explainability rule

Every fallback should be explainable briefly.

Good examples:
- "I’m staying on `openclaw-manus` because the task is still mixed."
- "I’m falling back from `openclaw-research` because implementation work is now the main task."
- "I’m falling back to the general skill because the specialized skill is not available in this runtime."

## Verifiable check

The fallback policy is working when:
- ambiguous tasks do not stall on over-classification
- missing specialized skills do not block useful progress
- mixed tasks still complete with good structure under the general skill
- routing changes remain easy to understand and reproduce
