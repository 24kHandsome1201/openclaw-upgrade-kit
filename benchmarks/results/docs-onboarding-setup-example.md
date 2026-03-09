# Benchmark Result Example: Docs Onboarding Setup Drift Task

## Task
- Name: Onboarding setup drift review
- Prompt: Review this onboarding/setup document against the actual repository setup flow. Identify the highest-value drift in prerequisites, install steps, or verification commands, correct the documentation direction, and state what was validated versus what still needs manual or runtime confirmation.
- Task type: docs

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-docs`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill framed the task as onboarding-doc-to-setup verification rather than general doc cleanup |
| Planning quality | 1 | 2 | 3 | Better ordering of prerequisites, install commands, verification steps, and env assumptions |
| Tool usage | 1 | 2 | 3 | Stronger inspection of scripts, config files, and documented command paths before editing guidance |
| Evidence quality | 1 | 2 | 3 | Better separation of validated setup steps versus untested runtime onboarding claims |
| Progress reporting | 0 | 1 | 2 | Clearer reporting of what setup steps were verified and where verification stopped |
| Delivery quality | 1 | 2 | 3 | More actionable correction direction for setup drift and boundary notes for unvalidated steps |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: tends to rewrite onboarding text broadly or assume the documented setup flow is still correct without checking current scripts, package manager, or env requirements.
- Generic prompt behavior: improves structure, but still blurs the line between setup steps confirmed from repo evidence and steps that require a real environment or secrets.
- Upgraded skill behavior: verifies the onboarding doc against code, scripts, and config first; patches the highest-risk setup drift; and explicitly marks validated versus unvalidated onboarding boundaries.

## Conclusion
- What improved: prerequisite verification, command/path accuracy, and clearer validated-vs-unvalidated setup boundaries.
- What still needs work: more examples covering multi-environment onboarding, secret-dependent setup, and first-run smoke verification.
- Recommended next benchmark: compare on an onboarding guide that mixes local setup, external credentials, and post-install health checks.
