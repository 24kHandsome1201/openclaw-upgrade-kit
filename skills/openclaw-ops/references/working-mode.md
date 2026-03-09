# Working Mode

This file defines the preferred working mode for `openclaw-ops` on non-trivial ops and incident tasks.

The purpose is to keep ops work:
- staged
- evidence-first
- safely delegatable when scope is clean
- reviewable before remediation is accepted

## Core principle

Do not treat ops work as one continuous troubleshooting stream.

Instead:
1. define the current incident stage
2. define the evidence or corrective output expected from that stage
3. define how the result will be validated
4. execute or delegate the scoped work
5. review findings before remediation is accepted
6. move to the next stage only after state is clearer

## Stage-first ops mode

Typical ops stages:
- target identification
- health and status inspection
- log and config inspection
- cause narrowing
- smallest safe corrective action
- post-action validation
- handoff or rollback guidance

Each stage should answer:
- what runtime question is being resolved?
- what evidence should be collected?
- what action, if any, is allowed in this stage?
- how will the result be validated?

## Verifiable deliverables rule

Every meaningful stage should produce at least one verifiable ops artifact.

Examples:
- service status output
- relevant log evidence
- config inspection note tied to actual file contents
- validated remediation step
- rollback or blocker note tied to observed state

Avoid vague stage endings such as:
- "service seems fine"
- "probably a config issue"
- "should be fixed now"

## Delegation rule for ops work

Ops work may be delegated when evidence sources are independent.

Good delegation candidates:
- local health check vs remote competing-host check
- log review vs config review
- benchmark writeup vs remediation summary
- one service target vs another independent service target

Avoid parallel delegation when:
- multiple subtasks may change the same config
- remediation depends on unfinished diagnosis
- the same runtime state may change during overlapping actions

## Parent-agent responsibility

When ops work is delegated, the parent agent should:
1. define the target service/host/scope clearly
2. define what evidence or action is allowed
3. require validation or rollback expectations
4. review findings before remediation is accepted
5. ensure risky actions were not taken outside scope
6. run or confirm post-action validation
7. commit or summarize only after accepted evidence is clear

## Evidence-before-remediation rule

Do not accept delegated ops output only because the proposed fix sounds plausible.

Before integration:
- inspect the evidence gathered
- confirm the remediation matches the observed state
- check whether rollback or risk was considered
- verify whether the post-action state was actually checked

## Keep-actions-small rule

A good staged ops flow usually looks like:
- identify one likely issue
- gather evidence for it
- take one small safe corrective action
- validate it
- continue only if another blocker remains

## Working-mode success criteria

The working mode is functioning well when:
- incident work is broken into explicit stages
- each stage leaves behind real evidence or validated action
- delegated work has clean runtime scope
- remediation is reviewed before acceptance
- rollback and remaining risk are visible
