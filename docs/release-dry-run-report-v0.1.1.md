# Release Dry-Run Report v0.1.1

## Purpose

This report records a pre-release dry run for `v0.1.1` using the currently available release helper scripts.

It is meant to answer:
- what was checked
- what commands were run
- what results were observed
- what still blocks or risks release readiness

## Dry-run context

- Repo: `openclaw-upgrade-kit`
- Intended version: `v0.1.1`
- Dry-run date: 2026-03-09
- Reference used for helper checks: `HEAD`
- Version info observed during dry run:
  - tag: `v0.1.0-10-g9edbf54`
  - branch: `master`
  - commit: `9edbf54`

## Commands run

```bash
./scripts/print_version_info.sh
./scripts/list_packaged_skills.sh
./scripts/smoke_test_release.sh /tmp/openclaw-v011-dry-run HEAD
./scripts/prepare_release.sh HEAD /tmp/openclaw-v011-prepare
```

## Check results

### 1. Version info
- **Command:** `./scripts/print_version_info.sh`
- **Observed result:** returned tag / branch / commit information successfully.
- **Expected result:** version info should print without error.
- **Status:** Pass

### 2. Packaged skills listing
- **Command:** `./scripts/list_packaged_skills.sh`
- **Observed result:** listed:
  - `openclaw-coding`
  - `openclaw-docs`
  - `openclaw-manus`
  - `openclaw-ops`
  - `openclaw-research`
- **Expected result:** all packaged skills should be discoverable.
- **Status:** Pass

### 3. Release smoke test
- **Command:** `./scripts/smoke_test_release.sh /tmp/openclaw-v011-dry-run HEAD`
- **Observed result:** completed successfully.
  - install-all step passed
  - install-selected step passed
  - version-info step passed
  - release archive step passed
- **Expected result:** helper should complete without failing any sub-step.
- **Status:** Pass

### 4. Release preparation helper
- **Command:** `./scripts/prepare_release.sh HEAD /tmp/openclaw-v011-prepare`
- **Observed result:** completed successfully and printed:
  - repo status
  - version info
  - packaged skills
  - smoke-test output
- **Expected result:** helper should run and surface readiness context clearly.
- **Status:** Pass with Risks

## Issues observed during dry run

### [Medium] Working tree was not clean during release prep
- **Evidence:** `prepare_release.sh` showed pending changes in:
  - `skills/openclaw-ops/SKILL.md`
  - `skills/openclaw-research/SKILL.md`
  - `skills/openclaw-ops/references/working-mode.md`
  - `skills/openclaw-research/references/working-mode.md`
- **Impact:** release prep output reflects a not-yet-finalized repo state.
- **Recommended action:** complete review/integration of those changes before tagging `v0.1.1`.

## Readiness summary

### What is ready
- release helper scripts run successfully
- packaged skills can be listed and installed
- release archive generation works for `HEAD`
- release prep helper provides a useful summary path

### What still needs attention
- working tree must be clean before actual release tagging
- final release notes should be checked once the pending skill changes are integrated
- final version info should be captured again after the intended release commit is ready

## Dry-run verdict

- **Verdict:** Pass with Risks
- **Release-ready now?:** Not yet
- **Reason:** helper scripts and packaging path are working, but the repository state was not clean during the dry run

## Recommended next steps

1. integrate or reject the pending `openclaw-ops` / `openclaw-research` working-mode changes
2. rerun:
   - `./scripts/smoke_test_release.sh /tmp/openclaw-v011-dry-run HEAD`
   - `./scripts/prepare_release.sh HEAD /tmp/openclaw-v011-prepare`
3. confirm `docs/release-notes-v0.1.1.md` still matches the final repo state
4. tag `v0.1.1` only after the repo is clean and the dry run remains green
