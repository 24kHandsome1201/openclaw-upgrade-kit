# Benchmark Result Example: Ops Task - Service / Token Conflict

## Task
- Name: Telegram token conflict triage
- Prompt: The bot shows a Telegram getUpdates conflict. Diagnose whether another host or process is using the same token, identify the smallest safe remediation, and validate that the conflict stops recurring.
- Task type: ops

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-ops`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames the issue as a token-usage conflict, not a vague outage |
| Planning quality | 1 | 2 | 3 | Better sequence: service health -> webhook state -> conflicting host/process |
| Tool usage | 1 | 2 | 3 | Stronger use of status, logs, config, and cross-host checks |
| Evidence quality | 1 | 2 | 3 | Better distinction between observed conflict evidence and inferred root cause |
| Progress reporting | 0 | 1 | 2 | Clearer checkpoint-style updates during investigation |
| Delivery quality | 1 | 2 | 3 | Safer remediation summary with validation and rollback awareness |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: tends to suggest restarting or rechecking token setup without proving the conflict source.
- Generic prompt behavior: improved structure, but still weaker on cross-host evidence collection and conflict isolation.
- Upgraded skill behavior: checks local service state, log evidence, webhook state, and likely competing host/process usage before remediation.

## Conclusion
- What improved: root-cause isolation, evidence gathering order, safer remediation flow, and post-fix validation.
- What still needs work: more examples involving webhook conflicts versus long-poll conflicts and multi-host coordination.
- Recommended next benchmark: compare on a multi-host service duplication or stale webhook cleanup task.
