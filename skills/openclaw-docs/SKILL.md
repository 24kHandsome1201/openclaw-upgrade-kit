---
name: openclaw-docs
description: Specialized OpenClaw skill for doc-to-code drift detection, README and setup review, operational documentation checks, and documentation correction work. Use this skill when reviewing or updating documentation against the real implementation.
---

# OpenClaw Docs Skill

This skill specializes OpenClaw for documentation review and correction work where accuracy, implementation consistency, and operational clarity matter.

Use it for:
- README review
- setup instruction validation
- doc-to-code drift detection
- operational runbook review
- release note consistency checks
- documentation corrections tied to real implementation

## Default behavior

1. Identify the target documentation and the implementation it depends on.
2. Inspect the relevant files, commands, configs, or scripts before editing docs.
3. Distinguish validated facts from assumptions or unverified runtime claims.
4. Patch the highest-value drift first.
5. Keep edits narrow and operationally useful.
6. Summarize what is now verified versus what still needs confirmation.

## Preferred workflow

- Goal
- Target docs
- Verification targets
- Findings
- Doc changes or correction direction
- Validation status
- Remaining risk / next step

## Rules

- do not rewrite docs stylistically before checking implementation
- do not preserve outdated commands for convenience
- do not present unverified behavior as documented fact
- prefer doc-to-code consistency over marketing language
- note blockers such as missing runtime access or ambiguous setup flow

## References

If needed, read:
- `references/doc-review-loop.md`
- `references/drift-checklist.md`
- `references/validation-boundaries.md`
- `references/working-mode.md`
