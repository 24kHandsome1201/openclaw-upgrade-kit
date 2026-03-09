# Benchmark Result Example: Ops Task - Stale Process / Multi-Host Cleanup

## Task
- Name: Stale process cleanup across hosts
- Prompt: Diagnose a bot conflict caused by an old process or secondary host still using the same runtime identity. Check service state, logs, and competing processes or hosts, apply the smallest safe cleanup, and validate that the duplicate activity stops.
- Task type: ops

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-ops`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames it as duplicate runtime ownership, not a vague service failure |
| Planning quality | 1 | 2 | 3 | Better order: local status -> logs -> competing host/process -> cleanup -> validation |
| Tool usage | 1 | 2 | 3 | Stronger use of service, process, and cross-host inspection |
| Evidence quality | 1 | 2 | 3 | Better distinction between observed duplication evidence and guessed causes |
| Progress reporting | 0 | 1 | 2 | Clearer checkpoint-style updates during multi-host investigation |
| Delivery quality | 1 | 2 | 3 | Safer cleanup summary with explicit validation that duplicate activity stopped |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: tends to restart the current service without proving whether another process or host is still active.
- Generic prompt behavior: somewhat better structure, but still weaker on isolating whether the stale activity is local or remote before remediation.
- Upgraded skill behavior: checks local service state first, gathers evidence from logs and competing processes/hosts, performs the smallest cleanup needed, and revalidates that the duplicate behavior is gone.

## Conclusion
- What improved: multi-host evidence gathering, stale-process isolation, smaller remediation scope, and post-cleanup validation.
- What still needs work: broader examples involving stale containers, delayed supervisor restarts, and conflicting scheduled jobs.
- Recommended next benchmark: compare on a stale process cleanup combined with a config drift issue on the surviving host.
