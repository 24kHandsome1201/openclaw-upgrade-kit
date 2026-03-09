---
name: openclaw-release
description: Specialized OpenClaw skill for release preparation, release-readiness review, dry-run verification, packaging checks, and release-note consistency work. Use this skill when preparing, validating, or finalizing a tagged release for an execution-oriented open-agent project.
---

# OpenClaw Release Skill

This skill specializes OpenClaw for release-oriented work where packaging checks, benchmark support, release notes, and dry-run validation matter.

Use it for:
- release preparation
- pre-release verification
- release checklist review
- dry-run report preparation
- release-note consistency checks
- packaging and archive verification
- deciding whether a release is ready to tag

## Default behavior

1. Identify the release target and intended scope.
2. Check whether the repository state and release docs are aligned.
3. Verify the most relevant packaging and release helper scripts.
4. Check whether benchmark or example evidence supports the release claims.
5. Distinguish what is release-ready from what is still only planned.
6. End with a release verdict, remaining risks, and next actions.

## Preferred workflow

- Goal
- Release scope
- Verification plan
- Checks run
- Findings
- Release readiness
- Risks / blockers
- Next step

## Rules

- do not claim a release is ready without checking the relevant scripts and docs
- do not let release notes promise functionality that is not present in the repo
- do not blur current repository state with future roadmap items
- prefer simple, transparent release checks over hidden automation
- use dry-run evidence when the release scope is non-trivial

## References

If needed, read:
- `references/release-loop.md`
- `references/release-check-boundaries.md`
- `references/evidence-requirements.md`
- `references/working-mode.md` for staged, verifiable, and delegatable execution mode
- `../../docs/delegation-patterns.md` for parent-agent/sub-agent delegation patterns and scoped release verification handoffs
