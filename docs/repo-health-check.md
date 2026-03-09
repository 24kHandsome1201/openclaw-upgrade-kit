# Repo Health Check

This document describes the lightweight maintainer health check for `openclaw-upgrade-kit`.

## Purpose

Use `scripts/repo_health_check.sh` when you want a quick, conservative signal that the repository is in a healthy state for review, iteration, or release-prep work.

It is intentionally small and reviewable.
It does **not** try to replace deeper benchmark, runtime, or release verification.

## What it checks

The script currently chains these lightweight checks:

1. `./scripts/print_version_info.sh`
   - confirms the repo can report tag / branch / commit information

2. `./scripts/smoke_test_tool_exposure.sh`
   - checks that expected packaged skills, key docs, and helper scripts are present

3. `python3 ./scripts/check_doc_paths.py`
   - runs if the doc-path lint script exists
   - scans the tracked Markdown files in the repository
   - warns/fails on wildcard-like or missing repo-relative Markdown paths

4. `git status --short`
   - warns if the working tree is not clean

## What it does not check

This script does **not**:
- verify live OpenClaw runtime behavior
- validate external providers or credentials
- run benchmark suites
- assert that a release is ready by itself
- replace `docs/release-checklist.md`

## Recommended usage

Run it from the repository root:

```bash
./scripts/repo_health_check.sh
```

Good times to use it:
- before delegating work
- before a docs/release review
- after a batch of repository structure changes
- before starting a release-prep pass

## Exit behavior

- exits `1` if a required check fails
- exits `0` if required checks pass, even when there are warnings
- prints warnings for non-blocking issues such as a dirty working tree

## Interpretation

Use this as a fast maintainer sanity check.
If it passes, the tracked repository docs and helper surface are structurally healthy enough for the next deeper workflow.
If it warns, read the warning before continuing.
If it fails, fix the underlying repository issue before moving on.
