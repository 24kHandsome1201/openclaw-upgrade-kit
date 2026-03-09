# Working Mode

This file defines the preferred working mode for `openclaw-manus` on non-trivial tasks.

The purpose is to make execution-oriented work:
- staged
- verifiable
- parallelizable when useful
- easy to review and continue

## Core principle

Do not treat the task as one long undifferentiated conversation.

Instead:
1. define the current stage goal
2. define the concrete deliverable for that stage
3. define how completion will be verified
4. execute or delegate the work
5. review and integrate the result
6. move to the next stage

## Stage-first working mode

For meaningful tasks, prefer explicit stages.

Typical stage shapes:
- framing
- planning
- implementation
- validation
- packaging or release
- handoff

Each stage should answer:
- what is the goal?
- what is the deliverable?
- how will success be checked?

## Verifiable deliverables rule

Every meaningful stage should produce at least one verifiable deliverable.

Examples:
- a file
- a patch
- a benchmark result
- a script
- a validated command output
- a checklist pass
- a documented decision with evidence

Avoid vague stage endings such as:
- "thought through the problem"
- "have some ideas"
- "it should be better now"

## Parallel delegation rule

If parts of the task are independent, they may be delegated in parallel.

Good parallel candidates:
- different documentation files
- different benchmark examples
- different specialized skills
- scripts vs docs
- release notes vs release checklist

Do not parallelize if the work shares the same files or depends on unfinished upstream state.

## Parent-agent responsibility

When work is delegated, the parent agent should:
1. define the subtask clearly
2. define allowed write scope
3. define the expected deliverable
4. wait for completion
5. review the result
6. integrate or reject it
7. run final validation
8. commit and summarize if the work is accepted

The parent agent remains responsible for final quality.

## Child-task specification rule

A delegated task should be explicit about:
- target files
- task goal
- expected output
- constraints
- what not to change

Good example:
- add one benchmark example under `benchmarks/results/`
- do not modify README
- keep scoring aligned with `benchmarks/rubric.md`

## Review-before-integration rule

Do not merge delegated work blindly.

Before accepting delegated output:
- inspect the changed files
- check for overlap or drift
- verify references and file paths
- run relevant scripts or checks if applicable
- make small corrections if needed

## Commit-after-acceptance rule

When work is accepted, prefer this order:
1. verify working tree state
2. stage the intended files
3. commit with a scoped message
4. push only after acceptance is clear

Do not commit unreviewed or ambiguous output.

## Keep momentum rule

Once a stage is accepted, continue to the next highest-value stage instead of stalling.

A good execution loop often looks like:
- plan stage
- produce deliverable
- verify
- accept
- continue

## Working-mode success criteria

The working mode is functioning well when:
- tasks are broken into explicit stages
- each stage has a real deliverable
- verification is visible
- parallel work is scoped cleanly
- delegated work is reviewed before acceptance
- the overall task can continue without losing structure
