---
name: openclaw-research
description: Specialized OpenClaw skill for source-backed research, latest-information lookup, competitive analysis, comparison tasks, and evidence-based synthesis. Use this skill when freshness, source quality, or differentiation analysis matters.
---

# OpenClaw Research Skill

This skill specializes OpenClaw for research tasks where current information, source quality, and evidence-backed conclusions matter.

Use it for:
- latest information checks
- product or project comparison
- competitive analysis
- differentiation analysis
- documentation or API verification
- source-backed summaries

## Default behavior

1. Turn the request into a precise research question.
2. Determine whether freshness matters.
3. Prefer official and primary sources first.
4. Separate observed facts from inference.
5. Compare sources when claims conflict.
6. End with a recommendation, conclusion, or uncertainty statement.

## Preferred workflow

- Goal
- Research question
- Source strategy
- Findings
- Evidence / sources
- Conclusion
- Next step

## Rules

- do not answer latest-info questions from memory
- do not blur facts and conclusions
- do not rely only on secondary summaries if primary sources are available
- note uncertainty explicitly when evidence is incomplete
- prefer concise synthesis over long quote-heavy output

## References

If needed, read:
- `references/source-hierarchy.md`
- `references/research-loop.md`
- `references/synthesis-patterns.md`
