# Release Plan v0.1.1

## Version

`v0.1.1`

## Release intent

First expansion release after the initial MVP.

The goal of this release is to package the project's growth from:
- a small execution-upgrade skill pack

into:
- a broader skill system
- a more evidence-backed benchmark framework
- a more practical packaging/runtime documentation toolkit
- a more release-aware open-agent project

## Proposed release title

`v0.1.1 - Skills, routing, packaging, and evaluation expansion`

## Proposed release summary

`v0.1.1` expands `openclaw-upgrade-kit` with new specialized skills, richer benchmark examples, packaging/runtime integration guidance, long-task continuity patterns, release-specific operational guidance, and stronger community/evaluation docs.

## Scope

### Skills
- `openclaw-research`
- `openclaw-coding`
- `openclaw-docs`
- `openclaw-runtime`
- `openclaw-release`

### Benchmark and evaluation
- benchmark result examples for coding / ops / docs / research / long-task, including subtype cases
- benchmark contribution guide
- evaluation cadence guidance
- release checklist improvements
- community contribution templates

### Packaging and runtime
- selective install / list / version scripts
- tag-based install support
- release archive workflow
- prepare/smoke-test release helpers
- runtime routing patterns
- manual routing playbook
- runtime integration examples
- runtime layout examples
- release dry-run summary

### Long-task support
- long-task patterns
- checkpoint template
- resume / recovery guide
- long-task example
- working-mode references across core and specialized skills
- delegation patterns guidance

## Release checklist focus

For final publication of `v0.1.1`, verify:
- release notes match the current skill set and doc/script inventory
- install/list/version scripts work as documented
- tag/archive workflows work as documented
- release helper scripts work as documented
- benchmark result examples referenced by docs exist
- routing docs, runtime docs, and release docs remain internally consistent
- the release summary points to the existing dry-run artifacts and tag state correctly

## Suggested verification commands

```bash
./scripts/list_packaged_skills.sh
./scripts/install_local_skills.sh /tmp/openclaw-v011-all
./scripts/install_selected_skills.sh /tmp/openclaw-v011-selected openclaw-manus openclaw-ops openclaw-research
./scripts/print_version_info.sh
./scripts/install_from_tag.sh v0.1.0 /tmp/openclaw-v011-from-tag
./scripts/create_release_archive.sh HEAD /tmp/openclaw-v011-archive
./scripts/smoke_test_release.sh /tmp/openclaw-v011-smoke HEAD
./scripts/prepare_release.sh HEAD /tmp/openclaw-v011-prepare
```

## Suggested release artifacts

- Git tag: `v0.1.1`
- GitHub release title: `v0.1.1 - Skills, routing, packaging, and evaluation expansion`
- Release notes source: `docs/release-notes-v0.1.1.md`
- Dry-run references:
  - `docs/release-dry-run-report-v0.1.1.md`
  - `docs/release-dry-run-summary-v0.1.1.md`

## Known release risks

- packaging automation is stronger than before, but still not host-specific automation
- the release remains documentation-and-script heavy rather than runtime-embedded
- benchmark breadth is much better, but still not exhaustive across all real-world scenarios

## Current release status

- tag exists: `v0.1.1`
- clean dry-run verdict: `Pass`
- next publish action: create/update the GitHub release body from `docs/release-notes-v0.1.1.md`

## Notable difference from v0.1.0

`v0.1.0` established the MVP.
`v0.1.1` should be positioned as the release that makes the project feel like a broader upgrade framework rather than only an initial skill drop.
