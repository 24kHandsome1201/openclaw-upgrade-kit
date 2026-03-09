# Builder-agent product feedback (raw)

_As of 2026-03-09. Focus: v0, Lovable, Bolt.new, Replit Agent._

## Common pattern across builder products
The category promise is: “describe what you want, get a working app/site fast.” Public feedback shows users love the first 20% of that journey and become frustrated when iteration, debugging, pricing, or production hardening takes over.

## v0
### Positive signals
- Users repeatedly praise v0 for quick mockups, UI scaffolding, and integration with Vercel deployment workflows.[1][2]
- Even critical users often say the one-shot or early-stage output can be good if prompts are very specific.[3]

### Complaints
- Frequent themes include first-prompt errors, lag/timeouts, rogue file generation, unasked-for rewrites, and difficulty recovering from destructive edits.[1][4][5][6]
- Pricing/credit frustration is strong: users complain that iterative debugging can feel like “burning credits” without enough progress.[3][7][8]

### User expectation
- Users want v0 to stay great at scaffolding while becoming more controllable and less destructive in iterative editing.

## Lovable
### Positive signals
- Positive reviews often come from non-developers who feel newly empowered to build and launch software without writing everything by hand.[9][10]
- Some users explicitly value that they can export/take the code and are not completely trapped.[11]

### Complaints
- Support responsiveness is a large public pain point.[10][12][13]
- Credit/refund trust is another recurring issue, especially after pricing changes or failed runs.[9][14][15]
- Users also report GitHub sync pain, debugging weakness, and concerns about security posture in generated apps.[13][16]

### User expectation
- Human support for account/billing issues, better GitHub/repo sync reliability, and clearer security boundaries.

## Bolt.new
### Positive signals
- Bolt is often praised for visually attractive output and fast front-end scaffolding.[15][17]

### Complaints
- Public complaints cluster around token loss/credit burn, outages, poor support response, and projects getting stuck for long periods.[17][18][19]

### User expectation
- Better support, clearer pricing/usage visibility, and less fragility during longer projects.

## Replit Agent
### Positive signals
- Users still praise the convenience of browser-based development, instant deployment, and low-friction demo-to-live workflows.[20][21]
- Some users report that when it works, it compresses the app-launch path dramatically.[21]

### Complaints
- Replit has some of the harshest public backlash around pricing, surprise charges, ineffective support, agent loops, and fragile quality.[20][22][23][24][25]
- The July 2025 public incident where the AI agent reportedly destroyed production data became a major trust signal across the whole category.[26]
- Many complaints are specifically about being billed while the agent is failing or redoing work.[22][23][24]

### User expectation
- Hard budget controls, clearer stop conditions, safer change boundaries, and less “agent freelancing.”

## Cross-category synthesis
Users of builder agents consistently want:
1. **Fast first draft** _and_ reliable iteration
2. **Visible cost control** during debugging loops
3. **Git/repo safety** and easier rollback
4. **Support that feels human** when money or account access is involved
5. **Production handoff paths** beyond the demo
6. **More predictable change boundaries** so the agent does not rewrite unrelated parts
7. **Security guidance** that matches the capabilities given to non-technical builders

## Implications for OpenClaw / upgrade-kit
- Separate “scaffold mode” from “surgical fix mode”.
- Treat rollback/undo/checkpoint as first-class UX.
- Make pricing/usage visibility and stop controls explicit if any metered behavior exists.
- Prefer transparent, inspectable workflows over magical but opaque loops.
- If targeting non-experts, document production-readiness and security boundaries very clearly.

## Sources
1. Reddit /r/vercel: disappointed with v0 Team Edition, 2025-01-06: https://www.reddit.com/r/vercel/comments/1huy987/disappointed_with_nextjs_v0_on_vercel_team/
2. Reddit /r/vercel: “What’s everyone’s experience with v0.dev?” https://www.reddit.com/r/vercel/comments/1lw0uyl/whats_everyones_experience_with_v0dev_do_you_hate/
3. Reddit /r/vibecoding: “Has v0 become a ripoff?” https://www.reddit.com/r/vibecoding/comments/1l34zjz/has_v0_become_a_ripoff/
4. Reddit /r/vercel: issues with Vercel/v0, 2025-04-11: https://www.reddit.com/r/vercel/comments/1jwylw5/issues_with_vercel/
5. Reddit /r/vercel: “Goodbye for now” / destructive rewrites: https://www.reddit.com/r/vercel/comments/1m0s7qg/goodbye_for_now/
6. Reddit /r/vercel: “V0.app sucks” / unrelated code touched: https://www.reddit.com/r/vercel/comments/1myl6gh/v0app_sucks/
7. Reddit /r/vercel: “V0 New Pricing is Broken” https://www.reddit.com/r/vercel/comments/1ko599z/v0_new_pricing_is_broken/
8. Reddit /r/vercel: pricing concerns / loop-burn complaints: https://www.reddit.com/r/vercel/comments/1ktcdpz/v0_pricing_concerns_on_current_plan/
9. Trustpilot overview for Lovable: https://www.trustpilot.com/review/lovable.dev
10. Reddit /r/lovable: support gone silent: https://www.reddit.com/r/lovable/comments/1n0dqtf/lovabledev_support_has_gone_silent_after/
11. Reddit /r/lovable: “Feeling scammed” discussion incl. code portability comments: https://www.reddit.com/r/lovable/comments/1qk05h4/feeling_scammed/
12. Reddit /r/lovable: support contact confusion: https://www.reddit.com/r/lovable/comments/1q4xc0q/how_to_contact_lovable/
13. Reddit /r/lovable: can't sync to GitHub / slow support: https://www.reddit.com/r/lovable/comments/1ksopz7/leaving_lovable_cant_sync_to_github_support_is/
14. Reddit /r/lovable: refund/credit complaint: https://www.reddit.com/r/lovable/comments/1k8mw5t/loveable_you_need_to_refund_some_of_these_credits/
15. Reddit /r/lovable: “I loved Lovable… until I felt scammed” and Bolt comparison: https://www.reddit.com/r/lovable/comments/1n8axck/i_loved_lovable_until_i_felt_scammed/
16. Reddit /r/lovable: security concerns in showcased apps: https://www.reddit.com/r/lovable/comments/1rffj3y/i_vibe_hacked_a_lovableshowcased_app_16/
17. Reddit /r/boltnewbuilders: “I feel scammed by bolt.new” https://www.reddit.com/r/boltnewbuilders/comments/1kafwil/i_feel_scammed_by_boltnew/
18. Trustpilot overview for Bolt.new: https://www.trustpilot.com/review/bolt.new
19. Reddit /r/boltnewbuilders: support/resolution thread: https://www.reddit.com/r/boltnewbuilders/comments/1mbfooa/ongoing_issues_with_boltnew_requesting_proper/
20. Reddit /r/replit: “Don’t buy annual subscription” / compares Replit against v0 and bolt: https://www.reddit.com/r/replit/comments/1hrn9r3/dont_buy_annual_subscription/
21. Replit review roundup: https://replitreview.com/replit-review/
22. Reddit /r/replit: buyer beware / repeated billing and broken loops: https://www.reddit.com/r/replit/comments/1fahuge/buyer_beware_replits_ai_agent_review/
23. Reddit /r/replit: Ongoing Agent 3 feedback megathread: https://www.reddit.com/r/replit/comments/1nidmhr/ongoing_agent_3_feedback_megathread/
24. Reddit /r/replit: “Don’t use Replit, its algorithm randomly charged me $300 in 10 days!” https://www.reddit.com/r/replit/comments/1rj5kh9/dont_use_replit_its_algorithm_randomly_charged_me/
25. Reddit /r/replit: billing system is a joke: https://www.reddit.com/r/replit/comments/1rkmf2d/replits_billing_system_is_a_joke/
26. Tom's Hardware on Replit database deletion incident, 2025-07-21: https://www.tomshardware.com/tech-industry/artificial-intelligence/ai-coding-platform-goes-rogue-during-code-freeze-and-deletes-entire-company-database-replit-ceo-apologizes-after-ai-engine-says-it-made-a-catastrophic-error-in-judgment-and-destroyed-all-production-data
