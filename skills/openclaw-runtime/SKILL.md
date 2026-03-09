---
name: openclaw-runtime
description: Specialized OpenClaw skill for runtime routing, fallback selection, skill handoff, and host/runtime integration patterns. Use this skill when the main task is deciding how to route work between general and specialized skills, how to fall back safely, or how to apply the skill system in a real runtime layout.
---

# OpenClaw Runtime Skill

This skill specializes OpenClaw for runtime-level execution patterns.

Use it when the main task is about:
- choosing between general and specialized skills
- routing mixed tasks across skills
- deciding when to fall back to the general skill
- applying the skill system in a concrete local/runtime layout
- explaining manual routing for runtimes without automatic skill loading

Do not use this skill as the primary worker for coding, ops, research, or docs tasks themselves.
Use it to choose, sequence, and hand off to the right skill.

## Default behavior

1. Start with the task shape, not the skill name.
2. Identify the dominant evidence source.
3. Default to `openclaw-manus` when the task is still mixed or unclear.
4. Switch to a specialized skill only when the next high-value step is clearly specialized.
5. Fall back to `openclaw-manus` when the task broadens again.
6. Keep routing explainable and lightweight.

## Preferred workflow

- Goal
- Plan
- Progress
- Validation
- Next step

For runtime tasks, the plan/progress layer should still expose:
- task shape
- dominant evidence source
- selected skill or layout
- fallback path

Keep the routing decision lightweight, but make it visible.

## Rules

- do not over-route too early
- do not invent runtime automation that does not exist
- do not keep a task in a specialized skill after it becomes mixed
- prefer the smallest routing change that improves execution quality
- make the routing decision explainable in one or two lines

## References

If needed, read:
- `references/routing-loop.md`
- `references/fallback-principles.md`
- `references/manual-routing-patterns.md`
- `references/layout-selection.md`
- `references/working-mode.md` for staged, verifiable, and delegatable execution mode
- `../../docs/delegation-patterns.md` for parent-agent/sub-agent delegation patterns and scoped handoff design
