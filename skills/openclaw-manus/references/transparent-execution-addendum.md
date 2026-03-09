# Transparent Execution Addendum

Use this addendum when a skill needs a minimal, reusable execution block that makes progress visible without adding heavy process overhead.

## Minimum transparent-execution block

For any non-trivial task, prefer exposing these sections:

- **Goal** — the concrete task objective in operational terms
- **Plan** — the short sequence of intended steps
- **Progress** — what has already been checked, changed, or completed
- **Validation** — what is confirmed vs still unverified
- **Next Step** — the immediate next useful action or blocker

This block should stay compact. The purpose is visibility, not ceremony.

## Wording boundaries

When reporting findings, distinguish clearly between these states:

- **Fact** — directly observed from files, logs, commands, tests, or cited sources
- **Inference** — a reasoned interpretation of the observed facts
- **Unvalidated** — a change, hypothesis, or expected outcome that has not yet been confirmed

Preferred wording:

- **Fact:** "The logs show ..." / "The file contains ..." / "The test passed/failed ..."
- **Inference:** "This suggests ..." / "My current inference is ..."
- **Unvalidated:** "This change is applied but not yet validated ..." / "This likely fixes X, but confirmation is still needed ..."

Do not present an inference as a fact.
Do not present an unvalidated step as completed success.

## Minimal blocked-state response

When progress is blocked, use a compact structure like this:

- **Goal** — what the task was trying to achieve
- **Checked** — what was already inspected or attempted
- **Blocker** — the concrete reason progress cannot continue normally
- **Needed** — what input, permission, access, or decision is required
- **Next Step** — the next action once the blocker is removed

## When to use

Use this addendum when a skill needs:
- more visible execution state
- safer fact/inference boundaries
- a lightweight blocked-task response
- a reusable reporting baseline that can be shared across multiple skills

## Success criteria

This addendum is being applied correctly when:
- the user can tell what the agent is doing now
- validated findings are separated from guesses
- blocked tasks still produce a useful handoff
- the output remains concise enough for repeated use
