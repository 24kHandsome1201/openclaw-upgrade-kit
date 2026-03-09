# Versioned Installation Notes

This document describes how to install `openclaw-upgrade-kit` in a version-aware way.

## Current release baseline

Current tagged baseline:
- `v0.1.0`

If you want stable installation behavior, prefer checking out a tag instead of a moving branch.

## Stable install flow

```bash
git clone git@github.com:24kHandsome1201/openclaw-upgrade-kit.git
cd openclaw-upgrade-kit
git checkout v0.1.0
./scripts/install_local_skills.sh ~/.codex/skills
```

## Install only selected skills

```bash
./scripts/install_selected_skills.sh ~/.codex/skills openclaw-manus openclaw-ops
```

## Check local package version

```bash
./scripts/print_version_info.sh
```

## When to use a tag vs `master`

Use a tag when you want:
- stable reproduction
- benchmark consistency
- shared team setup
- less risk from in-progress changes

Use `master` when you want:
- latest skills
- newest docs and benchmark patterns
- active iteration during development

## Suggested team rule

For comparisons and benchmark writeups, record:
- repository tag or commit
- installed skill set
- benchmark task used
- scoring rubric version

This makes benchmark results easier to trust and reproduce.
