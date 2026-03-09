# Benchmark Result Example: Ops Task - Configuration Misconfiguration

## Task
- Name: Runtime config misconfiguration review
- Prompt: Diagnose a bot that is running but silently not responding because of a configuration mistake. Inspect status, logs, and config, apply the smallest safe correction, and validate that the blocking behavior is resolved.
- Task type: ops

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-ops`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames it as a config-caused runtime behavior issue |
| Planning quality | 1 | 2 | 3 | Better order: status -> logs -> config -> smallest safe change -> validation |
| Tool usage | 1 | 2 | 3 | Stronger config inspection before restart or rewrite |
| Evidence quality | 1 | 2 | 3 | Better use of log/config evidence to separate symptom from cause |
| Progress reporting | 0 | 1 | 2 | Better updates on what was checked and what changed |
| Delivery quality | 1 | 2 | 3 | Safer config correction summary with syntax/runtime validation |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: often jumps to generic restart or high-level suggestions without narrowing the config issue.
- Generic prompt behavior: somewhat better structure, but still weaker on backup-before-edit and post-change validation discipline.
- Upgraded skill behavior: reads the active config, isolates the likely misconfiguration, applies the narrowest correction, and validates both config integrity and runtime state.

## Conclusion
- What improved: config-first reasoning, safer edit discipline, clearer validation boundaries, and more operator-like remediation.
- What still needs work: broader examples covering environment-variable drift, multi-file config layering, and partial rollback scenarios.
- Recommended next benchmark: compare on a config syntax error versus policy-level misconfiguration task.
