# Developer agent / coding agent feedback (raw)

_As of 2026-03-09. Focus: Cursor, Claude Code, OpenHands, plus adjacent coding-agent discourse._

## Cursor
### Facts
- Cursor's official pricing now clearly sells Agent, Background Agents, and large-context workflows as core value, with usage tied to model/API consumption and plan tiers.[1][2][3]

### Positive signals
- Users still credit Cursor for strong multi-file editing, VS Code familiarity, and high day-to-day leverage when it works well.[4][5]
- Cursor's product surface has expanded beyond inline completion into background agents and bug review, which validates that users want multi-step work, not just autocomplete.[1]

### Complaints
- Repeated forum and Reddit complaints cite degraded performance, lag, looping, instruction drift, and excessive agentic behavior when users wanted discussion-first behavior.[4][6][7][8][9]
- Pricing/usage frustration appears when agent iterations burn usage without enough value, especially after pricing changes and more API-priced usage.[3][10]
- Some users specifically want more predictable file handling and less autonomy when making edits.[6][8]

## Claude Code
### Facts
- Anthropic positions Claude Code as a composable CLI for agentic coding and documents cost-management explicitly, which suggests cost observability is part of the official product story.[11][12]

### Positive signals
- Many heavy users still regard Claude Code as the strongest raw coding model/agent for difficult technical work, long context, and terminal-native workflows.[13][14]
- Community sentiment often treats Claude Code as the quality bar even when users are unhappy with limits.[13][15]

### Complaints
- The loudest complaint is rate limits / opaque usage ceilings on paid plans, especially for serious coding sessions.[16][17][18][19]
- Another recurring complaint is instruction non-compliance: CLAUDE.md not being followed, drift over long sessions, and incorrect self-defense / false reporting in bug triage.[20][21][22]
- Users also report degraded review quality and occasional hallucinated or stale-code reasoning.[21][23]

## OpenHands
### Facts
- OpenHands publicly invites feedback as training/evaluation material.[24]
- Its issue tracker shows current demand around automation, conversation durability, scalable MCP usage, conversation inheritance, and plan/task duplication.[25]

### User expectations
- Open-source users expect extensibility, SDK control, MCP-scale integration, and transparent state.
- The bar is shifting from “can it code?” to “can it keep state, integrate cleanly, and be debugged?”

## Cross-product synthesis
What users actually care about in coding agents:
1. **Instruction fidelity** — does it follow repo rules/manifests?
2. **Edit containment** — does it change only what it should?
3. **Iteration efficiency** — can it avoid costly loops?
4. **Cost transparency** — do users understand why they got billed/limited?
5. **Recovery** — can the tool help unwind mistakes?
6. **State visibility** — can users tell what the agent is doing and why?
7. **Long-horizon stability** — can it keep context and intent over multiple steps?

## Implications for OpenClaw / upgrade-kit
- Offer explicit discussion vs execution routing; users hate over-agentic editing when they wanted analysis.
- Make progress, plan, and validation visible by default.
- Build for small-diff containment and recovery/rollback.
- If there is any usage or quota surface, make it painfully transparent.
- Treat instruction following as a product feature, not a prompt detail.

## Sources
1. Cursor pricing: https://cursor.com/pricing/
2. Cursor docs pricing/usage: https://docs.cursor.com/en/account/usage
3. Cursor teams pricing update, Aug 2025: https://cursor.com/blog/aug-2025-pricing-teams
4. Cursor forum: complaint regarding agent performance: https://forum.cursor.com/t/complaint-regarding-cursor-ai-agent-performance/77460
5. Reddit: long-term user discussion on Cursor: https://www.reddit.com/r/cursor/comments/1k94oye
6. Cursor forum: performance and usability concerns: https://forum.cursor.com/t/performance-and-usability-concerns/68233
7. Cursor forum: “lousy and lazy” thread: https://forum.cursor.com/t/omg-cursor-has-become-lousy-and-lazy-since-4-sep-2025/132768
8. Cursor forum: “is there better tool out there than cursor?” https://forum.cursor.com/t/is-there-better-tool-out-there-than-cursor/142287
9. Reddit: “Really frustrated with Cursor,” 2026-02-28: https://www.reddit.com/r/cursor/comments/1rgtigi/really_frustrated_with_cursor/
10. Ars Technica on Cursor refusal / user frustration: https://arstechnica.com/ai/2025/03/ai-coding-assistant-refuses-to-write-code-tells-user-to-learn-programming-instead/
11. Claude Code overview: https://docs.anthropic.com/en/docs/claude-code/overview
12. Claude Code cost management docs: https://docs.anthropic.com/en/docs/claude-code/costs
13. Anthropic Claude Code page: https://www.anthropic.com/claude-code/
14. Reddit: expectations / praise and pressure around Claude Code: https://www.reddit.com/r/ClaudeCode/comments/1q11t8v/software_engineering_expectations_for_2026/
15. Reddit: “Software Engineer position will never die” discussion comparing Cursor and Claude quality: https://www.reddit.com/r/ClaudeAI/comments/1rbrpmv/software_engineer_position_will_never_die/
16. Reddit: rate limits megathread beginning Dec 15, 2025: https://www.reddit.com/r/ClaudeAI/comments/1pmxsha/usage_limits_bugs_and_performance_discussion/
17. Reddit: “Claude's rate limits are pretty bad”: https://www.reddit.com/r/ClaudeAI/comments/1obnd3p/claudes_rate_limits_are_pretty_bad_how_do_we/
18. Reddit: “5 Hour Rate Limited Is A Joke”: https://www.reddit.com/r/ClaudeCode/comments/1p80uh8/5_hour_rate_limited_is_a_joke/
19. Reddit: “Lack of transparency is very frustrating”: https://www.reddit.com/r/ClaudeCode/comments/1r9jhtm/lack_of_transparency_is_very_frustrating_let_us/
20. Anthropic issue #6120, CLAUDE.md ignored: https://github.com/anthropics/claude-code/issues/6120
21. Anthropic issue #10838, systematic self-defense / bad debugging behavior: https://github.com/anthropics/claude-code/issues/10838
22. Anthropic issue #668, memory instructions not followed: https://github.com/anthropics/claude-code/issues/668
23. Claude Code review issue / assessment examples: https://github.com/anthropics/claude-code-action/issues/590 and https://gist.github.com/markedmondson/920dfe8e75b2700a096b1a5c282b38df
24. OpenHands feedback docs: https://docs.openhands.dev/openhands/usage/troubleshooting/feedback
25. OpenHands issues page on 2026-03-09: https://github.com/OpenHands/OpenHands/issues
