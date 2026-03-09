# Anthropic Skill Guide Gap Report for openclaw-upgrade-kit

_Date: 2026-03-09_

This report consolidates three focused reviews of `openclaw-upgrade-kit` against the most relevant ideas from Anthropic's official skill-building guidance.

Primary source references:
- Anthropic PDF: `The Complete Guide to Building Skills for Claude`
- Anthropic docs on multishot prompting
- Anthropic docs on chain prompts
- Anthropic Claude best practices

## What Anthropic emphasizes that matters here

The most relevant themes for this repository are:
- skills should be well-scoped folders with `SKILL.md` and supporting resources
- progressive disclosure should be intentional across frontmatter, `SKILL.md`, and linked references
- skills should compose cleanly rather than fight each other
- examples should be relevant, structured, and varied
- complex workflows should isolate weak steps
- testing and success criteria should be explicit enough to support iteration

## Overall judgment

`openclaw-upgrade-kit` is already directionally aligned with the Anthropic skill model.

What is already strong:
- every skill is a real folder with `SKILL.md`
- `references/` are used heavily
- progressive disclosure exists in practice
- skills now have clearer routing and taxonomy than before
- examples, before/after artifacts, and benchmark materials already exist

What is still weak:
- some shared guidance still leaks outside skill-local boundaries
- the general skill still overlaps too broadly with specialized skills
- benchmark results are not reproducible enough to support stronger claims
- specialized skills like `runtime` and `release` still have thinner example/test coverage
- cross-cutting concepts are only partially normalized

## Priority findings

### P0

#### 1. Skill boundary contract is still too implicit
- `openclaw-manus` still overlaps heavily with `ops`, `research`, `coding`, and `docs` at the use-case level.
- There is no single canonical boundary matrix covering:
  - skill
  - primary task shape
  - dominant evidence source
  - switch-in signal
  - switch-out signal
  - fallback target

**Why this matters:** Anthropic-style composability works best when general and specialized skills have obvious handoff boundaries.

**Recommended fix:**
- add one canonical skill boundary matrix
- tighten `openclaw-manus` to explicitly say it starts mixed tasks and hands off once a lane dominates
- standardize a short `use / do not use / hand off / fall back` block across all skills

#### 2. Benchmark evidence is still weaker than it looks
- current benchmark result files summarize conclusions well
- but they usually do not preserve enough run metadata or raw evidence to make the result reproducible

**Why this matters:** Anthropic-style iteration depends on being able to isolate weak steps and verify that improvements are real.

**Recommended fix:**
- upgrade `benchmarks/results/template.md`
- require run metadata, prompt/output excerpt, validation artifact, and scorer notes

### P1

#### 3. Shared skill guidance is not fully encapsulated
- some skills still depend on repo-global docs for behavior that feels execution-critical
- cross-cutting concepts like transparent execution, reporting, validation, and blocked-state are present, but not normalized enough

**Recommended fix:**
- define a clear line between:
  - repo-maintainer docs
  - skill-runtime references
- consider a shared skill-reference convention if repo-global guidance must be reused

#### 4. Specialized skill examples are thinner than the general skill examples
- `openclaw-manus` has the richest example set
- `runtime` and `release` are now real skills, but still lack equally explicit example artifacts

**Recommended fix:**
- add at least:
  - one `openclaw-runtime` example
  - one `openclaw-release` example
  - one multi-skill handoff example

#### 5. Weak-step isolation is still incomplete in benchmark design
- routing
- blocked-state quality
- rollback-path quality
- fact vs inference separation
- release-readiness review

These are all central to the repo now, but they are not yet first-class benchmark tasks.

**Recommended fix:**
- add benchmark tasks or benchmark subtask templates for those weak-step lanes

### P2

#### 6. Skill-local structure is good, but helper placement policy is still implicit
- top-level scripts are increasingly strong
- skill-local `scripts/` and `assets/` are still mostly absent

**Recommended fix:**
- document when helpers belong in top-level `scripts/` vs inside a skill folder

#### 7. Activation metadata is minimal
- current frontmatter is enough for humans
- but may be too thin for future automated routing or packaging tools

**Recommended fix:**
- only if needed later, consider lightweight optional metadata such as tags/domain/triggers

## Recommended next moves

### Highest-value next 3 actions

1. **Add a canonical skill boundary matrix**
   - one source of truth for skill boundaries and handoffs

2. **Make benchmark results reproducible**
   - strengthen result template with evidence and metadata

3. **Add specialized example coverage**
   - `runtime`
   - `release`
   - one multi-skill handoff case

## Recommended implementation order

### Batch A
- canonical boundary matrix
- tighter `openclaw-manus` handoff wording
- short boundary stanza in each skill

### Batch B
- stronger benchmark result template
- routing/release/blocked/rollback benchmark tasks
- reproducibility notes in benchmark docs

### Batch C
- specialized examples for runtime/release
- multi-skill handoff example
- small normalization pass for shared references

## Bottom line

Anthropic's guidance does **not** suggest that this repo needs a rewrite.
It suggests that the repo is already on the right track, but should now focus on:
- stronger boundary contracts
- stronger reproducibility
- stronger specialization examples
- stronger normalization of shared concepts

That means the next stage should be refinement, not reinvention.
