# Working Mode

This file defines the preferred working mode for `openclaw-docs` on non-trivial documentation review and correction tasks.

The purpose is to keep docs work:
- staged
- verifiable
- implementation-backed
- delegatable when document scope is clean

## Core principle

Do not treat docs work as freeform rewriting.

Instead:
1. define the current review stage
2. define the document or section in scope
3. define what must be verified against implementation
4. execute or delegate the scoped review/update
5. review the output before integrating it
6. move to the next stage only after validation boundaries are clear

## Stage-first docs mode

Typical docs stages:
- scope definition
- implementation inspection
- drift identification
- high-value correction
- validation-boundary summary
- handoff or follow-up

Each stage should answer:
- what document is in scope?
- what implementation source is being checked?
- what will count as a verified correction?

## Verifiable deliverables rule

Every meaningful stage should produce at least one verifiable docs artifact.

Examples:
- a corrected section
- a drift checklist result
- a validated command/path note
- a release-note consistency correction
- a clear statement of what is still not runtime-validated

Avoid vague stage endings such as:
- "docs improved"
- "README updated" without stating what was verified
- "should be accurate now"

## Delegation rule for docs work

Docs work may be delegated when document boundaries are independent.

Good delegation candidates:
- README vs runbook
- release notes vs setup guide
- one benchmark writeup vs another benchmark writeup
- checklist creation vs example result creation

Avoid parallel delegation when:
- multiple subtasks will edit the same document section
- a later docs task depends on an earlier unverified correction
- the same validation evidence is still changing

## Parent-agent responsibility

When docs work is delegated, the parent agent should:
1. define the target document(s)
2. define the implementation evidence to check
3. define what counts as validated vs unvalidated
4. review the resulting text carefully
5. verify paths, commands, claims, and filenames
6. integrate only after checking wording against real repo state
7. commit only after accepted corrections are clear

## Validation-boundary rule

Do not accept delegated docs output if it blurs:
- file-validated facts
- inferred behavior
- runtime-unconfirmed claims

Before integration:
- inspect the changed docs
- verify referenced commands/files/paths
- confirm the wording matches the real repository state
- ensure unknowns are labeled clearly

## Keep-corrections-focused rule

A good staged docs flow usually looks like:
- identify one high-value drift area
- correct it against implementation evidence
- mark what remains unconfirmed
- accept and continue only if more drift remains

## Working-mode success criteria

The working mode is functioning well when:
- docs tasks are broken into explicit stages
- each stage produces a real correction or checklist result
- delegated work has clean document boundaries
- validation boundaries are visible
- accepted docs changes reflect actual repo state rather than guesswork
