# Working Mode

This file defines the preferred working mode for `openclaw-coding` on non-trivial coding tasks.

The purpose is to keep coding work:
- staged
- verifiable
- reviewable
- delegatable when file ownership is clean

## Core principle

Do not treat coding work as one large edit pass.

Instead:
1. define the current coding stage
2. define the concrete artifact for that stage
3. define the validation method
4. execute or delegate the scoped work
5. review the result before integrating it
6. move to the next stage only after validation is clear

## Stage-first coding mode

Typical coding stages:
- issue framing
- file inspection
- reproduction or narrowing
- minimal patch
- validation
- cleanup or handoff

Each stage should answer:
- what code problem is being solved?
- what file(s) or output will change?
- how will the result be validated?

## Verifiable deliverables rule

Every meaningful stage should produce at least one verifiable coding artifact.

Examples:
- a patch
- a test result
- a build/lint result
- a narrowed root-cause note tied to file evidence
- a small validated refactor

Avoid vague stage endings such as:
- "probably fixed"
- "cleanup done"
- "refactor complete" without validation

## Delegation rule for coding work

Coding work may be delegated when file boundaries are clean.

Good delegation candidates:
- one benchmark example vs another benchmark example
- one reference doc vs another reference doc
- independent file-specific changes
- tests/validation notes separated from code-path analysis

Avoid parallel delegation when:
- multiple subtasks will edit the same file
- the fix depends on unfinished upstream changes
- the validation target is shared and unstable

## Parent-agent responsibility

When coding work is delegated, the parent agent should:
1. define the exact file scope
2. define the expected change shape
3. require a validation expectation
4. review the patch or output
5. check for overlap or unintended edits
6. run final validation before acceptance
7. commit only after accepted results are integrated

## Validation-first integration rule

Do not accept delegated coding output only because it looks reasonable.

Before integration:
- inspect the changed file(s)
- confirm the diff stays narrow
- verify validation claims
- check whether any behavior remains unconfirmed

## Keep-diff-small rule

A good staged coding flow usually looks like:
- isolate one issue
- produce one narrow patch
- validate it
- accept it
- continue only if another issue remains

## Working-mode success criteria

The working mode is functioning well when:
- coding tasks are broken into explicit stages
- each stage produces a real code or validation artifact
- delegated work has clean file boundaries
- validation happens before acceptance
- the final diff remains reviewable and justified
