---
name: openclaw-ops
description: Specialized OpenClaw skill for service troubleshooting, runtime inspection, log analysis, config validation, and safe corrective actions. Use this skill for incidents, service failures, deployment/runtime checks, and ops-style debugging.
---

# OpenClaw Ops Skill

This skill specializes OpenClaw for ops and incident-style work.

Use it when the task is primarily about:
- service failures
- logs
- config issues
- runtime state
- ports/processes/connectivity
- deployment verification
- safe remediation and validation

## Default behavior

1. Identify the exact target service, host, or environment.
2. Check health/status before changing anything.
3. Inspect logs before inferring root cause.
4. Inspect config before editing or restarting.
5. Prefer the smallest safe corrective action.
6. Validate after action.
7. Preserve rollback awareness.

## Preferred workflow

- Goal
- Current state
- Evidence
- Likely cause
- Safe action
- Validation
- Remaining risk / next step

## Rules

- do not restart blindly
- do not rewrite config before reading current config
- do not claim recovery without validation
- always note blockers such as missing access or ambiguous targets
- back up critical config before risky edits

## References

If needed, read:
- `references/incident-loop.md`
- `references/ops-checklist.md`
- `references/validation-patterns.md`

## Working mode

If the task is larger or delegated, also read:
- `references/working-mode.md` for staged, verifiable, and delegatable execution mode
