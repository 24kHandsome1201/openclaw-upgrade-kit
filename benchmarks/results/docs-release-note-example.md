# Benchmark Result Example: Docs Release Note Consistency Task

## Task
- Name: Release note consistency review
- Prompt: Review these release notes against the current repository state. Identify the most important inconsistency in the claimed additions or status, correct the release-note direction, and state what was validated versus what still needs manual confirmation.
- Task type: docs

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-docs`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill framed it as release-note-to-repo consistency review |
| Planning quality | 1 | 2 | 3 | Better ordering of file checks, scope checks, and claim validation |
| Tool usage | 1 | 2 | 3 | Stronger verification of claimed files, skills, and release artifacts |
| Evidence quality | 1 | 2 | 3 | Better distinction between present repo state and not-yet-verified release claims |
| Progress reporting | 0 | 1 | 2 | Clearer summary of checked claims and remaining manual checks |
| Delivery quality | 1 | 2 | 3 | More actionable release-note corrections and release-boundary notes |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: tends to accept release-note wording too easily or rewrite wording without checking if the claimed files and capabilities actually exist.
- Generic prompt behavior: adds some structure, but still inconsistently verifies release claims against the repository tree and scripts.
- Upgraded skill behavior: checks the release notes like a docs review tied to actual repo contents, verifies claimed files and capabilities, and clearly marks anything that still needs pre-release confirmation.

## Conclusion
- What improved: claim verification, file-level consistency checks, and separation of real repository state from pending release assumptions.
- What still needs work: more examples covering cross-version release diffs and tag-specific release-note verification.
- Recommended next benchmark: compare on a pre-release note draft that references a feature not yet merged.
