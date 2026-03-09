# Working Mode

This file defines the preferred working mode for `openclaw-release` on non-trivial release-preparation tasks.

The purpose is to keep release work:
- staged
- evidence-backed
- reviewable
- delegatable when release artifacts are independent

## Core principle

Do not treat release work as a final documentation pass only.

Instead:
1. define the current release stage
2. define the concrete release artifact for that stage
3. define the evidence needed to accept it
4. execute or delegate the scoped work
5. review the output before integrating it
6. move to the next stage only after release readiness is clearer

## Stage-first release mode

Typical release stages:
- release scope definition
- repo-state and docs alignment
- script and packaging verification
- dry-run evidence collection
- release-note consistency check
- release verdict and next action

Each stage should answer:
- what release question is being resolved?
- what artifact or check result should this stage produce?
- how will the result be verified?

## Verifiable deliverables rule

Every meaningful stage should produce at least one verifiable release artifact.

Examples:
- a release note draft aligned to repo state
- a dry-run report
- a checklist pass or fail note
- script output tied to packaging checks
- a release verdict with explicit evidence

Avoid vague stage endings such as:
- "release looks okay"
- "should be ready"
- "notes seem accurate"

## Delegation rule for release work

Release work may be delegated when artifacts are independent.

Good delegation candidates:
- release notes vs release checklist review
- archive workflow docs vs issue templates
- benchmark evidence review vs packaging helper review
- skill-specific validation notes vs release-plan wording

Avoid parallel delegation when:
- multiple subtasks rewrite the same release note section
- the release verdict depends on unfinished checks
- multiple workers redefine the same release scope or version claims

## Parent-agent responsibility

When release work is delegated, the parent agent should:
1. define the release target and allowed write scope
2. define what evidence must exist before acceptance
3. review whether claims match the real repository state
4. verify script outputs and checklist references where needed
5. integrate only after release artifacts agree with each other
6. keep roadmap items separate from already released capability
7. commit or tag only after accepted release evidence is clear

## Evidence-before-verdict rule

Do not accept delegated release output only because it reads well.

Before integration:
- inspect the release notes and plan
- verify that referenced scripts and docs exist
- confirm that claimed skills, examples, and helpers are actually present
- check whether the dry-run evidence supports the release verdict

## Keep-release-scope-tight rule

A good staged release flow usually looks like:
- define the target version and scope
- verify key artifacts and scripts
- record dry-run evidence
- align release notes to repo reality
- issue a verdict
- continue only if another release blocker remains

## Working-mode success criteria

The working mode is functioning well when:
- release tasks are broken into explicit stages
- each stage produces a real release artifact or check
- delegated work has clean artifact boundaries
- release claims are reviewed before acceptance
- the final release verdict is evidence-backed rather than aspirational
