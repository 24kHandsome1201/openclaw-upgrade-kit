# OpenClaw Integration Notes

This document explains how to start using `openclaw-upgrade-kit` with a real OpenClaw setup.

## Current integration model

At this stage, the repository is designed to work in a flexible way rather than assuming one exact OpenClaw runtime layout.

You can integrate it in three practical ways.

## Option 1: Use as local skills

If your OpenClaw environment supports local skill folders, copy one or more skill directories from this repo into the location your setup uses for skills.

Recommended starting skills:
- `skills/openclaw-manus/`
- `skills/openclaw-ops/`

## Option 2: Use as agent behavior reference

If your runtime does not yet support automatic skill loading, use these files as structured behavior specs:
- `SKILL.md`
- `references/*.md`
- `examples/*.md`
- `benchmarks/*.md`

This is still useful because the repo is designed as an execution-behavior layer, not only a loader-specific package.

## Option 3: Use selectively by task type

A practical pattern is:
- use `openclaw-manus` as the default execution-upgrade skill
- use `openclaw-ops` for service/runtime incidents

This gives you a general skill plus a task-specific skill.

## Suggested activation strategy

### Default behavior upgrade
Use `openclaw-manus` when the task is:
- coding
- repo review
- multi-step research
- docs review
- general execution work

### Ops specialization
Use `openclaw-ops` when the task is primarily about:
- service failures
- logs
- config issues
- runtime inspection
- port/process/connectivity checks
- deployment/runtime validation

## Recommended file mapping

If your environment organizes local skills in a directory, a typical target structure may look like:

```text
<your-skill-root>/
├── openclaw-manus/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
└── openclaw-ops/
    ├── SKILL.md
    ├── references/
    └── agents/
```

## Suggested evaluation workflow

1. run a task with base OpenClaw
2. run the same task with `openclaw-manus`
3. if it is an ops task, also run with `openclaw-ops`
4. compare outputs using `benchmarks/rubric.md`
5. review relevant `examples/before-after-*.md`

## Good first tasks to test

- inspect a repo and fix one obvious issue
- diagnose a non-responsive service
- check doc-to-code drift in a README
- research whether a project idea is differentiated

## Current limitation

This repo does not yet include a runtime-specific auto-installer for all OpenClaw setups.

That is intentional for now: the current priority is a strong behavior layer and clear evaluation path.
