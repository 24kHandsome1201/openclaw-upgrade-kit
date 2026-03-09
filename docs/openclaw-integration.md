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
- `skills/openclaw-docs/`

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
- use `openclaw-research` for latest-info and source-backed comparisons
- use `openclaw-coding` for repository changes and validation
- use `openclaw-docs` for README/setup/runbook review and doc drift

This gives you a general skill plus task-specific skills.

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

### Research specialization
Use `openclaw-research` when the task is primarily about:
- latest-information lookup
- source-backed comparisons
- API/docs verification against current sources
- competitor or positioning analysis

### Coding specialization
Use `openclaw-coding` when the task is primarily about:
- bug fixing
- minimal diffs
- repository cleanup
- test/build/lint validation

### Documentation specialization
Use `openclaw-docs` when the task is primarily about:
- README review
- setup-flow validation
- runbook correction
- doc-to-code drift checks

## Recommended file mapping

If your environment organizes local skills in a directory, a typical target structure may look like:

```text
<your-skill-root>/
├── openclaw-manus/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
├── openclaw-ops/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
├── openclaw-research/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
├── openclaw-coding/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
└── openclaw-docs/
    ├── SKILL.md
    ├── references/
    └── agents/
```

## Practical routing matrix

| Task shape | Default skill | Switch when | Fallback |
| --- | --- | --- | --- |
| Mixed or unclear multi-step task | `openclaw-manus` | the task becomes clearly specialized | stay on `openclaw-manus` if uncertainty remains |
| Service failure / deployment incident | `openclaw-ops` | code changes become the main work | fall back to `openclaw-manus` for mixed diagnosis + delivery |
| Latest-info / comparison / current docs check | `openclaw-research` | implementation changes become required | fall back to `openclaw-manus` if the task broadens beyond research |
| Bug fix / repo cleanup / validation-heavy change | `openclaw-coding` | the task shifts to production/runtime debugging | fall back to `openclaw-manus` when coding is only one part of a wider task |
| README / setup / runbook review | `openclaw-docs` | code changes or runtime debugging become dominant | fall back to `openclaw-manus` for mixed review + execution tasks |

## Fallback and escalation rules

A simple host-runtime rule set is:

1. start with `openclaw-manus` when task type is unclear
2. switch to a specialized skill once more than half the task is clearly in one lane
3. stay in the specialized skill while that lane remains dominant
4. switch back to `openclaw-manus` when the task becomes mixed again
5. if a docs/research/ops task requires code edits, hand off to `openclaw-coding` for the implementation part

## Manual workflow without automatic skill loading

If your runtime cannot auto-route skills yet, use this manual pattern:

1. classify the task using `docs/skill-selection-guide.md`
2. open the chosen skill's `SKILL.md`
3. load only the referenced files needed for that task
4. execute the task with that skill as the active behavior spec
5. if the task changes shape, switch to the matching specialized skill

This keeps the upgrade kit useful even in minimal runtimes that only support copy/paste instructions or manual context assembly.

## Suggested evaluation workflow

1. run a task with base OpenClaw
2. run the same task with `openclaw-manus`
3. if it is a specialized task, also run with the matching skill
4. compare outputs using `benchmarks/rubric.md`
5. record results with `benchmarks/results/template.md`
6. review relevant `examples/before-after-*.md`

## Good first tasks to test

- inspect a repo and fix one obvious issue
- diagnose a non-responsive service
- check doc-to-code drift in a README
- research whether a project idea is differentiated

## Related routing docs

- `docs/runtime-routing-patterns.md`
- `docs/default-vs-specialized-routing.md`
- `docs/fallback-policy.md`
- `docs/runtime-integration-examples.md`
- `docs/manual-routing-playbook.md`
- `docs/channel-health-model.md` — useful when a chat/channel integration looks partially healthy but inbound or auth state is unclear
- `docs/provider-error-taxonomy.md` — useful when model/provider failures need clearer root-cause labeling
- `docs/touched-scope-reporting.md` — useful for showing what a runtime/integration task actually touched and what it intentionally left alone

## Current limitation

This repo does not yet include a runtime-specific auto-installer for all OpenClaw setups.

That is intentional for now: the current priority is a strong behavior layer and clear evaluation path.
