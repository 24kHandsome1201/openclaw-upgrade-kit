# Benchmark Result Example: Research Task - API / Docs Verification

## Task
- Name: API / docs verification
- Prompt: Verify whether the current official API documentation still supports the claimed endpoint behavior and parameter requirements. Use fresh primary sources, distinguish observed documentation facts from inferred implementation guidance, and end with a recommendation about whether internal guidance should change.
- Task type: research

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-research`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill frames the task as current-doc verification, not generic API explanation |
| Planning quality | 1 | 2 | 3 | Better order: identify claim -> fetch official docs -> compare claimed behavior -> isolate drift |
| Tool usage | 1 | 2 | 3 | Stronger use of current primary docs and release notes instead of memory |
| Evidence quality | 1 | 2 | 3 | Better freshness discipline and clearer fact vs inference separation |
| Progress reporting | 0 | 1 | 2 | Clearer updates across source collection, comparison, and conclusion |
| Delivery quality | 1 | 2 | 3 | Ends with a usable keep/change recommendation for internal docs |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: tends to explain how the API usually works from memory, with weak freshness checks and limited source hierarchy.
- Generic prompt behavior: more structured, but still inconsistent about preferring official docs over secondary summaries and about separating documented facts from implementation inference.
- Upgraded skill behavior: starts by verifying the exact claim against fresh official docs, treats release notes / changelogs as supporting evidence, and explicitly labels what is documented versus what is inferred for migration guidance.

## Conclusion
- What improved: freshness handling, source quality, and explicit fact vs inference discipline during API/docs verification.
- What still needs work: repeated runs on APIs with fragmented documentation across docs, SDK guides, and release notes.
- Recommended next benchmark: compare on a pricing/spec change task where official pricing pages and product spec pages diverge in update timing.
