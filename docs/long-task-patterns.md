# Long-Task Patterns

This file defines how execution-oriented open agents should handle multi-step tasks that cannot be completed in a single short loop.

The goal is to keep long tasks:
- structured
- observable
- resumable
- reviewable

## When to treat a task as a long task

Use a long-task pattern when one or more of these are true:
- the work spans multiple meaningful stages
- the task may require multiple rounds of validation
- blockers or user decisions may appear mid-task
- the result depends on intermediate artifacts
- the task may need to pause and resume later

Examples:
- multi-step repo cleanup
- incident investigation across logs, config, and runtime checks
- research followed by implementation or documentation updates
- documentation drift review across many files

## Core long-task loop

For long tasks, prefer this sequence:

1. define the goal
2. define the task stages
3. create an initial checkpoint
4. execute the current stage
5. record evidence and state changes
6. update the checkpoint
7. continue, pause, or finish

## Stage model

A long task should usually be split into explicit stages.

Typical stage types:
- discovery
- planning
- execution
- validation
- handoff or completion

Example:
- Stage 1: inspect repo state
- Stage 2: identify high-value issue
- Stage 3: apply minimal fix
- Stage 4: validate
- Stage 5: summarize and hand off

## What each stage should produce

Each stage should leave behind:
- a clear status
- observed evidence
- any changed files or state
- remaining risks or blockers
- the next intended step

A stage should not end with only vague commentary.

## Progress update pattern

For longer tasks, use updates that answer:
- what stage is active
- what has been completed
- what evidence was gathered
- what remains
- whether the task is blocked

Suggested shape:

### Long-task update
- Goal: ...
- Current stage: ...
- Completed: ...
- Evidence: ...
- Changed: ...
- Remaining: ...
- Risks / blockers: ...
- Next step: ...

## Checkpoint rule

At the end of each meaningful stage, create or update a checkpoint.

A checkpoint should be enough to let another agent or a future session continue without re-discovering everything.

See `docs/checkpoint-template.md`.

## Pause rule

Pause a long task when:
- a risky decision requires confirmation
- required access is missing
- the current stage is complete but the next stage depends on external input
- validation must wait for a later environment or system state

When pausing, leave behind:
- current checkpoint
- current blocker
- exact next action

## Resume rule

When resuming a long task:
1. read the latest checkpoint
2. verify whether the recorded state is still current
3. confirm whether the blocker still applies
4. continue from the next incomplete stage

Do not repeat the entire task unless the state has materially changed.

## Validation rule for long tasks

Do not wait until the final stage to think about validation.

Prefer validation at stage boundaries:
- validate after meaningful changes
- validate before calling a stage complete
- note what remains unvalidated

## Good long-task behavior

Good behavior:
- visible stage progression
- clear checkpoint history
- evidence-backed updates
- explicit next actions
- resumable state

Bad behavior:
- starting over from scratch each time
- vague "still working" updates
- losing track of what changed
- mixing completed and unverified work without distinction
