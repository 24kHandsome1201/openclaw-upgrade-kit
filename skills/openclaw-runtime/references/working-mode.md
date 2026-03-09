# Working Mode

This file defines the preferred working mode for `openclaw-runtime` on non-trivial runtime-routing tasks.

The purpose is to keep runtime work:
- staged
- reviewable
- lightly delegatable when scope is clean
- explicit about routing and fallback decisions

## Core principle

Do not treat runtime work as abstract architecture talk.

Instead:
1. define the current routing or layout stage
2. define the concrete decision or artifact for that stage
3. define how the routing choice will be checked
4. execute or delegate the scoped work
5. review the output before integrating it
6. move to the next stage only after the routing logic is clearer

## Stage-first runtime mode

Typical runtime stages:
- task-shape identification
- dominant evidence-source selection
- default vs specialized routing choice
- fallback definition
- layout or integration choice
- handoff summary

Each stage should answer:
- what routing question is being solved?
- what skill or layout decision is in scope?
- how will the decision be checked against the real task shape?

## Verifiable deliverables rule

Every meaningful stage should produce at least one verifiable runtime artifact.

Examples:
- a routing decision note
- a skill-selection matrix
- a fallback path
- a layout recommendation tied to actual repo scripts
- a handoff sequence for mixed tasks

Avoid vague stage endings such as:
- "runtime looks fine"
- "probably use the coding skill"
- "this should route correctly"

## Delegation rule for runtime work

Runtime work may be delegated when routing or layout subproblems are independent.

Good delegation candidates:
- layout examples vs manual routing examples
- fallback rules vs skill-selection notes
- one host layout vs another host layout
- runtime docs vs benchmark examples that use them

Avoid parallel delegation when:
- multiple subtasks redefine the same routing rule
- the same entry decision is being rewritten in parallel
- one subtask depends on an unresolved routing choice from another

## Parent-agent responsibility

When runtime work is delegated, the parent agent should:
1. define the task shape to optimize for
2. define allowed files and routing scope
3. define the expected routing artifact
4. review whether the routing remains lightweight and explainable
5. verify that no nonexistent automation is claimed
6. integrate only after the skill handoff logic is coherent
7. commit only after accepted routing guidance is clear

## Transparent-execution entry point

For non-trivial runtime tasks, keep a minimum transparent-execution block visible:
- **Goal** — what routing or layout question is being solved
- **Plan** — what routing checks or comparisons will be done
- **Progress** — what has already been inspected, compared, or ruled out
- **Validation** — what is confirmed vs still only inferred
- **Next Step** — the next routing decision, handoff, or blocker

When wording findings, keep these boundaries explicit:
- **Fact** — directly observed from docs, files, scripts, or runtime evidence
- **Inference** — the current interpretation of those facts
- **Unvalidated** — a likely routing outcome or layout choice that still needs confirmation

If blocked, say so explicitly instead of leaving the routing state ambiguous:
- what was being decided
- what was checked
- what blocker remains
- what is needed next

## Explainable-routing rule

Do not accept delegated runtime output if it cannot explain:
- why the selected skill is the best current lane
- why fallback returns to `openclaw-manus`
- why a chosen layout matches the host/runtime constraints

Before integration:
- inspect the changed docs or references
- verify that skill names and paths exist
- confirm the routing logic matches current repo capabilities

## Keep-routing-light rule

A good staged runtime flow usually looks like:
- identify the main task shape
- choose the smallest useful routing change
- define a fallback path
- verify the decision remains understandable
- continue only if another routing question remains

## Working-mode success criteria

The working mode is functioning well when:
- routing tasks are broken into explicit stages
- each stage produces a real routing or layout artifact
- delegated work has clean decision boundaries
- fallback remains visible
- accepted runtime guidance stays grounded in existing repo capabilities
