# Resume and Recovery Guide

This file defines how to resume interrupted long tasks and how to recover safely when task state may be stale or incomplete.

## Goal

A resumed task should continue from known state, not restart blindly.

## Resume workflow

When resuming a task:

1. locate the latest checkpoint
2. restate the task goal
3. verify whether the recorded state is still current
4. identify the next incomplete stage
5. continue from the smallest useful next action

## What to re-verify on resume

Before trusting an old checkpoint, re-check any state that may have changed:
- repo branch or file state
- service status
- recent logs
- external docs or latest-info sources
- environment-specific configuration

## Safe resume rule

Prefer this sequence:
- trust prior structure
- re-check unstable state
- continue from the next incomplete step

Do not discard all prior work unless the checkpoint is clearly stale or invalid.

## Recovery cases

### Case 1: interrupted during execution
Recovery action:
- inspect what already changed
- confirm whether the stage partially completed
- avoid duplicating changes

### Case 2: interrupted before validation
Recovery action:
- inspect the latest changes or outputs
- run the intended validation step first
- only then continue

### Case 3: blocked waiting for user input
Recovery action:
- check whether the missing input has been provided
- if yes, resume at the next stage
- if no, restate the blocker and required input clearly

### Case 4: environment may have changed
Recovery action:
- re-check the unstable environment state
- update the checkpoint
- continue only after confirming current conditions

## Recovery output pattern

Use a concise recovery update like:

## Resume status
- Goal: ...
- Last known stage: ...
- Rechecked: ...
- Still valid: ...
- Changed since last checkpoint: ...
- Next step: ...

## When to abandon a prior checkpoint

Abandon or heavily revise a checkpoint when:
- the target repo or environment changed materially
- the previous evidence is no longer trustworthy
- the task goal changed
- prior changes were not actually applied as recorded

If this happens, say so explicitly and create a fresh checkpoint.

## Validation and recovery

Recovery is not complete until the agent knows whether the prior stage succeeded, failed, or is still pending.

Always try to answer:
- what is still true?
- what must be revalidated?
- what is the next smallest safe action?

## Good recovery behavior

Good recovery:
- resumes from structure, not memory alone
- re-checks unstable state
- avoids duplicated changes
- updates the checkpoint before moving on

Bad recovery:
- repeating the whole task without checking prior state
- assuming the environment is unchanged
- claiming resumed progress without revalidation
