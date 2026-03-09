# Benchmark Result Example: Docs Task

## Task
- Name: README setup drift review
- Prompt: Review this README against the actual repository setup process. Identify the most important documentation drift, update the affected section, and state what was validated versus what still needs runtime confirmation.
- Task type: docs

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-docs`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill framed the task as implementation-backed doc review |
| Planning quality | 1 | 2 | 3 | Better doc-to-code verification order |
| Tool usage | 1 | 2 | 3 | Stronger file/script/config inspection before rewriting |
| Evidence quality | 1 | 2 | 3 | Better separation of validated facts and unknowns |
| Progress reporting | 0 | 1 | 2 | Clearer reporting of what was checked and updated |
| Delivery quality | 1 | 2 | 3 | More actionable doc patch and validation summary |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: tends to rewrite docs broadly or infer setup details too early.
- Generic prompt behavior: better structure, but still inconsistent about verification boundaries.
- Upgraded skill behavior: reviews docs with a code-review mindset, patches the highest-value drift first, and clearly marks what still needs runtime confirmation.

## Conclusion
- What improved: verification discipline, drift detection, and clarity around validated vs unvalidated claims.
- What still needs work: broader coverage across architecture docs, onboarding docs, and release notes.
- Recommended next benchmark: compare on a runbook or deployment-doc review task.
