# Release Playbook

This playbook describes the **non-versioned release process** for `openclaw-upgrade-kit`.

Use it when you want to move from the current `master` HEAD to a new tagged release.

## How this relates to other release docs

Use this file as the release workflow overview:
- what to check
- what order to run things in
- how to think about `master` vs a tag

Use the version-specific release docs only after a release candidate is clear:
- `docs/release-plan-v0.1.1.md`
- `docs/release-notes-v0.1.1.md`
- `docs/release-dry-run-report-v0.1.1.md`
- `docs/release-dry-run-summary-v0.1.1.md`

In short:
- **this file** = repeatable release process
- **version-specific files** = historical record for one tagged release

## Release flow

### 1. Start from current `master`
Confirm the current working tree is the state you want to evaluate for release.

Typical checks:
- working tree is clean
- current docs match current scripts and packaged skills
- backlog / roadmap changes that should land are already merged

Use:
- `docs/release-checklist.md`
- `docs/research/derived/development-priority-roadmap-2026-03.md`
- `docs/research/derived/executable-backlog-from-feedback-2026-03.md`

### 2. Run release-readiness checks
Use the checklist and helper scripts before deciding on a release candidate.

Recommended commands:

```bash
./scripts/list_packaged_skills.sh
./scripts/install_local_skills.sh /tmp/openclaw-release-test
./scripts/install_selected_skills.sh /tmp/openclaw-release-selected-test openclaw-manus openclaw-ops
./scripts/print_version_info.sh
./scripts/smoke_test_release.sh /tmp/openclaw-release-smoke HEAD
./scripts/prepare_release.sh HEAD /tmp/openclaw-release-prepare
```

If needed, also run:

```bash
./scripts/smoke_test_tool_exposure.sh
./scripts/check_doc_paths.py
```

### 3. Decide whether HEAD is ready to become a tag
At this point, make an explicit release decision:
- ready to tag
- pass with risks
- not ready

A release candidate should have:
- clear scope
- consistent docs
- benchmark/example support for major claims
- a known limitation section that still matches reality

### 4. Create version-specific release materials
Once a release candidate is real, create or update the versioned files for that release.

Typical versioned assets:
- a release-plan file named like docs/release-plan-<version>.md
- a release-notes file named like docs/release-notes-<version>.md
- a release-dry-run-report file named like docs/release-dry-run-report-<version>.md
- a release-dry-run-summary file named like docs/release-dry-run-summary-<version>.md

These files should describe the tagged release only.
They should not keep drifting with later `master` commits.

### 5. Create the tag and archive
After the release decision is accepted:

```bash
git tag vX.Y.Z
./scripts/create_release_archive.sh vX.Y.Z /tmp/openclaw-release-archive-test
./scripts/install_from_tag.sh vX.Y.Z /tmp/openclaw-from-tag-test
```

This validates that the tag is usable as a versioned installation target.

### 6. Publish and freeze the version-specific record
After the tag exists:
- push the tag
- publish the release notes
- treat the version-specific release docs as historical release records

From that point on:
- `master` can keep moving
- version-specific docs should only change if you are correcting the record for that tag

## Minimal decision checklist

Before tagging, confirm:
- current `master` is the intended release candidate
- release checklist passes
- helper scripts run successfully
- release notes are scoped to the tagged release, not future commits
- archive/install-from-tag flow works for the candidate tag

## Related docs

- `docs/release-checklist.md`
- `docs/versioned-installation-notes.md`
- `docs/release-archive-workflow.md`
- `docs/packaging-plan.md`
