# OpenClaw feedback notes (raw)

_As of 2026-03-09. This note separates product facts, public feedback, and synthesis._

## Product / project facts
- Official repo appears to be `openclaw/openclaw`, with GitHub issue volume in the thousands and large star/fork counts as rendered on the public issues page on 2026-03-09.[1]
- OpenClaw positioning in public docs/gists emphasizes a local agent that lives in chat apps such as Telegram/Discord/Slack/WhatsApp and can execute tools on the user's machine.[2][3]
- The Nix packaging project `openclaw/nix-openclaw` strongly markets an “agent-first” setup flow and automatic plugin/skill wiring, suggesting a community desire for one-command deployment rather than manual assembly.[4]

## Positive feedback / demand signals
### 1. The core idea is compelling: “agent in your chat apps”
Public setup guides and community packaging around Telegram/WhatsApp/Discord integration suggest strong user pull for a locally owned agent reachable from familiar channels instead of a browser-only UI.[2][3][4]

### 2. Skills/plugins are viewed as leverage
The Nix packaging and plugin ecosystem messaging repeatedly frames skills as the mechanism that teaches the agent what it can do. This is a strong signal that extensibility is not a side feature; it is part of the product's value proposition.[4]

### 3. Users are willing to document and patch around gaps
The ecosystem already has many user-authored setup/fix guides (e.g. Codex auth setup, Claude Max fixes, security-hardening guides, MCP workarounds). That usually means the product is exciting enough that users are investing real effort to keep it working.[5][6][7][8]

## Main complaints / pain points
### 1. Setup and auth are still too brittle
Community-written fixes around Codex auth import and Claude Max/Pro token issues strongly imply onboarding friction, especially when the "official" or default path fails.[5][6]

### 2. Gateway/channel reliability is a recurring issue
The public OpenClaw issues page on 2026-03-09 shows many problems clustered around gateway behavior and channel delivery, including duplicate message processing, hot-reload crashes, large attachment timeouts, and crash loops after updates.[1]

### 3. Tool / routing behavior is not predictable enough
Recent open issues mention multi-agent session errors, tools returning raw function calls, heartbeat session mixups, storage bloat, and requests for silent-mode tool output.[1] These are all symptoms of agent ergonomics and routing quality becoming product-level concerns.

### 4. Configuration and upgrade safety remain fragile
Issue titles visible on 2026-03-09 include startup crash loops caused by legacy config fields, plugin errors after updates, and services unexpectedly starting on non-gateway nodes after updates.[1] This indicates migration and rollout safety are major trust issues.

### 5. Security/trust concerns are part of the conversation
Public security-focused documentation and rebuttals exist because users are worried about over-broad workspace access, secret exposure, and overly permissive exec settings. Even if some writeups are opinionated, the mere existence of hardening guides is a signal that users do not yet feel “safe by default.”[7][8]

### 6. Native MCP support is a visible gap
A public workaround guide argues that OpenClaw cannot use MCP servers natively and that the workaround is slow because it shells out through a CLI bridge.[9] Whether or not every detail remains current, it captures a real expectation: users increasingly expect direct MCP-grade tool integration.

## User expectations
- Easier onboarding: fewer manual auth/import hacks, fewer config footguns.[5][6]
- Safer defaults: less secret exposure risk, more granular approvals, better workspace isolation.[7][8]
- More stable gateway behavior: fewer regressions on channel delivery and reloads.[1]
- Better agent UX: clearer progress, cleaner tool output, less raw function-call leakage, less session confusion.[1]
- Better integration surface: direct or more ergonomic MCP / external-tool connectivity.[9]

## Development implications for OpenClaw / upgrade-kit
1. Reliability work is not optional. Channel/gateway stability is part of perceived intelligence.
2. Skill/routing ergonomics matter as much as model quality; users notice raw tool noise and misrouting immediately.
3. Migration safety, rollback stories, and config linting are high-leverage trust features.
4. Security posture should be explainable and reviewable, not only configurable.
5. “Operator-quality” behavior should include channel-aware failure handling, silent/verbose modes, and clean progress updates.

## Sources
1. GitHub issues page for `openclaw/openclaw`, visible issue titles and counts on 2026-03-09: https://github.com/openclaw/openclaw/issues
2. Beginner’s Guide / setup gist referencing official OpenClaw docs and GitHub: https://gist.github.com/decagondev/6712b725e8dc2c67f7e37f5639336a03
3. Architecture overview gist: https://gist.github.com/jmanhype/6a4be9762ac68989598023230cdb3e3e
4. `openclaw/nix-openclaw` repository / quick start language: https://github.com/openclaw/nix-openclaw
5. OpenClaw + Codex subscription setup gist: https://gist.github.com/tashiscool/39419aa481c9afd39477db303f1e2525
6. Claude Max/Pro setup-token 401 fix gist referencing issue #23538: https://gist.github.com/LazerLance777/89e678844333b42072dde5de5b53372e
7. Security-first setup commands gist: https://gist.github.com/jordanlyall/8b9e566c1ee0b74db05e43f119ef4df4
8. Security analysis / explain-openclaw repository: https://github.com/centminmod/explain-openclaw
9. MCP workaround writeup: https://gist.github.com/Rapha-btc/527d08acc523d6dcdb2c224fe54f3f39/ad30e72e886523dd54c71f49f0c07f7e3525cde7
