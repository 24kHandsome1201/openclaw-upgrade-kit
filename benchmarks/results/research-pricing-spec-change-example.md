# Benchmark Result Example: Research Task - Pricing / Spec Change Verification

## Task
- Name: Pricing / spec change verification
- Prompt: Verify whether a product's pricing or published specification changed recently. Prioritize fresh official sources, compare pricing/spec pages with changelogs or release notes if available, distinguish confirmed facts from inferred rollout status, and end with a recommendation about whether downstream documentation or planning assumptions should be updated.
- Task type: research

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-research`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames it as freshness-sensitive verification, not a static product summary |
| Planning quality | 1 | 2 | 3 | Better order: identify claimed change -> check official pricing/spec pages -> compare supporting announcements -> assess rollout certainty |
| Tool usage | 1 | 2 | 3 | Stronger use of current vendor pages and supporting primary sources |
| Evidence quality | 1 | 2 | 3 | Better handling of page freshness, source hierarchy, and fact vs inference |
| Progress reporting | 0 | 1 | 2 | Clearer staged updates while confirming or disproving the change |
| Delivery quality | 1 | 2 | 3 | Provides a more actionable update / hold recommendation for downstream planning |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: often answers with stale remembered pricing/specs or treats community commentary as if it were authoritative.
- Generic prompt behavior: more likely to search, but still may over-weight secondary summaries and understate uncertainty when official pages and announcements are not perfectly aligned.
- Upgraded skill behavior: checks fresh official pricing/spec sources first, uses release notes or product announcements as supporting context, and clearly separates confirmed published changes from inferred rollout timing or packaging implications.

## Conclusion
- What improved: current-source verification, source-quality discipline, and better distinction between confirmed published changes and inferred downstream impact.
- What still needs work: more examples involving regional pricing differences, staged rollouts, and archived pricing pages.
- Recommended next benchmark: compare on a mixed pricing + API packaging change where one official source updates before another.
