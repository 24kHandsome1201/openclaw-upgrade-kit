# 10-Phase Roadmap

This roadmap turns `openclaw-upgrade-kit` from an initial skill pack into a more complete, verifiable upgrade framework for execution-oriented open agents.

Each phase includes a goal, scope, verifiable deliverables, acceptance criteria, and dependency notes.

---

## Current status snapshot

| Phase | Status | Notes |
| --- | --- | --- |
| Phase 1 — Foundation MVP | Done | Core positioning, Manus skill, starter examples, and benchmark baseline are in place. |
| Phase 2 — Usability and Setup | Done | Install script, setup example, and skill selection docs are present. |
| Phase 3 — Skill System Expansion | Done | Ops, research, coding, and docs specialization now exist. |
| Phase 4 — Benchmark Results Layer | Done | Result template, guide, and example result files are present. |
| Phase 5 — Coding Skill and Code-Change Validation | Done | `openclaw-coding` and coding benchmark/example materials are present. |
| Phase 6 — Documentation and Review Workflow | Done | `openclaw-docs`, docs example, and doc review materials are present. |
| Phase 7 — Distribution and Packaging | Partial | Install/list/version scripts and versioned install docs exist; packaging can still become more release-aware. |
| Phase 8 — Runtime Integration Patterns | Done | Routing patterns, default-vs-specialized guidance, and fallback policy are documented. |
| Phase 9 — State, Memory, and Long-Task Patterns | Done | Long-task patterns, checkpoint template, and resume/recovery guidance now exist. |
| Phase 10 — Validation at Scale and Community Loop | Next | The repo now has the base ingredients, but still needs explicit community benchmark/release workflows. |

## Current phase grouping

### Completed core build-out
- Phase 1 — Foundation MVP
- Phase 2 — Usability and Setup
- Phase 3 — Skill System Expansion
- Phase 4 — Benchmark Results Layer
- Phase 5 — Coding Skill and Code-Change Validation
- Phase 6 — Documentation and Review Workflow
- Phase 8 — Runtime Integration Patterns
- Phase 9 — State, Memory, and Long-Task Patterns

### In-progress support layer
- Phase 7 — Distribution and Packaging

### Next major milestone
- Phase 10 — Validation at Scale and Community Loop

## Recommended next milestone

Prioritize **Phase 10 — Validation at Scale and Community Loop** next.

Reason:
- the project already has enough skills, examples, routing rules, and long-task guidance to support broader reuse
- the biggest remaining gap is turning these assets into a repeatable community contribution and release loop
- better release/evaluation discipline will make future packaging and runtime work easier to validate

## Suggested next verifiable deliverables

For the next milestone, prefer small, reviewable artifacts such as:
- benchmark contribution guide
- release checklist tied to measurable evidence
- evaluation cadence doc
- one long-task benchmark example showing interruption -> resume -> completion

## Suggested execution order from here

1. Phase 10 community/evaluation docs
2. one long-task benchmark example
3. improved packaging/release-aware install flow
4. deeper runtime-specific integration notes if a host layout stabilizes

---

## Phase 1 — Foundation MVP

### Goal
Establish the basic project identity and ship the first usable execution-upgrade skill pack.

### Scope
- initial repository positioning
- first general-purpose skill
- first examples, benchmarks, and supporting docs

### Verifiable deliverables
- repository README and launch positioning docs
- `openclaw-manus` skill
- benchmark rubric and starter tasks
- before/after examples
- first public tag / release baseline

### Acceptance criteria
- a new visitor can understand the project from the README
- at least one skill is usable as a standalone behavior upgrade
- benchmark and example structure exists for future evaluation

### Priority / dependencies
- highest priority
- no dependency; baseline for all later phases

---

## Phase 2 — Usability and Setup

### Goal
Make the project easier to adopt locally and easier to integrate into OpenClaw-style workflows.

### Scope
- installation flow
- local skill copy/install path
- setup examples and routing guidance

### Verifiable deliverables
- local install script
- installation guide
- OpenClaw setup example
- skill selection guide

### Acceptance criteria
- a user can copy packaged skills into a target local skill directory
- setup docs show an end-to-end example flow
- users can determine when to use each existing skill

### Priority / dependencies
- high priority
- depends on Phase 1 repository structure

---

## Phase 3 — Skill System Expansion

### Goal
Expand from a single flagship skill into a small but meaningful skill system.

### Scope
- add task-specialized skills
- improve specialization without duplicating the entire framework

### Verifiable deliverables
- `openclaw-ops` skill
- `openclaw-research` skill
- updated README and usage docs reflecting skill routing

### Acceptance criteria
- at least three skills exist with clear responsibility boundaries
- each skill includes a valid `SKILL.md` and focused references
- README reflects how the skills differ from each other

### Priority / dependencies
- high priority
- depends on Phase 1; benefits from Phase 2 docs

---

## Phase 4 — Benchmark Results Layer

### Goal
Move from benchmark definitions to benchmark evidence.

### Scope
- result templates
- starter scored examples
- repeatable comparison format

### Verifiable deliverables
- benchmark results template
- at least one completed scored benchmark example per major task family over time
- benchmark-results guide

### Acceptance criteria
- contributors can record benchmark runs consistently
- at least one benchmark result demonstrates a visible upgraded-vs-base difference
- result files are easy to compare and extend

### Priority / dependencies
- high priority
- depends on Phase 1 benchmarks and Phase 3 skill coverage

---

## Phase 5 — Coding Skill and Code-Change Validation

### Goal
Add a dedicated coding-focused skill for implementation, repo cleanup, and validation-heavy development tasks.

### Scope
- coding-specific execution loop
- minimal-diff guidance
- validation patterns for build/test-driven work

### Verifiable deliverables
- `openclaw-coding` skill
- coding references for patching, validation, and repo hygiene
- coding benchmark result example

### Acceptance criteria
- coding tasks can be routed to a skill more specific than `openclaw-manus`
- the skill provides concrete validation expectations
- at least one coding benchmark shows a measurable behavior improvement

### Priority / dependencies
- medium-high priority
- depends on Phase 3 skill structure and Phase 4 benchmark format

---

## Phase 6 — Documentation and Review Workflow

### Goal
Make documentation review and doc-to-code drift handling a first-class use case.

### Scope
- docs-specific workflow patterns
- drift review checklist
- actionable review output shapes

### Verifiable deliverables
- either a dedicated `openclaw-docs` skill or expanded docs-mode references
- docs benchmark result example
- doc-review checklist or template

### Acceptance criteria
- documentation tasks can be evaluated with a repeatable checklist
- doc updates distinguish validated facts from unverified assumptions
- at least one docs benchmark example exists

### Priority / dependencies
- medium priority
- depends on Phases 3 and 4

---

## Phase 7 — Distribution and Packaging

### Goal
Make the project easier to install, share, and reuse across environments.

### Scope
- packaging improvements
- clearer installation paths
- version-aware distribution docs

### Verifiable deliverables
- improved installer or packaging script(s)
- versioned installation notes
- copy/paste integration snippets for common layouts

### Acceptance criteria
- a user can install the skills with fewer manual steps than today
- installation docs mention version expectations
- at least one integration path is close to one-command setup

### Priority / dependencies
- medium priority
- depends on Phase 2 and benefits from stable skill structure in Phase 3+

---

## Phase 8 — Runtime Integration Patterns

### Goal
Bridge the gap between skill design and runtime behavior inside real agent environments.

### Scope
- routing patterns
- fallback rules
- recommendations for how skills should activate inside the host runtime

### Verifiable deliverables
- runtime integration guide(s)
- skill routing examples
- decision trees for choosing default vs specialized skill paths

### Acceptance criteria
- integration docs show how to route tasks to the right skill
- the project documents when to use general vs specialized behavior
- runtime guidance goes beyond static file copying

### Priority / dependencies
- medium priority
- depends on stable skill coverage from Phases 3–6

---

## Phase 9 — State, Memory, and Long-Task Patterns

### Goal
Define how the upgrade kit should evolve for long-running execution-oriented tasks.

### Scope
- task state patterns
- progress checkpoints
- recovery / resume recommendations

### Verifiable deliverables
- state-management design notes
- long-task reporting templates
- recovery / resume workflow guidance

### Acceptance criteria
- the repo documents how to preserve progress across longer tasks
- checkpointing and status updates are described consistently
- at least one example demonstrates a long-task workflow

### Priority / dependencies
- medium-lower priority
- depends on mature reporting patterns and runtime integration work

---

## Phase 10 — Validation at Scale and Community Loop

### Goal
Turn the project into a living upgrade framework that improves through repeated testing and community contribution.

### Scope
- more benchmark results
- contributor workflows
- release cadence and evaluation discipline

### Verifiable deliverables
- multiple benchmark result examples across task categories
- contributor guidance for submitting benchmark evidence
- release checklist tied to measurable upgrade progress

### Acceptance criteria
- contributors can add new benchmark evidence without guessing the format
- release decisions are tied to demonstrated behavior improvements
- the repo shows a repeatable improvement loop rather than one-off docs growth

### Priority / dependencies
- ongoing / long-term
- depends on Phases 4–9

---

## Suggested priority order

### Immediate / current focus
1. Phase 8 — Runtime Integration Patterns
2. Phase 7 — Distribution and Packaging
3. Phase 10 — Validation at Scale and Community Loop

### Longer-term framework work
4. Phase 9 — State, Memory, and Long-Task Patterns

## Working rule

For each phase, prefer small, reviewable, verifiable deliverables over broad speculative rewrites.
