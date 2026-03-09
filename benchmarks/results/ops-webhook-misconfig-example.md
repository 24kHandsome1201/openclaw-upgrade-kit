# Benchmark Result Example: Ops Task - Webhook Misconfiguration

## Task
- Name: Webhook misconfiguration cleanup
- Prompt: Diagnose a bot that is failing because webhook state is incorrectly configured. Verify whether the webhook should be present, inspect current webhook info and service behavior, apply the smallest safe correction, and validate that the blocking error stops recurring.
- Task type: ops

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-ops`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames it as a webhook-state mismatch, not a generic outage |
| Planning quality | 1 | 2 | 3 | Better order: service health -> webhook info -> logs -> correction -> validation |
| Tool usage | 1 | 2 | 3 | Stronger use of webhook inspection and post-change checks |
| Evidence quality | 1 | 2 | 3 | Better separation of observed webhook state from inferred root cause |
| Progress reporting | 0 | 1 | 2 | Clearer updates across inspect / correct / validate stages |
| Delivery quality | 1 | 2 | 3 | Safer remediation summary with explicit validation of webhook state |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: often recommends resetting the bot or changing token/config broadly without first proving webhook state is the blocker.
- Generic prompt behavior: improved structure, but still weaker on checking whether webhook presence or absence matches the intended polling mode.
- Upgraded skill behavior: inspects current webhook state first, compares it against intended runtime behavior, makes the smallest safe correction, and validates that the previous blocking pattern stops recurring.

## Conclusion
- What improved: webhook-state inspection, evidence-backed remediation, and post-fix verification discipline.
- What still needs work: broader examples involving partial webhook cleanup, stale callback URLs, and provider-specific webhook edge cases.
- Recommended next benchmark: compare on a mixed webhook + token-identity incident where both service config and remote bot state must be checked.
