# Benchmark Result Example: Coding Flaky Test Stabilization Task

## Task
- Name: Flaky test stabilization
- Prompt: Investigate a flaky test, identify the narrowest likely cause, apply the smallest stabilization fix, validate the change with a focused rerun strategy, and summarize any remaining uncertainty.
- Task type: coding

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-coding`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames the task as isolate instability -> stabilize -> rerun |
| Planning quality | 1 | 2 | 3 | Better sequencing around reproduction clues, timing/state assumptions, and minimal fix scope |
| Tool usage | 1 | 2 | 3 | Stronger use of test output, targeted reruns, and focused validation |
| Evidence quality | 1 | 2 | 3 | Better distinction between suspected flake cause and observed failing pattern |
| Progress reporting | 0 | 1 | 2 | Clearer state updates across investigation and stabilization stages |
| Delivery quality | 1 | 2 | 3 | Ends with a concrete stabilization change and explicit residual uncertainty |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: often treats flaky tests like ordinary failures and jumps to large fixes without isolating the instability pattern.
- Generic prompt behavior: improves organization, but still tends to blur hypothesis and evidence or make larger-than-needed test changes.
- Upgraded skill behavior: looks for the narrowest instability source, keeps the diff small, and validates with a focused rerun strategy before claiming stabilization.

## Conclusion
- What improved: instability isolation, narrow-fix discipline, and validation of stabilization rather than just single-run success.
- What still needs work: wider coverage across async timing, environment-dependent flakes, and test-order sensitivity.
- Recommended next benchmark: compare on a flaky integration test or retry-policy cleanup task.
