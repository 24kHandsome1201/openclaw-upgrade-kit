# Benchmark Result Example: Research Task

## Task
- Name: Differentiation analysis
- Prompt: Research whether this open-source project idea is still differentiated. Use current public sources, prioritize primary sources, distinguish facts from inferences, and end with a recommendation.
- Task type: research

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-research`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Research-specific framing improved with the skill |
| Planning quality | 1 | 2 | 3 | Skill produced clearer source strategy |
| Tool usage | 1 | 1 | 3 | Skill strongly encouraged current-source lookup |
| Evidence quality | 1 | 2 | 3 | Better fact/inference separation |
| Progress reporting | 0 | 1 | 2 | Skill gave clearer state during multi-step work |
| Delivery quality | 1 | 2 | 3 | Ended with a usable recommendation |
| **Total** | **5** | **10** | **17** | |

## Qualitative notes
- Base behavior: broad reasoning, weak sourcing, limited structure.
- Generic prompt behavior: somewhat improved organization, but inconsistent evidence discipline.
- Upgraded skill behavior: source-first, clearer synthesis, stronger recommendation quality.

## Conclusion
- What improved: framing, source strategy, evidence quality, and decision usefulness.
- What still needs work: more real-world repeated runs across varied topics.
- Recommended next benchmark: compare on a current API/docs verification task.
