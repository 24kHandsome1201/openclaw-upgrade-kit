# Benchmark Result Example: Coding Build / Test Failure Task

## Task
- Name: Build failure isolation and fix
- Prompt: Investigate a failing build or test, isolate the most likely narrow cause, apply the smallest useful fix, validate the result, and summarize any remaining risk.
- Task type: coding

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-coding`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames the task as isolate -> patch -> validate |
| Planning quality | 1 | 2 | 3 | Better sequencing around reproduction and narrow fix scope |
| Tool usage | 1 | 2 | 3 | Stronger build/test/log-first workflow |
| Evidence quality | 1 | 2 | 3 | Better use of actual failure output before patching |
| Progress reporting | 0 | 1 | 2 | Clearer stage updates between reproduce / patch / validate |
| Delivery quality | 1 | 2 | 3 | Ends with validated fix summary rather than guesswork |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: often jumps to likely causes without grounding enough in actual build or test output.
- Generic prompt behavior: better structure, but still weaker on minimal-diff discipline and explicit validation boundaries.
- Upgraded skill behavior: inspects the failure first, isolates the narrowest plausible fix, and validates before claiming success.

## Conclusion
- What improved: failure isolation, evidence-backed patching, and validation discipline.
- What still needs work: wider coverage across dependency issues, flaky tests, and environment-specific failures.
- Recommended next benchmark: compare on a failing CI config or multi-step test regression task.
