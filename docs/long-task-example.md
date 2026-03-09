# Long-Task Example

This example shows how an execution-oriented agent can handle an interrupted multi-step task without losing structure.

## Scenario

Task:
- review a repository
- identify one high-value issue
- apply a small safe fix
- validate it
- summarize outcome

The task becomes a long task because:
- it spans multiple stages
- it includes a state-changing patch
- validation is not immediate
- the task is interrupted before completion

## Stage model

### Stage 1 — Discovery
Goal:
- inspect repository structure
- identify the most likely high-value issue

Output:
- relevant files identified
- initial evidence collected
- likely fix direction chosen

### Stage 2 — Execution
Goal:
- apply the smallest useful change

Output:
- patch applied
- changed files recorded
- immediate risk noted

### Stage 3 — Validation
Goal:
- confirm the fix actually improved the situation

Output:
- validation command or check result
- remaining uncertainty clearly marked

### Stage 4 — Completion
Goal:
- summarize what changed
- note what was validated
- leave a clear next step if anything remains

## Example timeline

## Pass 1: work begins

### Long-task update
- Goal: fix one obvious repository issue with a minimal validated change
- Current stage: discovery
- Completed:
  - inspected repo structure
  - checked config and package metadata
  - identified one outdated reference likely causing confusion
- Evidence:
  - config file points to a value no longer reflected elsewhere
  - related command/file names are inconsistent
- Changed:
  - no changes yet
- Remaining:
  - patch the inconsistency
  - validate after patch
- Risks / blockers:
  - runtime environment is not yet needed, so no blocker yet
- Next step:
  - apply the minimal fix and then validate

## Pass 2: patch applied, then interrupted

### Long-task update
- Goal: fix one obvious repository issue with a minimal validated change
- Current stage: validation
- Completed:
  - inspected the relevant files
  - applied the minimal patch
- Evidence:
  - the changed file now matches the intended command/path naming
- Changed:
  - one file updated
- Remaining:
  - validate with a focused check
- Risks / blockers:
  - session interrupted before validation completed
- Next step:
  - rerun the targeted validation check before calling the task complete

## Checkpoint recorded

- Task: repo cleanup and minimal validated fix
- Goal: improve correctness with one safe change
- Current stage: validation
- Status: active
- Completed so far:
  - inspected repository metadata
  - identified one outdated reference
  - patched the mismatch
- Evidence gathered:
  - relevant config and command references compared
  - file contents confirm the new value is consistent
- Changes made:
  - one file edited
- Validation status:
  - patch applied
  - validation still pending
- Risks / blockers:
  - no external blocker, but validation was not completed before interruption
- Exact next step:
  - run the targeted validation check and summarize outcome
- Resume notes:
  - re-open the changed file
  - rerun the exact validation step before making any new changes

## Pass 3: resumed later

Resume logic:
1. read the checkpoint
2. verify the changed file still contains the expected patch
3. run the pending validation step
4. summarize outcome

### Recovery update
- Restored stage: validation
- Rechecked state:
  - changed file still contains the intended patch
  - no conflicting edits detected
- Validation run:
  - focused check confirms the inconsistency is no longer present
- Remaining:
  - final summary only
- Next step:
  - close the task with explicit validated/unvalidated boundaries

## Final completion

## Completed
- Goal: fix one obvious repository issue with a minimal validated change
- What I did:
  - inspected the relevant repo files
  - identified one outdated inconsistency
  - applied a focused patch
  - resumed later and completed the pending validation step
- What I found:
  - the issue was narrow and did not require a broader refactor
- Validation:
  - targeted validation completed successfully
  - no runtime/system-level validation was needed for this task
- Output / deliverable:
  - one small repository fix with validation summary
- Next step:
  - optionally run a second cleanup pass for similar inconsistencies

## Why this example matters

This example demonstrates that good long-task behavior is not just:
- doing many steps

It is:
- keeping stage state explicit
- leaving a useful checkpoint
- resuming without re-discovering everything
- distinguishing completed work from pending validation
