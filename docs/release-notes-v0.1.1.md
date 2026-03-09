# v0.1.1 - Skills, routing, packaging, and evaluation expansion

> These notes describe the **tagged `v0.1.1` release**.
> They do not automatically track later `master` commits made after the `v0.1.1` tag.

## Summary

`v0.1.1` is the first post-MVP expansion release for `openclaw-upgrade-kit`.

This release grows the project from an initial execution-upgrade MVP into a broader open-agent upgrade framework with:
- more specialized skills
- more benchmark evidence
- stronger packaging and install workflows
- clearer runtime routing guidance
- stronger long-task / resume patterns
- explicit community and evaluation docs

## Highlights

- added `openclaw-research`
- added `openclaw-coding`
- added `openclaw-docs`
- added `openclaw-runtime`
- added `openclaw-release`
- added benchmark result examples for research, coding, ops, docs, and long-task flows, including subtype cases for build failure, CI config failure, small refactor, flaky test, runbook review, release-note review, onboarding/setup drift, architecture consistency, conflict, misconfiguration, webhook misconfiguration, stale process cleanup, API/docs verification, and pricing/spec-change verification
- added local packaging helpers for listing, selective install, version reporting, tag-based install, release archive creation, release preparation, and pre-release smoke testing
- added runtime routing, fallback, manual-routing documentation, delegation patterns, and concrete runtime layout examples
- added long-task, checkpoint, resume, and recovery guidance plus working-mode patterns for staged, verifiable, delegatable execution across the core and specialized skills
- added benchmark contribution, release-readiness, and evaluation-cadence documentation

## Core idea

> You only need to tell your agent how to work.

## Why this release matters

This release makes the repository substantially more usable as:
- a skill pack
- a behavior-design reference
- a benchmark/evaluation framework
- a release-aware open-agent upgrade toolkit

Compared with `v0.1.0`, the project now has much better coverage for:
- specialized task routing
- coding and documentation workflows
- runtime integration and release-handling patterns
- long-task continuity
- contribution and release discipline

## Included skills

### `openclaw-manus`
General execution-upgrade skill for planning, tool use, evidence gathering, progress reporting, and delivery.

### `openclaw-ops`
Specialized ops skill for service incidents, logs, config validation, and safe runtime remediation.

### `openclaw-research`
Specialized research skill for latest-information lookup, source-backed comparison, and differentiation analysis.

### `openclaw-coding`
Specialized coding skill for repo inspection, minimal diffs, implementation changes, and validation-heavy tasks.

### `openclaw-docs`
Specialized documentation skill for README/setup/runbook review, doc-to-code drift detection, and correction planning.

### `openclaw-runtime`
Specialized runtime skill for routing, fallback, runtime layout selection, and orchestration-lite integration guidance.

### `openclaw-release`
Specialized release skill for release checks, evidence gathering, dry-run interpretation, and publish-readiness framing.

## Benchmark and evaluation improvements

This release adds or strengthens:
- benchmark result template
- benchmark results guide
- result examples for research / coding / ops / docs / long-task
- deeper subtype examples across coding, ops, docs, and research scenarios
- benchmark contribution guide
- release checklist tied to measurable repository state
- evaluation cadence guidance
- PR / issue templates for benchmark and skill proposals

## Packaging and runtime improvements

This release adds or strengthens:
- `install_local_skills.sh`
- `install_selected_skills.sh`
- `list_packaged_skills.sh`
- `print_version_info.sh`
- `install_from_tag.sh`
- `create_release_archive.sh`
- `prepare_release.sh`
- `smoke_test_release.sh`
- runtime routing patterns
- default vs specialized routing guidance
- fallback policy
- runtime integration examples
- manual routing playbook
- runtime layout examples
- release dry-run report and release dry-run summary

## Long-task continuity improvements

This release adds or strengthens:
- long-task execution patterns
- checkpoint template
- resume / recovery guidance
- long-task example
- long-task benchmark example
- working-mode references for staged and review-before-integration execution
- delegation patterns for subtasking and parent-agent acceptance

## Known limitations

This release still does not provide:
- deep host-runtime automation
- memory/state implementation inside the runtime itself
- browser automation
- multi-agent orchestration
- fully automated packaging for every target environment

## Tagged-release boundary note

If `master` has moved ahead since `v0.1.1`, treat newer trust-first docs, routing tweaks, and planning updates as post-release changes until they are included in a later tagged version.

## Suggested next steps

- continue expanding host-specific runtime layout examples
- expand benchmark evidence with more real-world scenarios and subtypes
- extend working-mode and delegation patterns where specialized skills need them most
- keep release automation transparent rather than over-automated
