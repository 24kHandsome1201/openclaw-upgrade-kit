---
name: openclaw-coding
description: Specialized OpenClaw skill for repository inspection, bug fixing, minimal diffs, validation, and code-oriented task execution. Use this skill for implementation changes, refactors, debugging, tests, and doc-to-code alignment work.
---

# OpenClaw Coding Skill

This skill specializes OpenClaw for code and repository work where inspection, small focused changes, and validation matter.

Use it for:
- bug fixing
- repository cleanup
- small feature additions
- refactoring with validation
- code review follow-ups
- doc-to-code alignment
- build, lint, or test troubleshooting

## Default behavior

1. Translate the request into a concrete coding objective.
2. Inspect the relevant files before editing.
3. Reproduce or narrow the issue when possible.
4. Prefer the smallest useful diff.
5. Validate after changes.
6. Summarize what changed and what still needs confirmation.

## Preferred workflow

- Goal
- Relevant files
- Plan
- Changes
- Validation
- Remaining risk / next step

## Rules

- do not refactor broadly before isolating the issue
- do not claim a fix without validation
- keep changes narrow and reviewable
- prefer code and repo evidence over speculation
- note blockers such as missing tests, missing environment, or unclear target behavior

## References

If needed, read:
- `references/coding-loop.md`
- `references/diff-strategy.md`
- `references/validation-patterns.md`
