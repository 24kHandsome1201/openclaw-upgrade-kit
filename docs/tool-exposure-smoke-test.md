# Tool Exposure Smoke Test

This document defines a conservative local smoke test for `openclaw-upgrade-kit`.

The purpose is not to prove that a full host runtime works.
The purpose is to quickly detect obvious packaging or repo-state problems that would make skills incomplete or non-executable.

## What this smoke test checks

The smoke test only verifies repository-level expectations such as:
- core skill directories exist
- key `SKILL.md` files exist
- expected docs/scripts exist
- the packaged skill set is not obviously incomplete

It does **not** verify:
- external provider connectivity
- Telegram/webhook/polling runtime behavior
- real tool permissions inside another host runtime
- model availability

## Why this exists

One common failure mode for agent projects is silent capability loss:
- expected skills are missing
- helper scripts are not packaged
- docs reference files that are absent
- a local install appears fine but core pieces are missing

This smoke test is meant to catch that class of issue early.

## Suggested usage

Run from the repo root:

```bash
./scripts/smoke_test_tool_exposure.sh
```

## Expected pass conditions

A passing run should confirm at least:
- the main packaged skills exist
- each packaged skill has a `SKILL.md`
- key install/release helper scripts exist
- core integration/research docs still exist

## Failure interpretation

A failure means the repo is not in a reliable packaged state for local consumption.
It does **not** automatically mean that a deployed runtime is broken.

Use failures as a prompt to:
- restore missing files
- recheck packaging assumptions
- update docs if the repo intentionally changed shape

## Relationship to other checks

Use this smoke test together with:
- install scripts
- release smoke tests
- benchmark examples
- runtime/channel troubleshooting guides

This is the cheapest check, not the most complete one.
