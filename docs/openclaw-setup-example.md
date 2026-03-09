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

This copies:
- `skills/openclaw-manus/`
- `skills/openclaw-ops/`

into:
- `~/.codex/skills/`

## Expected result

You should end up with:

```text
~/.codex/skills/
├── openclaw-manus/
│   ├── SKILL.md
│   ├── references/
│   └── agents/
└── openclaw-ops/
    ├── SKILL.md
    ├── references/
    └── agents/
```

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

## Suggested first tests

1. Run a coding cleanup task with `openclaw-manus`
2. Run a service-debugging task with `openclaw-ops`
3. Compare output quality using `benchmarks/rubric.md`

## Notes

This is intentionally simple.

The current project goal is to make skill adoption easier without assuming one exact OpenClaw runtime implementation.
