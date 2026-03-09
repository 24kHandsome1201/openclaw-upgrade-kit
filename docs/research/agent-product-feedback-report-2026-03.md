# OpenClaw and adjacent agent products: public feedback report

_Date: 2026-03-09_

## Why this report exists
This report collects public information, user feedback, complaints, and expectations around OpenClaw and adjacent agent products so the next development phase can be guided by real demand signals instead of internal intuition alone.

It is organized around a simple question:

> What do users actually praise, hate, worry about, and hope for when they use execution agents, coding agents, and builder agents?

## Scope
Covered here:
- OpenClaw
- adjacent open-source agent platforms (especially OpenHands)
- Manus / Manus-like “operator” products
- developer coding agents (Cursor, Claude Code, OpenHands)
- builder agents (v0, Lovable, Bolt.new, Replit Agent)

## Method / evidence quality
This report uses a mix of:
- official docs / pricing / help pages
- official GitHub issue trackers
- public forum posts
- public Reddit discussions
- public review roundups / incident writeups

Signal quality is uneven:
- **Highest-confidence facts** come from official docs, official issue trackers, and clear incidents.
- **User sentiment** comes mostly from Reddit/forums and should be read as directional, not statistically representative.
- **Synthesis** is my interpretation based on repeated patterns across many public sources.

---

# Executive summary

## The short version
The market already agrees on one thing:

> Users want agents that do real work, not just chat.

But the public feedback across products is equally clear:

> Users stop trusting agents when they become expensive, opaque, destructive, flaky, or impossible to recover from.

Across OpenClaw and neighboring products, the strongest recurring themes are:
1. **People love the dream of an operator.**
2. **They hate invisible loops, vague billing, and destructive edits.**
3. **They want more control, not less — especially after the first draft.**
4. **They care about progress visibility and rollback much more than teams often assume.**
5. **Support quality becomes product quality when money or data is involved.**
6. **“Agentic” is only valuable when it remains steerable.**

## Main development takeaway
If OpenClaw wants to win as an open execution-upgrade platform, it should not try to out-market the closed products.
It should try to out-trust them.

That means emphasizing:
- transparent execution
- verifiable progress
- clean routing
- safe change boundaries
- recoverability
- inspectable integrations
- honest limits

---

# 1. OpenClaw

## What people like
### 1.1 The product shape is attractive
OpenClaw's “agent in your existing chat apps” model is intuitively powerful. Public setup guides and packaging projects keep appearing around Telegram/Discord/Slack/WhatsApp integration, which is a signal that the concept resonates.[O1][O2][O3]

### 1.2 Extensibility is a core part of the appeal
The surrounding ecosystem talks about skills/plugins not as optional extras, but as the thing that teaches the agent what it can do.[O3] That is a strong signal that users want a platform they can shape, not a fixed assistant.

### 1.3 Power users are willing to patch around problems
There are many community-authored setup and workaround guides for auth, security, MCP bridging, and provider-specific quirks.[O4][O5][O6][O7] That usually means users see enough value to invest serious effort.

## What people complain about
### 1.4 Reliability and channel behavior
The public issue tracker shows multiple current problems around gateway crash loops, duplicate processing, attachment handling, config reload crashes, and session mixups.[O1]

### 1.5 Onboarding and provider auth friction
Community fixes around Codex auth import and Claude Max/Pro token handling imply that some key paths are still too brittle.[O4][O5]

### 1.6 Tool/routing UX still leaks too much complexity
Visible issue titles around raw function calls leaking into responses, multi-agent session errors, and silent-mode requests suggest that “agent UX polish” is now a major gap, not a minor nicety.[O1]

### 1.7 Security and safety are not yet “obviously safe by default”
Security hardening guides and external security analysis exist because users worry about workspace access, secret exposure, and over-permissive exec setups.[O6][O7]

## What users seem to want next
- simpler setup
- safer defaults
- more stable gateway/channel behavior
- clearer tool output behavior
- better multi-agent/session ergonomics
- more direct and scalable external tool integration

## Implication for OpenClaw development
OpenClaw should treat channel reliability, config safety, and tool UX as core product work. Users perceive those as intelligence and trust, not plumbing.

---

# 2. Manus and the execution-agent dream

## Why Manus mattered so much
Manus became important not only because of its capabilities, but because it captured the market's desired end-state: a system that takes a goal and keeps moving.[M1][M2]

People were drawn to the feeling of an “operator” — something closer to a capable intern/operator than a chatbot.

## What users liked
- the ambition of true task execution
- the feeling of end-to-end autonomy
- multi-step research + browsing + acting in one loop
- a product story centered on outcomes, not answers

## What users hated
### 2.1 Reliability gap
Even early mainstream coverage said Manus did not work as well as the demos implied.[M1]

### 2.2 Credit burn and opaque cost
The single strongest recurring complaint is uncontrolled or poorly understood credit consumption, especially when the system loops or retries.[M3][M6][M7][M8]

### 2.3 Support and refunds
A large amount of public anger focuses on support quality and billing/refund handling rather than only raw AI quality.[M6][M8][M9]

### 2.4 Hype gap
A lot of the backlash is not “agents are bad.” It is “the demos oversold what production usage feels like.”[M1][M4][M5]

## What this means for OpenClaw
OpenClaw should learn from the desire Manus unlocked, but not import the failure modes:
- don't oversell autonomy
- make progress visible
- make cost/control surfaces explicit
- make retries, loops, and checkpoints inspectable
- win on trust, not mystique

---

# 3. Coding agents: Cursor, Claude Code, OpenHands

## Shared pattern
Users clearly want coding agents. That demand is not in doubt.
But the real market has moved past “Can it generate code?”
The new question is:

> Can it stay aligned, make bounded edits, and remain worth the iteration cost?

## Cursor
### What users like
- familiar editor workflow
- strong day-to-day leverage
- good multi-file editing when it works
- background agents and review workflow feel directionally correct[CA1][CA2]

### What users dislike
- lag / performance issues[CA4][CA5]
- instruction drift[CA3][CA6]
- over-agentic editing when they wanted analysis[CA6]
- cost/usage frustration as more work shifts into billed agent loops[CA2][CA7]

### Design lesson
Users want agentic power **with a steering wheel**.

## Claude Code
### What users like
- strongest perceived raw coding quality among many serious users[CA8][CA9]
- terminal-native workflow
- long-context and deep technical work

### What users dislike
- unclear or restrictive rate limits on serious usage[CA10][CA11][CA12][CA13]
- instruction non-compliance / CLAUDE.md drift[CA14][CA15][CA16]
- occasional false confidence, self-defense, or misleading debugging behavior[CA15]

### Design lesson
Being the smartest model is not enough if users cannot predict availability or trust instruction fidelity.

## OpenHands
### What users appear to value
- openness
- feedback loop with maintainers
- automation / SDK / integration potential[CA17][CA18]

### What users still want
- scalable MCP and integration patterns
- durable conversations
- more automation without losing visibility
- better state inheritance and plan clarity[CA18]

### Design lesson
Open-source users expect extensibility and inspectability — but they also expect platform-grade UX once the project matures.

---

# 4. Builder agents: v0, Lovable, Bolt.new, Replit Agent

## Shared pattern
Builder products are loved at the demo/MVP stage and distrusted at the iteration/production stage.

## v0
### What users like
- fast UI scaffolding
- good one-shot output when prompts are crisp
- smooth pairing with Vercel deployment[BA1][BA2]

### What users dislike
- lag/timeouts[BA3]
- destructive rewrites / unrelated code touched[BA4][BA5]
- high credit burn during debugging[BA6][BA7]
- quality drops after initial scaffolding[BA6]

### Lesson
Builder agents need a strong “surgical edit mode,” not only a strong “generate mode.”

## Lovable
### What users like
- empowers non-developers
- code portability is appreciated[BA9][BA10]

### What users dislike
- support silence / slow support[BA10][BA11][BA12]
- refund/credit trust issues[BA9][BA13][BA14]
- GitHub sync pain[BA12]
- security concerns in generated apps[BA15]

### Lesson
As soon as money, repo sync, or security enters the picture, “support quality” becomes part of the product.

## Bolt.new
### What users like
- attractive front-end output[BA13]

### What users dislike
- token burn
- outages / stuck projects
- weak support response[BA16][BA17][BA18]

### Lesson
Pretty output is not enough if iteration confidence collapses.

## Replit Agent
### What users like
- instant deploy path
- browser-based convenience
- all-in-one app-building feel[BA19]

### What users dislike
- some of the strongest pricing backlash in the category[BA20][BA21][BA22][BA23]
- support quality complaints[BA20][BA22]
- loops and repeated mistakes that still cost money[BA21][BA22]
- major trust damage from the database deletion incident[BA24]

### Lesson
If an agent can take dangerous actions, budget control and blast-radius control must be first-class UX.

---

# 5. Cross-product themes

## 5.1 Users love “do the work” products
The market absolutely wants systems that:
- plan
- act
- integrate tools
- keep moving
- deliver outputs

This validates the direction behind execution-oriented OpenClaw skills.

## 5.2 Users hate invisible loops
Across Manus, Cursor, v0, Lovable, Bolt, and Replit, one of the fastest trust-killers is:
- the system burning credits / time / context while producing little visible progress

## 5.3 Users want autonomy, but bounded autonomy
They want the agent to be proactive — but not freelancing.

Common asks across products are really asks for bounded autonomy:
- touch only the requested files
- show plan/progress
- explain why a step is being taken
- allow checkpoint/rollback
- stop when risk rises

## 5.4 Pricing transparency matters more than teams admit
Many public complaints are not “too expensive” in the abstract.
They are “I could not tell why I was being charged / capped / drained.”

## 5.5 Support becomes trust infrastructure
When billing, auth, Git sync, or account recovery breaks, users stop evaluating only the model and start evaluating the company.

## 5.6 Production handoff is the big category gap
Many tools are loved for scaffolding and disliked for the messy middle:
- debugging
- iteration containment
- refactoring
- security hardening
- deployment correctness
- documentation consistency

---

# 6. What users are implicitly asking for

Across all these products, the deepest unmet needs are:

1. **Visible execution state**
   - What is the agent doing right now?
   - Why?
   - What is next?

2. **Bounded change surfaces**
   - What files/components can it touch?
   - What should stay frozen?

3. **Recovery and rollback**
   - Can I undo?
   - Can I checkpoint?
   - Can I resume from a known state?

4. **Reliable mode separation**
   - discuss / inspect / plan / execute / patch / release should not all feel the same

5. **Transparent cost and stop controls**
   - what consumed credits or quota?
   - how do I stop it before it keeps burning?

6. **Trustworthy instruction following**
   - repo rules, manifests, checklists, constraints should stick

7. **Human-grade support signals**
   - especially for billing, account, sync, and data-loss scenarios

---

# 7. Concrete recommendations for OpenClaw / openclaw-upgrade-kit

## P0: Trust-first execution UX
- always show plan + progress + validation status
- make “continue” behavior explicit but inspectable
- separate facts, inferences, and unvalidated steps

## P0: Bound the blast radius
- clear touched-files / touched-systems reporting
- explicit safe mode vs full mode
- checkpoint before risky edits or long loops

## P0: Routing clarity
- discussion mode
- research mode
- coding mode
- ops mode
- docs mode
- release mode
- runtime/routing mode

The repo is already moving in this direction; public market feedback strongly validates it.

## P1: Cost/effort visibility
Even if OpenClaw itself is open and self-hostable, users still need visibility into:
- model choice
- tool cost / time
- retries
- loop count
- escalation boundaries

## P1: Safer long-task UX
- resumable checkpoints
- explicit blockers
- visible next step
- dry-run where possible

## P1: Integration trust
- clearer MCP / external-tool story
- explicit approval policy surfaces
- audit-friendly execution summaries

## P2: Production-oriented builder/coding flows
- scaffold mode vs surgical patch mode
- docs/code consistency checks
- release/readiness checks
- benchmarkable workflows

---

# 8. Product opportunities exposed by this research

## Opportunity A: Open alternative to opaque operator products
Position OpenClaw as:
- execution-oriented
- transparent
- inspectable
- checkpointable
- skill-driven

## Opportunity B: Open agent with “steerability” as the differentiator
Closed products often optimize for magic.
OpenClaw can optimize for:
- control
- visibility
- bounded autonomy
- recoverability

## Opportunity C: Better operator ergonomics for real users
The public complaints across products are not asking for more hype. They are asking for:
- fewer surprises
- fewer destructive edits
- fewer invisible loops
- clearer recovery paths

That is a product opening.

---

# 9. Final judgment

## What the market has already decided
- Execution agents are real demand.
- Coding agents are real demand.
- Builder agents are real demand.

## What the market still has not solved
- transparent trust
- bounded autonomy
- recovery-first UX
- predictable iteration
- support for the messy middle between first draft and production

## Best strategic direction for OpenClaw
OpenClaw should lean into being the **trustworthy open execution layer**.

Not the noisiest.
Not the most overhyped.
But the one that is:
- understandable
- inspectable
- skill-extensible
- verifiable
- recoverable

That is the strongest cross-product gap visible in current public feedback.

---

# Source index

## OpenClaw / adjacent open source
- [O1] OpenClaw issues: https://github.com/openclaw/openclaw/issues
- [O2] OpenClaw setup gist with official links: https://gist.github.com/decagondev/6712b725e8dc2c67f7e37f5639336a03
- [O3] openclaw/nix-openclaw: https://github.com/openclaw/nix-openclaw
- [O4] OpenClaw + Codex auth setup gist: https://gist.github.com/tashiscool/39419aa481c9afd39477db303f1e2525
- [O5] Claude Max/Pro token fix gist: https://gist.github.com/LazerLance777/89e678844333b42072dde5de5b53372e
- [O6] Security-first setup commands gist: https://gist.github.com/jordanlyall/8b9e566c1ee0b74db05e43f119ef4df4
- [O7] explain-openclaw security analysis: https://github.com/centminmod/explain-openclaw

## Manus / general agents
- [M1] TechCrunch: https://techcrunch.com/2025/03/09/manus-probably-isnt-chinas-second-deepseek-moment/
- [M2] Axios: https://www.axios.com/2025/03/10/manus-chinese-ai-agent-deepseek
- [M3] Manus Help Center credits: https://help.manus.im/en/articles/11813624-how-can-i-purchase-add-on-credits
- [M4] Reddit “Manus AI Status Quo”: https://www.reddit.com/r/ManusOfficial/comments/1jlyw8r
- [M5] Reddit caution for app development: https://www.reddit.com/r/ManusOfficial/comments/1px91jh/a_word_of_caution_before_subscribing_to_manus_for/
- [M6] Reddit “Manus is scamming. BEWARE.”: https://www.reddit.com/r/ManusOfficial/comments/1p6mdmu/manus_is_scamming_beware/
- [M7] Reddit subscription warning: https://www.reddit.com/r/AI_Agents/comments/1momzbw/warning_read_before_buying_a_manus_ai_subscription/
- [M8] Reddit refund policy complaint: https://www.reddit.com/r/ManusOfficial/comments/1pgv8c8/fraudulent_service_scam_refund_policies/
- [M9] Reddit ghost charges warning: https://www.reddit.com/r/ManusOfficial/comments/1rn9udn/warning_systemic_billing_failures_and_ghost/

## Coding agents
- [CA1] Cursor pricing: https://cursor.com/pricing/
- [CA2] Cursor usage/pricing docs: https://docs.cursor.com/en/account/usage
- [CA3] Cursor complaint thread: https://forum.cursor.com/t/complaint-regarding-cursor-ai-agent-performance/77460
- [CA4] Cursor lag thread: https://forum.cursor.com/t/cursor-very-laggy/125493
- [CA5] Cursor slow/performance issue thread: https://forum.cursor.com/t/performance-issue-system-running-very-slow/142194
- [CA6] Cursor “better tool out there?” thread: https://forum.cursor.com/t/is-there-better-tool-out-there-than-cursor/142287
- [CA7] Cursor pricing update: https://cursor.com/blog/aug-2025-pricing-teams
- [CA8] Claude Code overview: https://docs.anthropic.com/en/docs/claude-code/overview
- [CA9] Anthropic Claude Code page: https://www.anthropic.com/claude-code/
- [CA10] Reddit Claude usage-limit megathread: https://www.reddit.com/r/ClaudeAI/comments/1pmxsha/usage_limits_bugs_and_performance_discussion/
- [CA11] Reddit Claude rate-limits thread: https://www.reddit.com/r/ClaudeAI/comments/1obnd3p/claudes_rate_limits_are_pretty_bad_how_do_we/
- [CA12] Reddit Claude Code 5-hour limit thread: https://www.reddit.com/r/ClaudeCode/comments/1p80uh8/5_hour_rate_limited_is_a_joke/
- [CA13] Reddit transparency complaint: https://www.reddit.com/r/ClaudeCode/comments/1r9jhtm/lack_of_transparency_is_very_frustrating_let_us/
- [CA14] Anthropic issue #6120: https://github.com/anthropics/claude-code/issues/6120
- [CA15] Anthropic issue #10838: https://github.com/anthropics/claude-code/issues/10838
- [CA16] Anthropic issue #668: https://github.com/anthropics/claude-code/issues/668
- [CA17] OpenHands feedback docs: https://docs.openhands.dev/openhands/usage/troubleshooting/feedback
- [CA18] OpenHands issues: https://github.com/OpenHands/OpenHands/issues

## Builder products
- [BA1] Vercel/v0 team-edition complaint: https://www.reddit.com/r/vercel/comments/1huy987/disappointed_with_nextjs_v0_on_vercel_team/
- [BA2] v0 experience thread: https://www.reddit.com/r/vercel/comments/1lw0uyl/whats_everyones_experience_with_v0dev_do_you_hate/
- [BA3] v0 issues thread: https://www.reddit.com/r/vercel/comments/1jwylw5/issues_with_vercel/
- [BA4] v0 destructive rewrites thread: https://www.reddit.com/r/vercel/comments/1m0s7qg/goodbye_for_now/
- [BA5] v0 unrelated code touched: https://www.reddit.com/r/vercel/comments/1myl6gh/v0app_sucks/
- [BA6] v0 credit/ripoff thread: https://www.reddit.com/r/vibecoding/comments/1l34zjz/has_v0_become_a_ripoff/
- [BA7] v0 pricing concern thread: https://www.reddit.com/r/vercel/comments/1ktcdpz/v0_pricing_concerns_on_current_plan/
- [BA8] Lovable Trustpilot: https://www.trustpilot.com/review/lovable.dev
- [BA9] Lovable support gone silent: https://www.reddit.com/r/lovable/comments/1n0dqtf/lovabledev_support_has_gone_silent_after/
- [BA10] Lovable “Feeling scammed”: https://www.reddit.com/r/lovable/comments/1qk05h4/feeling_scammed/
- [BA11] Lovable contact/support thread: https://www.reddit.com/r/lovable/comments/1q4xc0q/how_to_contact_lovable/
- [BA12] Lovable GitHub sync support complaint: https://www.reddit.com/r/lovable/comments/1ksopz7/leaving_lovable_cant_sync_to_github_support_is/
- [BA13] Lovable refund/credit complaint: https://www.reddit.com/r/lovable/comments/1k8mw5t/loveable_you_need_to_refund_some_of_these_credits/
- [BA14] Lovable pricing disappointment thread: https://www.reddit.com/r/lovable/comments/1n8axck/i_loved_lovable_until_i_felt_scammed/
- [BA15] Lovable security thread: https://www.reddit.com/r/lovable/comments/1rffj3y/i_vibe_hacked_a_lovableshowcased_app_16/
- [BA16] Bolt scam thread: https://www.reddit.com/r/boltnewbuilders/comments/1kafwil/i_feel_scammed_by_boltnew/
- [BA17] Bolt Trustpilot: https://www.trustpilot.com/review/bolt.new
- [BA18] Bolt support/resolution thread: https://www.reddit.com/r/boltnewbuilders/comments/1mbfooa/ongoing_issues_with_boltnew_requesting_proper/
- [BA19] Replit review roundup: https://replitreview.com/replit-review/
- [BA20] Replit annual-subscription complaint: https://www.reddit.com/r/replit/comments/1hrn9r3/dont_buy_annual_subscription/
- [BA21] Replit buyer-beware thread: https://www.reddit.com/r/replit/comments/1fahuge/buyer_beware_replits_ai_agent_review/
- [BA22] Replit Agent 3 megathread: https://www.reddit.com/r/replit/comments/1nidmhr/ongoing_agent_3_feedback_megathread/
- [BA23] Replit random-charge thread: https://www.reddit.com/r/replit/comments/1rj5kh9/dont_use_replit_its_algorithm_randomly_charged_me/
- [BA24] Tom's Hardware on Replit database deletion incident: https://www.tomshardware.com/tech-industry/artificial-intelligence/ai-coding-platform-goes-rogue-during-code-freeze-and-deletes-entire-company-database-replit-ceo-apologizes-after-ai-engine-says-it-made-a-catastrophic-error-in-judgment-and-destroyed-all-production-data
