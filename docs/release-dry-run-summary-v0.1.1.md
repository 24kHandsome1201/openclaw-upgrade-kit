# v0.1.1 Release Summary

## Release title

`v0.1.1 - Skills, routing, packaging, and evaluation expansion`

## Publish-ready summary

`v0.1.1` is the first post-MVP expansion release for `openclaw-upgrade-kit`.

This release moves the project beyond an initial execution-skill drop and into a broader open-agent upgrade framework with:
- a larger specialized skill set
- deeper benchmark coverage across task subtypes
- stronger packaging and release-helper scripts
- clearer runtime routing and layout guidance
- stronger long-task, checkpoint, and recovery patterns
- more explicit contribution and evaluation workflows

## What ships in v0.1.1

### Skills
- `openclaw-manus`
- `openclaw-ops`
- `openclaw-research`
- `openclaw-coding`
- `openclaw-docs`
- `openclaw-runtime`
- `openclaw-release`

### Benchmark and evaluation coverage
- benchmark rubric and task set
- benchmark results template and results guide
- result examples for research / coding / ops / docs / long-task flows
- deeper subtype examples for:
  - build failure
  - CI config failure
  - small refactor
  - flaky test
  - conflict / misconfiguration / webhook misconfiguration / stale process
  - runbook / release-note / onboarding / architecture consistency
  - API docs verification / pricing-spec verification
- benchmark contribution guidance
- evaluation cadence guidance

### Packaging and release helpers
- install-all and install-selected scripts
- packaged-skill listing and version info scripts
- tag-based install helper
- release archive creation helper
- release smoke-test helper
- release preparation helper
- release checklist, dry-run report, and dry-run summary docs

### Runtime and execution guidance
- runtime routing patterns
- default-vs-specialized routing guidance
- fallback policy
- manual routing playbook
- runtime integration examples
- runtime layout examples
- long-task patterns
- checkpoint template
- resume / recovery guidance
- delegation patterns
- working-mode references across core and specialized skills

## Why this release matters

Compared with `v0.1.0`, this release makes the repository meaningfully more usable as:
- a reusable skill pack
- a behavior-design reference for execution-oriented agents
- a benchmark and evaluation framework
- a packaging/release-aware open-agent toolkit

## Release readiness

Release readiness is backed by the existing dry-run artifacts:
- `docs/release-dry-run-report-v0.1.1.md`
- successful helper-script reruns recorded there
- final tag already present: `v0.1.1`

Current readiness status:
- **Verdict:** Pass
- **Tag state:** already tagged as `v0.1.1`
- **Publish state:** ready for GitHub release publication using `docs/release-notes-v0.1.1.md`

## Known limitations

This release still does not provide:
- deep host-runtime automation
- runtime-embedded memory/state implementation
- browser automation
- multi-agent orchestration
- fully automated packaging for every target environment

## Recommended publish-page body

Use `docs/release-notes-v0.1.1.md` as the main release notes.

If a shorter release-page intro is needed, use this:

> `v0.1.1` expands `openclaw-upgrade-kit` with seven focused skills, richer benchmark evidence, stronger release and packaging helpers, clearer runtime routing guidance, and better long-task execution patterns.

## Suggested next-step framing after publish

- expand host-specific runtime layouts further
- keep adding real-world benchmark evidence
- continue turning operating patterns into reusable skills and references
- keep release automation transparent and reviewable
