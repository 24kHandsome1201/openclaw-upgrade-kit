# Benchmark Result Example: Coding CI Config Failure Task

## Task
- Name: CI config failure isolation and fix
- Prompt: Investigate a failing CI run, isolate the narrowest likely cause in the CI configuration, apply the smallest useful fix, validate it with a focused check, and summarize any remaining release risk.
- Task type: coding

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-coding`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames the task as config isolation -> minimal patch -> validation |
| Planning quality | 1 | 2 | 3 | Better sequence around reading CI config, narrowing the failing step, and testing the smallest fix |
| Tool usage | 1 | 2 | 3 | Stronger use of workflow files, failing step output, and focused validation |
| Evidence quality | 1 | 2 | 3 | Better use of actual CI/log/config evidence before patching |
| Progress reporting | 0 | 1 | 2 | Clearer updates across isolate / patch / validate stages |
| Delivery quality | 1 | 2 | 3 | Ends with a concrete config fix and explicit remaining risk |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: often jumps to broad CI advice without isolating the exact failing configuration line or step.
- Generic prompt behavior: improves structure, but still tends to suggest wider CI rewrites or weakly validated config changes.
- Upgraded skill behavior: inspects the failing workflow/config first, isolates the narrowest config cause, applies a minimal fix, and validates before claiming the pipeline is healthier.

## Conclusion
- What improved: CI failure isolation, minimal config change discipline, and validation clarity.
- What still needs work: broader coverage across matrix builds, cache issues, and provider-specific CI behavior.
- Recommended next benchmark: compare on a release-pipeline failure or multi-job workflow dependency issue.
