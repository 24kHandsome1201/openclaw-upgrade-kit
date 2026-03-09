# Benchmark Result Example: Coding Task

## Task
- Name: Focused repository fix
- Prompt: Review this repository, identify one obvious high-value issue, fix it with the smallest useful change, and validate the result. Do not wait after every step unless a risky decision is required.
- Task type: coding

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-coding`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill made the coding objective explicit |
| Planning quality | 1 | 2 | 3 | Better focus on small-diff workflow |
| Tool usage | 1 | 2 | 3 | Stronger inspect-before-edit pattern |
| Evidence quality | 1 | 2 | 3 | More file-based reasoning and validation |
| Progress reporting | 0 | 1 | 2 | Clearer coding-state updates |
| Delivery quality | 1 | 2 | 3 | Better patch + validation summary |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: vague code suggestions, limited repo inspection, weak validation.
- Generic prompt behavior: improved structure, but still inconsistent about minimal diffs and evidence.
- Upgraded skill behavior: narrower changes, stronger inspection flow, and clearer validation discipline.

## Conclusion
- What improved: issue framing, repo inspection, minimal-diff behavior, and result validation.
- What still needs work: repeated evaluation across multiple repo types and languages.
- Recommended next benchmark: compare on a build-failure or failing-test task.
