# Anthropic Skill Guide Gap Review: Composability, Boundaries, and Skill Overlap

## Scope

This review checks the current `openclaw-upgrade-kit` skill system against three boundary-related ideas emphasized in Anthropic's official skill-building guidance:

- skills should be composable rather than isolated or mutually exclusive
- use cases should be defined before the skill body expands
- boundaries between a general skill and specialized skills should stay explicit

Primary review targets:
- `README.md`
- `docs/skill-selection-guide.md`
- `docs/runtime-routing-patterns.md`
- `docs/skill-reference-taxonomy.md`
- `skills/openclaw-*/SKILL.md`

Reviewed skills:
- `openclaw-manus`
- `openclaw-ops`
- `openclaw-research`
- `openclaw-coding`
- `openclaw-docs`
- `openclaw-runtime`
- `openclaw-release`

---

## Findings

### [High] `openclaw-manus` still overlaps heavily with most specialized skills at the use-case level
**Evidence:**
- `skills/openclaw-manus/SKILL.md` says to use the skill for investigating problems, inspecting code/files/logs, fixing or improving a project, running commands, performing multi-step research, troubleshooting services or deployments, and reviewing documentation or repository state.
- Those same areas are then claimed more narrowly by:
  - `skills/openclaw-ops/SKILL.md`
  - `skills/openclaw-research/SKILL.md`
  - `skills/openclaw-coding/SKILL.md`
  - `skills/openclaw-docs/SKILL.md`
- `docs/skill-selection-guide.md` and `docs/runtime-routing-patterns.md` explain the switch logic, but the general skill itself still presents a very broad front door.

**Impact:**
- The system is usable, but the boundary is still clearer in routing docs than in the skill bodies themselves.
- A reader who opens `openclaw-manus` first can reasonably conclude that the specialized skills are optional refinements rather than primary lanes.
- This weakens Anthropic-style specialization because the general skill remains semantically wide enough to absorb most tasks.

**Recommendation:**
- Keep `openclaw-manus` as the default general skill, but tighten its scope statement.
- Add one short boundary block in `openclaw-manus` that explicitly says: use this skill to start mixed or unclear tasks; hand off to specialized skills once a lane dominates.
- Add a one-line handoff summary naming `ops`, `research`, `coding`, `docs`, `runtime`, and `release` as preferred dominant lanes.

### [High] There is no single canonical boundary matrix covering all 7 skills, primary lane, handoff trigger, and fallback target
**Evidence:**
- `README.md` has a skills matrix.
- `docs/skill-selection-guide.md` has a chooser.
- `docs/runtime-routing-patterns.md` has routing rules and mixed-task patterns.
- But no single page provides one compact canonical table with columns such as: primary use case, dominant evidence source, when to switch in, when to switch out, and fallback target.

**Impact:**
- The information exists, but it is distributed across multiple docs.
- Composability is documented as prose rather than as a compact operational contract.
- Delegated maintainers or future subagents are more likely to interpret boundaries differently and reintroduce overlap drift.

**Recommendation:**
- Add one canonical boundary matrix document or section and treat it as the primary routing contract.
- Minimum useful columns:
  - skill
  - primary task shape
  - dominant evidence source
  - switch-in signal
  - switch-out signal
  - default fallback
- Then make `README`, `skill-selection-guide`, and `runtime-routing-patterns` point to that canonical table instead of each being partially authoritative.

### [Medium] `openclaw-runtime` and `openclaw-release` are conceptually clear, but still read more like support-doc domains than fully stabilized skill lanes
**Evidence:**
- `skills/openclaw-runtime/SKILL.md` clearly says it should not be the primary worker for coding, ops, research, or docs tasks.
- `skills/openclaw-release/SKILL.md` clearly frames release gating and dry-run work as its lane.
- However, both rely heavily on repo-level docs for meaning and are less obviously grounded in repeated benchmarked workflows than the domain skills.
- `README.md` and `docs/skill-selection-guide.md` label them as advanced or support-specialized skills rather than first-line skills.

**Impact:**
- Their boundaries are not badly defined, but their role in the overall skill taxonomy can still feel secondary or infrastructural.
- This creates mild ambiguity about whether they are true skills, meta-skills, or documentation wrappers around routing/release process.

**Recommendation:**
- Keep both skills; do not merge them back into `openclaw-manus`.
- Strengthen them by making their benchmark or validation story more explicit.
- Add clearer “entry condition / exit condition” phrasing in each skill so they read as stable lanes rather than only advanced support notes.

### [Medium] Use-case-first design is present repo-wide, but the per-skill trigger boundary is not equally explicit across all skill bodies
**Evidence:**
- `docs/skill-selection-guide.md` is strongly use-case-first.
- `docs/runtime-routing-patterns.md` is also use-case-first.
- But skill bodies vary in how sharply they distinguish:
  - “use this skill when…”
  - “do not use this skill when…”
  - “hand off when…”
- `openclaw-runtime` does this well.
- `openclaw-release` does this fairly well.
- `openclaw-manus`, `openclaw-coding`, `openclaw-docs`, `openclaw-ops`, and `openclaw-research` are less symmetrical about explicit handoff-out rules.

**Impact:**
- The repo-level routing model is stronger than the local skill-level trigger contracts.
- This increases the chance that future edits expand individual skills opportunistically and create overlap drift.

**Recommendation:**
- Standardize a short boundary stanza in every `SKILL.md`:
  - use this skill when
  - do not use this skill when
  - hand off when
  - fall back to
- This would improve composability without forcing all skills into identical full templates.

### [Medium] Mixed-task routing is well described, but multi-skill composition is still explained mainly as sequential switching rather than explicit cooperative composition
**Evidence:**
- `docs/runtime-routing-patterns.md` provides patterns like Research -> Coding, Ops -> Coding, Docs -> Coding, Manus -> Runtime, and Manus -> Release.
- `docs/skill-selection-guide.md` emphasizes switching when one lane dominates.
- `docs/skill-reference-taxonomy.md` helps maintainers navigate reference types, but does not define composition semantics between skills.

**Impact:**
- Current routing supports sequential composition well.
- Anthropic-style composability usually benefits from a clearer story for nested, delegated, or scoped subtask composition.
- Without that, the system may remain understandable for humans but less mechanically reusable for agent-to-agent handoff design.

**Recommendation:**
- Keep the current sequential routing model as the default.
- Add one short composition note describing two supported composition modes:
  - sequential handoff
  - scoped delegated subtask
- Link that to the existing delegation material so composability is not interpreted only as “switch and replace.”

### [Low] Skill taxonomy is mostly clear, but the distinction between domain skills and meta-skills is implied rather than named
**Evidence:**
- Domain skills: `ops`, `research`, `coding`, `docs`
- General skill: `manus`
- Meta/support skills: `runtime`, `release`
- The distinction appears in practice across `README.md`, `docs/skill-selection-guide.md`, and `skills/openclaw-runtime/SKILL.md`, but there is no explicit top-level taxonomy label set.

**Impact:**
- Most maintainers will infer the model correctly.
- But explicit naming would reduce future overlap and make the system easier to explain to contributors.

**Recommendation:**
- Add an explicit three-layer taxonomy somewhere canonical:
  - general execution skill
  - domain-specialized skills
  - support/meta skills
- This is a clarity improvement, not an urgent structural fix.

### [Low] The current reference taxonomy explains file roles well, but not which skill owns which boundary decision
**Evidence:**
- `docs/skill-reference-taxonomy.md` is strong on reference discovery: working mode, reporting, validation, examples, and skill-specific operating knowledge.
- It does not define boundary ownership such as who decides fallback, who decides release readiness, or who owns routing once a task becomes mixed again.

**Impact:**
- File discovery is easier than before.
- Boundary ownership still depends on reading multiple skill docs together.

**Recommendation:**
- Extend the taxonomy very lightly with a “boundary ownership” note for each skill family.
- Keep it short; this does not require a new framework.

---

## Overall judgment

### Composability
Good enough to be credible, but still stronger at the documentation-routing layer than at the individual skill boundary layer.

### Boundaries
Mostly clear at the repo level, still partially blurry inside `openclaw-manus` and in the handoff-out contracts of several specialized skills.

### Skill overlap
Manageable, but the largest overlap remains between `openclaw-manus` and the four main domain skills (`ops`, `research`, `coding`, `docs`).

### Routing explanation
Reasonably mature. The main gap is not missing routing logic; it is lack of one canonical boundary contract.

### Taxonomy clarity
Adequate, with room to make the general/domain/meta distinction more explicit.

---

## Final recommendation

### Should the repo continue splitting skills?
**Not yet.**
There is not strong evidence that the current 7-skill set should be split further before boundary documentation is tightened.

### Should any skills be merged?
**No immediate merge recommended.**
`openclaw-runtime` and `openclaw-release` should remain separate because they encode real support-specialized lanes.

### Best next move
**Primarily strengthen routing and boundary documentation.**

Recommended order:
1. tighten `openclaw-manus` handoff language
2. add one canonical skill boundary matrix
3. standardize a short “use / do not use / hand off / fall back” block across all skills
4. clarify general vs domain vs support/meta taxonomy in one canonical doc

## Bottom line
The current system does **not** need a skill split wave or a merge wave first.
It needs a clearer, more canonical boundary contract so the existing skills compose more predictably.
