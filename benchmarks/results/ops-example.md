# Benchmark Result Example: Ops Task

## Task
- Name: Service incident triage
- Prompt: The bot is not responding. Diagnose the most likely cause using status checks, logs, and config inspection. Apply the smallest safe fix, validate the result, and report any remaining blocker.
- Task type: ops

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-ops`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill framed it as a specific incident-response task |
| Planning quality | 1 | 2 | 3 | Better ordering of status, logs, config, then action |
| Tool usage | 1 | 2 | 3 | Stronger status/log/config-first behavior |
| Evidence quality | 1 | 2 | 3 | More explicit root-cause evidence and validation |
| Progress reporting | 0 | 1 | 2 | Better checkpoint-style updates |
| Delivery quality | 1 | 2 | 3 | Safer remediation summary and clearer blocker reporting |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: likely to speculate or recommend checks without strong execution order.
- Generic prompt behavior: somewhat better structure, but still weaker rollback and validation discipline.
- Upgraded skill behavior: more operator-like, safer action sequence, and better distinction between hypothesis and validated outcome.

## Conclusion
- What improved: incident framing, evidence gathering order, safe remediation, and validation.
- What still needs work: broader coverage across deployment, networking, and multi-host scenarios.
- Recommended next benchmark: compare on a conflict or token-mismatch troubleshooting task.
