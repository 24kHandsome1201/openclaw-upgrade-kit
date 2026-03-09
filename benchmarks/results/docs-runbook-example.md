# Benchmark Result Example: Docs Runbook Task

## Task
- Name: Runbook recovery-step review
- Prompt: Review this operational runbook against the actual recovery flow. Identify the highest-value drift in the recovery steps, correct the documentation direction, and state what was validated versus what still needs runtime confirmation.
- Task type: docs

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-docs`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill framed the task as runbook-to-runtime validation |
| Planning quality | 1 | 2 | 3 | Better ordering of runbook, commands, and recovery assumptions |
| Tool usage | 1 | 2 | 3 | Stronger inspection of scripts/configs before rewriting steps |
| Evidence quality | 1 | 2 | 3 | Better separation of validated recovery steps vs untested runtime claims |
| Progress reporting | 0 | 1 | 2 | Clearer reporting of what parts of the runbook were checked |
| Delivery quality | 1 | 2 | 3 | More actionable correction direction and boundary notes |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: likely to rewrite the runbook at a high level without checking whether the documented recovery sequence matches actual files or commands.
- Generic prompt behavior: improves structure, but still tends to blur verified recovery steps and untested runtime assumptions.
- Upgraded skill behavior: treats the runbook as an operational artifact, validates command/path references first, and clearly marks what still requires live-environment confirmation.

## Conclusion
- What improved: recovery-step verification, command/path discipline, and clarity about validated versus runtime-dependent instructions.
- What still needs work: broader examples involving multi-host recovery flows and rollback-heavy runbooks.
- Recommended next benchmark: compare on a service incident runbook with a restart + post-recovery verification sequence.
