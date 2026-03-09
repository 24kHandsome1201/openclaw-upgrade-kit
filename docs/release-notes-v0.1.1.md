# v0.1.1 - Skills, routing, packaging, and evaluation expansion

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
- added benchmark result examples for research, coding, ops, docs, and long-task flows
- added local packaging helpers for listing, selective install, version reporting, tag-based install, and release archive creation
- added runtime routing, fallback, and manual-routing documentation
- added long-task, checkpoint, resume, and recovery guidance
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
- runtime integration patterns
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

## Benchmark and evaluation improvements

This release adds or strengthens:
- benchmark result template
- benchmark results guide
- result examples for research / coding / ops / docs / long-task
- benchmark contribution guide
- release checklist tied to measurable repository state
- evaluation cadence guidance

## Packaging and runtime improvements

This release adds or strengthens:
- `install_local_skills.sh`
- `install_selected_skills.sh`
- `list_packaged_skills.sh`
- `print_version_info.sh`
- `install_from_tag.sh`
- `create_release_archive.sh`
- runtime routing patterns
- default vs specialized routing guidance
- fallback policy
- runtime integration examples
- manual routing playbook

## Long-task continuity improvements

This release adds or strengthens:
- long-task execution patterns
- checkpoint template
- resume / recovery guidance
- long-task example
- long-task benchmark example

## Known limitations

This release still does not provide:
- deep host-runtime automation
- memory/state implementation inside the runtime itself
- browser automation
- multi-agent orchestration
- fully automated packaging for every target environment

## Suggested next steps

- add more host-specific runtime layout examples
- expand benchmark evidence with more real-world scenarios
- add release automation and pre-release smoke-test helpers
- continue turning stable documentation workflows into reusable skills or templates
