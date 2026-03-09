# Delegation Patterns

This document defines a practical multi-agent delegation pattern for `openclaw-upgrade-kit` and similar execution-oriented agent workflows.

The goal is to keep delegated work:
- scoped
- parallelizable when safe
- easy to review
- easy to integrate
- tied to verifiable deliverables

## Core principle

Do not delegate work as a vague request like:
- “go improve this repo”
- “fix things”
- “review everything”

Instead, delegate as a bounded execution unit with:
1. a clear goal
2. a limited write scope
3. a concrete deliverable
4. an acceptance check

## What work is good for parallel delegation

Parallel delegation works best when subtasks are independent and their outputs do not fight over the same state.

Good candidates:
- one doc file vs another doc file
- one benchmark result example vs another benchmark result example
- one skill folder vs another skill folder
- scripts vs docs
- release notes vs issue templates
- layout examples vs routing examples

Strong signs a task is parallel-safe:
- different files or directories
- no shared mutable runtime state
- no dependency on unfinished upstream edits
- review can happen independently

## What work is poor for parallel delegation

Avoid parallel delegation when:
- multiple subtasks will edit the same file
- the work depends on one earlier decision not yet made
- the runtime state may change during concurrent work
- two workers would produce overlapping conclusions
- validation depends on a single unstable system state

Examples of poor parallel candidates:
- two workers both rewriting `README.md`
- two workers both changing the same config file
- one worker patching code while another updates validation notes for that same patch
- two workers independently synthesizing the same research conclusion

## Delegation unit design

A good delegated task should define:
- target files
- task goal
- expected output shape
- constraints
- explicit non-goals

Good example:
- write `benchmarks/results/ops-conflict-example.md`
- keep structure aligned with existing benchmark result files
- do not modify `README.md`

Weak example:
- improve ops documentation

## Write-scope rule

Each child task should have a narrow write scope.

Preferred scope shapes:
- one file
- one folder
- one family of related files

Examples:
- `skills/openclaw-runtime/**`
- `docs/runtime-layout-examples.md`
- `benchmarks/results/ops-*.md`

A narrow write scope reduces:
- merge conflicts
- duplicated work
- accidental rewrites
- unclear ownership

## Parent-agent responsibilities

The parent agent is responsible for final quality.

Before delegation, the parent agent should define:
1. the exact task goal
2. the allowed write scope
3. the expected deliverable
4. what should not be changed
5. any required style or structural constraints

After delegation, the parent agent should:
1. inspect the changed files
2. check for overlap or drift
3. verify file paths and references
4. run relevant commands or checks if needed
5. make small corrections if needed
6. accept or reject the result explicitly
7. commit only after accepted integration

## Child-task expectations

A child task should try to return:
- changed files
- concise summary of what changed
- core reasoning or structural choice
- validation performed
- limitations or next-step suggestions

A child should not assume automatic acceptance.

## Review-before-integration rule

Do not merge delegated output blindly.

Before acceptance, review:
- whether the files match the assigned scope
- whether the content matches existing repo style
- whether references point to real files
- whether any claims exceed the evidence
- whether another child touched overlapping territory

If needed, make a small integration correction before commit.

## Conflict-avoidance patterns

Use these patterns to reduce conflicts:

### Pattern 1: Split by directory
- one worker on `skills/`
- one worker on `docs/`
- one worker on `benchmarks/results/`

### Pattern 2: Split by artifact type
- one worker on scripts
- one worker on release docs
- one worker on issue templates

### Pattern 3: Split by specialization
- one worker on ops
- one worker on research
- one worker on coding
- one worker on docs

### Pattern 4: Keep the entry file owned by the parent
For high-traffic files like `README.md`, prefer:
- children produce supporting artifacts
- parent updates the entry file after reviewing everything

## Verifiable-deliverable rule

Every delegation round should end with real deliverables.

Examples:
- a new skill folder
- a benchmark result example
- a validated script
- a release checklist update
- a routing or integration doc

Avoid rounds that end only with:
- brainstorming
- opinions without artifacts
- vague proposals without files

## Round structure

A good multi-agent round often looks like:
1. define the phase goal
2. define 2–5 parallel-safe child tasks
3. assign narrow write scopes
4. wait for completion
5. review and integrate
6. run validation
7. commit and push
8. decide the next round

## Acceptance checklist

Before accepting a delegation round, check:
- [ ] each child stayed in scope
- [ ] outputs are real and reviewable
- [ ] no overlapping edits were merged blindly
- [ ] references and file paths are valid
- [ ] relevant scripts or checks were run where needed
- [ ] commit scope matches accepted files only

## Signs the delegation pattern is working well

- the parent agent can review outputs quickly
- each round produces concrete repository changes
- conflicts are rare and easy to resolve
- delegated work speeds up progress without lowering quality
- repo structure becomes more coherent rather than more fragmented

## Signs the delegation pattern is failing

- too many workers touch the same files
- parent review becomes harder than doing the work directly
- rounds produce lots of prose but few artifacts
- validation is skipped because outputs are too fragmented
- commit scope becomes unclear

## Minimal operating rule

If a task cannot be scoped cleanly, do not parallelize it yet.

First narrow the phase, then delegate.
