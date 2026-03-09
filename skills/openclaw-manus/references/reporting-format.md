# Reporting Format

This file defines how `openclaw-manus` should report progress, findings, and outcomes.

The main objective is clarity:
- what is being done
- what was found
- what changed
- what remains

## General rules

- be concise
- be explicit about state
- separate facts from assumptions
- make next steps obvious
- include blockers when relevant

## Default section set

For substantial tasks, prefer:

- Goal
- Plan
- Progress
- Findings
- Actions taken
- Validation
- Risks / blockers
- Next step

Not every response needs every section, but the structure should remain legible.

## Short-task format

Use for small or one-step tasks.

Template:

- Goal: ...
- Action: ...
- Result: ...
- Next step: ...

Example:

- Goal: check whether the service is listening on port 51102
- Action: ran a connectivity check
- Result: the port is reachable from the current host
- Next step: verify whether the application protocol responds correctly

## Standard progress update

Use during multi-step tasks.

Template:

### Progress update
- Checked: ...
- Found: ...
- Changed: ...
- Validated: ...
- Remaining: ...

This is useful when the task is ongoing and you want to keep the user informed without a full final summary.

## Final completion format

Use when the task is complete or a stable stopping point is reached.

Template:

## Completed
- Goal: ...
- What I did: ...
- What I found: ...
- Validation: ...
- Output / deliverable: ...
- Next step: ...

## Blocked format

Use when meaningful progress is blocked.

Template:

## Blocked
- Goal: ...
- What I checked: ...
- Blocker: ...
- Why it blocks progress: ...
- What is needed: ...
- Recommended next step: ...

## Risk / confirmation format

Use when a risky action or branching decision exists.

Template:

## Before proceeding
- Current state: ...
- Proposed action: ...
- Risk: ...
- Why confirmation matters: ...
- Options:
  1. ...
  2. ...

## Fact vs inference

Be explicit about the difference between:
- observed evidence
- inferred hypothesis

Preferred wording:
- "The logs show..."
- "The config contains..."
- "The test passed/failed..."
- "This suggests..."
- "My inference is..."

Avoid presenting inference as fact.

## Validation wording

When validation exists, state it clearly.

Examples:
- "Validated by rerunning the test suite"
- "Validated by checking service status after restart"
- "Validated by comparing the generated output file"
- "Validated against the official documentation"

If not validated, say so clearly:
- "Change applied but not validated in runtime"
- "Hypothesis identified, but confirmation is still needed"

## Deliverable-oriented reporting

Whenever possible, end with a tangible outcome.

Examples:
- patch applied
- config updated
- issue isolated
- benchmark comparison completed
- source-backed summary delivered
- next actions proposed

## Brevity guidance

Use shorter reporting for:
- trivial checks
- narrow factual verifications
- low-risk single-step actions

Use fuller reporting for:
- debugging
- code modifications
- infra changes
- long research tasks
- multi-step repo reviews

## Style guidance

Good reporting is:
- operational
- traceable
- structured
- evidence-aware

Bad reporting is:
- vague
- repetitive
- overly dramatic
- full of unverified claims
- disconnected from actual actions taken
