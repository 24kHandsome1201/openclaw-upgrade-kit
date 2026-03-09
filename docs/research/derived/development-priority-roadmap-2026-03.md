# Development Priority Roadmap Derived from Feedback (2026-03)

_Source report: `docs/research/agent-product-feedback-report-2026-03.md`_

This document is the **current execution-priority roadmap**.
Use `docs/roadmap-10-phases.md` as the historical / long-horizon evolution map, not as the day-to-day execution source.

## Goal
Turn cross-product feedback into a practical roadmap for:
- OpenClaw main product
- `openclaw-upgrade-kit`
- runtime / integration surfaces
- benchmark / evaluation workflow

---

# P0 — Trust-first foundation

## Objective
Make the system feel dependable before making it more autonomous.

## Why now
The strongest cross-product complaint is not “agents are not impressive enough.”
It is: they are too opaque, too destructive, too flaky, or too hard to recover.

## Capabilities to build
### 1. Transparent execution default
- standard plan/progress/validation output
- fact vs inference separation
- blocked-state reporting

### 2. Bounded autonomy controls
- safe mode vs full mode
- risky action confirmation
- touched-files / touched-systems reporting

### 3. Long-task checkpoint / resume
- checkpoint template
- resumable task flow
- rollback path for risky operations

### 4. Channel and tool trust basics
- inbound/outbound/auth health separation
- tool exposure smoke tests
- capability-loss explicit warnings

### 5. Troubleshooting-first documentation
- Telegram/gateway runbooks
- auth/pairing diagnosis
- provider error taxonomy docs

## Milestones
- core skills all expose transparent execution sections
- benchmark rubric measures progress visibility and validation quality
- at least one channel runbook and one provider runbook exist
- long-task benchmark and checkpoint flow are reproducible

---

# P1 — Operational clarity and control

## Objective
Help users understand cost, state, and routing without reading raw logs.

## Why now
Once the trust baseline exists, the next frustration is confusion: why did it route this way, keep going, retry, or fail?

## Capabilities to build
### 1. Routing clarity
- explainable mode switching
- default vs specialized routing summary
- runtime fallback explanations

### 2. Cost / effort observability
- loop count
- retry count
- major tool step summary
- elapsed-stage reporting

### 3. Better error attribution
- distinguish auth vs rate limit vs config vs upstream vs local tool failure
- human-readable failure summaries

### 4. Permission visibility
- clear user-facing permission model
- denied-action explanation paths

### 5. Community evidence pipeline
- benchmark contribution flow
- issue templates tied to reproducible evidence
- release checklist linked to benchmark coverage

## Milestones
- routing decision appears in relevant outputs
- benchmark guide includes observability scoring
- troubleshooting docs include normalized error classes
- contribution docs support evidence-driven PRs/issues

---

# P2 — Product breadth and production-grade polish

## Objective
Expand capability safely after trust and clarity are in place.

## Why later
Many competitors fail because they optimize breadth before control.
OpenClaw should avoid that trap.

## Capabilities to build
### 1. Broader channel/platform coverage
- more first-install channels
- desktop/mobile-oriented paths
- stronger default integrations

### 2. Production-oriented specialized workflows
- surgical patch mode for coding/builders
- release-readiness automation
- docs/code/config consistency sweeps

### 3. Deeper automation
- event-driven tasks
- scheduled routines
- richer multi-step runtime orchestration

### 4. More benchmark depth
- more real-world incident cases
- more host/runtime layout cases
- more production handoff scenarios

## Milestones
- new channels documented and testable
- at least one new specialized production workflow exists
- benchmark library expands to additional real-world scenarios
- runtime patterns support more host layouts without sacrificing clarity

---

# By workstream

## OpenClaw main product
### P0
- channel health model
- pairing/auth diagnosis
- safer restart/recovery state handling
- tool availability visibility

### P1
- clearer provider error taxonomy
- better status surfaces outside raw logs
- explicit autonomy controls

### P2
- more first-install channels
- stronger client/platform coverage

## openclaw-upgrade-kit / skills
### P0
- transparent execution defaults everywhere
- working-mode consistency
- checkpoint/rollback-aware output patterns

### P1
- routing explanations
- observability-friendly reporting
- stronger blocked-state patterns

### P2
- additional specialized workflows
- more production-oriented builder/coding/release flows

## Runtime / integration
### P0
- fallback clarity
- health checks
- destructive action boundaries

### P1
- layout-specific install and routing guidance
- explicit permission exposure model

### P2
- richer host-specific patterns
- optional automation hooks

## Benchmark / evaluation
### P0
- trust-oriented rubric
- long-task / checkpoint coverage
- channel/tool reliability scenarios

### P1
- observability and routing scoring
- provider/auth failure scenarios

### P2
- broader production and handoff scenarios
- community-submitted benchmark evidence loop

---

# Recommended next release framing

## Near-term release theme
**Trustworthy execution and recoverability**

## Follow-up release theme
**Operational visibility and routing clarity**

## Later expansion theme
**Broader channel/product depth without losing control**
