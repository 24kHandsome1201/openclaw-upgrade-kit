# Anthropic Skill Guide Gap Review — Examples / Testing / Success Criteria

Scope: compare the current `openclaw-upgrade-kit` repository against the Anthropic official guidance themes most relevant to skill quality:
- examples/few-shot should be relevant, diverse, and structured
- complex tasks should be chained so weak steps can be isolated
- success criteria and testing/iteration should be clear and reviewable

This review is based on the current repo contents, especially:
- `skills/openclaw-manus/references/examples.md`
- `examples/before-after-*.md`
- `benchmarks/rubric.md`
- `benchmarks/tasks/*.md`
- `benchmarks/results/*.md`
- `docs/benchmark-results-guide.md`

---

## Findings

### [High] Benchmark results are presented like evaluation evidence, but they are not yet reproducible enough to support strong claims
**Evidence:**
- `benchmarks/results/template.md` records scores and qualitative notes, but does not require prompt transcript, tool output excerpt, run metadata, or artifact references.
- Many concrete result files (for example `benchmarks/results/coding-example.md`, `benchmarks/results/ops-example.md`, `benchmarks/results/research-example.md`, `benchmarks/results/docs-example.md`) follow the same score pattern (`5 / 11 / 17`) and provide summary judgments without linking to raw run evidence.
- `docs/benchmark-results-guide.md` explains how to score runs, but does not require preserving the compared outputs.

**Impact:**
The repository looks benchmark-driven, but outside readers cannot reliably reproduce or audit the benchmark claims. That weakens the credibility of “improvement” as the project scales.

**Recommendation:**
Upgrade the benchmark result contract so each result records at least:
- exact prompt used
- model/runtime context
- short transcript or output excerpt for each compared run
- any validation command or artifact used
- scorer notes explaining non-obvious scores

---

### [Medium] Example coverage is strong for general operator behavior, but still too concentrated in `openclaw-manus`
**Evidence:**
- `skills/openclaw-manus/references/examples.md` contains the main few-shot set.
- Top-level examples currently cover only four before/after comparisons: `examples/before-after-coding.md`, `examples/before-after-ops.md`, `examples/before-after-research.md`, `examples/before-after-docs.md`.
- There is no equivalent before/after example specifically for `openclaw-runtime` or `openclaw-release`, even though both are now first-class skills.
- `openclaw-coding`, `openclaw-ops`, `openclaw-runtime`, and `openclaw-release` rely more on rules/references than on explicit, skill-local examples.

**Impact:**
The repo explains the generic operator pattern well, but gives weaker example coverage for specialized lanes. That makes skill boundaries harder to internalize and harder to evaluate independently.

**Recommendation:**
Add at least one focused example or before/after artifact for:
- `openclaw-runtime` (routing / fallback / handoff)
- `openclaw-release` (release-readiness / dry-run / evidence packaging)
- one multi-skill handoff case where the task shifts from `manus` to a specialized skill and back

---

### [Medium] Weak-step isolation exists conceptually, but not enough in the benchmark design itself
**Evidence:**
- The repo has many subtype result files (build failure, flaky test, runbook drift, webhook misconfig, pricing/spec drift), which is good.
- But `benchmarks/tasks/` still only has four generic task files: `coding.md`, `docs.md`, `ops.md`, `research.md`.
- Important weak-step concepts now central to the repo — blocked state, rollback path, routing decision quality, touched-scope visibility, fact-vs-inference discipline — are only partially reflected in benchmark tasks.
- There is no dedicated benchmark task for `release` or `runtime`, despite those being packaged skills.

**Impact:**
The repository is good at testing broad domains, but weaker at testing the exact failure-prone substeps Anthropic-style iteration usually wants isolated. This makes it harder to improve the most fragile behavior deliberately.

**Recommendation:**
Add benchmark tasks or subtask templates specifically for:
- routing / fallback choice
- release-readiness review
- blocked-but-useful response quality
- rollback-path quality
- fact / inference / unvalidated separation

---

### [Medium] Success criteria exist in several places, but they are not yet unified into a single testable acceptance model
**Evidence:**
- `skills/openclaw-manus/SKILL.md` has a `Success criteria` section.
- `skills/openclaw-manus/references/task-patterns.md` defines success criteria by mode.
- `docs/documentation-style-policy.md` and `docs/skill-reference-taxonomy.md` also talk about success criteria in broader ways.
- `benchmarks/rubric.md` scores six dimensions, but does not define a required passing threshold for a skill, a benchmark family, or a release candidate.

**Impact:**
The repo has many “what good looks like” statements, but no single acceptance model that says when a skill, example set, or benchmark family is considered good enough. That weakens iteration discipline.

**Recommendation:**
Define one compact acceptance layer such as:
- minimum benchmark score threshold for “ready” examples
- mandatory dimensions for every specialized skill
- a release-facing rule for when benchmark evidence is strong enough to claim improvement

---

### [Low] Examples are structured, but the diversity of failure/negative examples is still limited
**Evidence:**
- `skills/openclaw-manus/references/examples.md` includes a good blocked example and fact/inference wording notes.
- Most examples still focus on “good response shape” rather than contrasting with realistic bad outputs or common failure patterns.
- The before/after examples are concise and useful, but they are mostly summary-style, not transcript-style.

**Impact:**
This is not a blocker, but it means examples currently teach target behavior better than they teach error avoidance. For agent skills, both are valuable.

**Recommendation:**
Add a small set of “anti-pattern / corrected-pattern” examples for:
- speculative debugging
- over-broad edits
- silent fallback to advice-only mode
- release verdict without enough evidence

---

## Open Questions

- Should `openclaw-runtime` and `openclaw-release` be benchmarked as first-class benchmark families, or kept as support skills evaluated indirectly through mixed-task runs?
- Does the repo want benchmark results to remain illustrative, or should they evolve into auditable evidence bundles?

---

## Release Readiness Verdict

- **Verdict:** Pass with Risks
- **Score:** 84
- **Blockers:**
  - No immediate “No-Go” blocker for the repo as documentation.
  - The main risk is that benchmark/results material currently looks more empirical than it really is, because reproducibility requirements are still light.

---

## Optional change summary

The current repo already does a lot right:
- examples are structured
- benchmark coverage is broad across domains
- before/after materials exist
- success criteria language appears in multiple core documents

The main gap versus Anthropic-style skill iteration is not “missing examples.”
It is:
1. stronger reproducibility for benchmark evidence
2. better weak-step isolation in benchmark tasks
3. more specialized example coverage for runtime/release and multi-skill handoffs

---

## Top 3 testing / example improvements to prioritize

1. **Make benchmark results reproducible**
   - extend `benchmarks/results/template.md` to require transcript/output evidence, validation artifacts, and run metadata

2. **Add benchmark tasks for weak-step isolation**
   - create focused tasks for routing, release-readiness, blocked-state quality, rollback-path quality, and fact-vs-inference separation

3. **Add specialized examples beyond `openclaw-manus`**
   - especially `openclaw-runtime`, `openclaw-release`, and at least one multi-skill handoff example
