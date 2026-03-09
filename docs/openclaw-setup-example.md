# OpenClaw Setup Example

This document shows a simple example workflow for using `openclaw-upgrade-kit` in a local environment.

## Example goal

Install the packaged skills into a local skills directory and make them available to your OpenClaw-compatible workflow.

## Example local layout

```text
~/projects/openclaw-upgrade-kit/
~/.codex/skills/
```

## Example install command

From the repository root:

```bash
./scripts/install_local_skills.sh ~/.codex/skills
```

Optional sanity check right after install:

```bash
./scripts/smoke_test_tool_exposure.sh
```

This is useful because it confirms the expected repo-level skills/docs/scripts are present before you debug a runtime issue that is really just an incomplete local setup.

This installs all **7 packaged skills** into:
- `~/.codex/skills/`

Packaged skills currently are:
- `skills/openclaw-manus/`
- `skills/openclaw-ops/`
- `skills/openclaw-research/`
- `skills/openclaw-coding/`
- `skills/openclaw-docs/`
- `skills/openclaw-runtime/`
- `skills/openclaw-release/`

## Expected result

You should end up with:

```text
~/.codex/skills/
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
├── openclaw-docs/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
├── openclaw-runtime/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
└── openclaw-release/
    ├── SKILL.md
    ├── references/
    └── agents/
```

## Packaged vs recommended starting skills

The installer copies **all 7 packaged skills**.

For most users, the **recommended starting skills** are:
- `openclaw-manus`
- `openclaw-ops`
- `openclaw-research`
- `openclaw-coding`
- `openclaw-docs`

The **advanced / specialized skills** are:
- `openclaw-runtime` — for routing, fallback, manual handoff, and layout choice
- `openclaw-release` — for release prep, dry-run review, packaging/archive checks

You should expect all 7 to be installed even if your first tests only use the core 5.

## Suggested usage pattern

### Use `openclaw-manus` when you want:
- general execution behavior
- better planning
- stronger tool use
- more progress awareness
- better delivery quality

### Use `openclaw-ops` when you want:
- service troubleshooting
- config review
- log inspection
- runtime validation
- incident-style debugging

### Use `openclaw-research` when you want:
- latest-information lookup
- source-backed comparison
- differentiation analysis
- current docs/API verification

### Use `openclaw-coding` when you want:
- bug fixing
- minimal diffs
- repository cleanup
- test/build/lint validation

### Use `openclaw-docs` when you want:
- README review
- setup flow validation
- runbook correction
- doc-to-code drift checks

## Suggested first tests

1. Run a coding cleanup task with `openclaw-coding`
2. Run a service-debugging task with `openclaw-ops`
3. Run a latest-info comparison task with `openclaw-research`
4. Run a README drift review task with `openclaw-docs`
5. Compare output quality using `benchmarks/rubric.md`

## Notes

This is intentionally simple.

If the install is fine but a channel still behaves oddly, continue with:
- `docs/channel-health-model.md` for inbound/outbound/auth/polling-webhook state separation
- `docs/provider-error-taxonomy.md` for classifying provider/auth/config failures more accurately
- `docs/touched-scope-reporting.md` if you want runtime or incident reports to clearly show what was and was not touched

The current project goal is to make skill adoption easier without assuming one exact OpenClaw runtime implementation.
