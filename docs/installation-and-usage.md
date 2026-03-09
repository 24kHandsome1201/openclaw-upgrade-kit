# Installation and Usage

This repository currently ships skills and reference materials.

## Who this is for

- OpenClaw users who want more execution-oriented behavior
- agent builders experimenting with skill-based behavior upgrades
- evaluators comparing base vs upgraded agent behavior

## Current usage model

At the current MVP stage, `openclaw-upgrade-kit` is meant to be used as:
- a skill source
- a behavior-design reference
- a benchmark pack
- an examples library

## Install locally

Clone the repository:

```bash
git clone git@github.com:24kHandsome1201/openclaw-upgrade-kit.git
cd openclaw-upgrade-kit
```

List packaged skills:

```bash
./scripts/list_packaged_skills.sh
```

Install all packaged skills:

```bash
./scripts/install_local_skills.sh ~/.codex/skills
```

Install only selected skills:

```bash
./scripts/install_selected_skills.sh ~/.codex/skills openclaw-manus openclaw-ops
```

## Use with OpenClaw

The exact integration method depends on your OpenClaw setup.

At minimum, you can use this repo in one of these ways:

### Option 1: Copy the skill into your local skills directory
Copy one of the skill folders into the location where your OpenClaw-compatible skill loader expects local skills.

Suggested starting point:
- `skills/openclaw-manus/`
- `skills/openclaw-ops/`
- `skills/openclaw-research/`
- `skills/openclaw-coding/`
- `skills/openclaw-docs/`

### Option 2: Use the repo as a reference pack
Even without direct automatic loading, you can use:
- `SKILL.md` files as behavior specs
- `references/` as policy guides
- `benchmarks/` to compare behavior before and after upgrades

### Option 3: Adapt the behavior to another agent stack
The materials are written to be reusable beyond one exact runtime.

## Recommended first test

Start with `openclaw-manus` and try it on:
- a coding cleanup task
- a service troubleshooting task
- a repo review task
- a current-info research task

Then compare it to base behavior using `benchmarks/rubric.md`.

## Suggested evaluation flow

1. run the same task on base OpenClaw
2. run it again with a simple generic instruction
3. run it with `openclaw-manus`
4. score each run using `benchmarks/rubric.md`
5. review before/after examples in `examples/`

## Current limitations

This repo does not yet provide a one-command installer for every OpenClaw environment.

The current focus is:
- skill quality
- policy clarity
- evaluation quality
- reusable structure

## Related docs

- `docs/versioned-installation-notes.md`
- `docs/integration-snippets.md`
- `docs/packaging-plan.md`

## Near-term roadmap

Near-term installation improvements may include:
- example integration layouts
- OpenClaw-specific setup notes
- optional install scripts
- sample host configurations
