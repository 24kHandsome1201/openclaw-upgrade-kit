# Anthropic Skill Guide Gap Review — Structure and Progressive Disclosure

This review evaluates the current `openclaw-upgrade-kit` skill system against the Anthropic skill-guide ideas the parent task highlighted:
- skill as a folder with `SKILL.md` plus supporting resources (`scripts/`, `references/`, `assets/` when needed)
- progressive disclosure across frontmatter, `SKILL.md`, and linked files
- composable resources that can be reused without assuming one skill owns the whole workflow

## Findings

### [High] Cross-skill/shared guidance still leaks outside the skill folder boundary
- **Evidence:** `skills/openclaw-runtime/SKILL.md` and `skills/openclaw-release/SKILL.md` both reference `../../docs/delegation-patterns.md` directly.
- **Impact:** This weakens skill encapsulation. A consumer reading only the skill folder cannot fully understand the runtime/release skill boundary without hopping into repo-global docs. It also makes packaging/reuse harder if one skill is copied independently.
- **Recommendation:** Move shared execution-pattern material into a skill-local or skill-shared reference location, or create a clearly documented shared-skill reference convention (for example `skills/_shared/references/`). Keep global `docs/` for maintainer docs, not required skill runtime behavior.

### [Medium] Progressive disclosure is good at the top level, but inconsistent across specialized skills
- **Evidence:** All seven skills have YAML frontmatter with `name` and `description`, and each has a `SKILL.md` plus `references/`. However, `openclaw-manus` exposes the richest layered entry (`When to use`, `Core behavior`, `Task patterns`, `transparent-execution-addendum`), while several specialized skills rely on shorter `Rules`/`References` sections and less explicit trigger framing.
- **Impact:** The system is directionally aligned with the Anthropic pattern, but the disclosure quality varies by skill. Some skills feel like fully routable products; others feel like narrower notes around a behavior lane.
- **Recommendation:** Standardize a minimum `SKILL.md` envelope across all skills: trigger/use-cases, default behavior, preferred workflow, references, and stop/ask conditions. Keep the body short, but make the layering consistent.

### [Medium] Shared cross-cutting concepts are only partially normalized
- **Evidence:** `openclaw-manus` has `references/transparent-execution-addendum.md`; runtime/release now mention the same concepts in `working-mode.md`; coding/docs/ops/research mainly carry the ideas inline inside `SKILL.md` or other references. The newly added `docs/skill-reference-taxonomy.md` acknowledges this asymmetry.
- **Impact:** Anthropic-style composability benefits from a stable mental model of what kind of file holds which kind of guidance. Right now the repo is understandable, but contributors still need repo memory to know where to place a shared concept.
- **Recommendation:** Define one shared convention for cross-cutting skill resources. Example: every skill either has a `working-mode.md` + optional `reporting/validation` docs, or points to a single shared reference family with a documented reason.

### [Medium] Skill folders are structurally clean, but skill-local automation is sparse
- **Evidence:** Each skill folder contains `SKILL.md`, `agents/openai.yaml`, and `references/`, but no skill currently has a local `scripts/` or `assets/` directory; automation lives almost entirely in top-level `scripts/`.
- **Impact:** This is not wrong, but it means the repo behaves more like a centralized framework than a set of independently portable skills. For Anthropic-style skills, local helper scripts or assets can improve portability and lower coupling.
- **Recommendation:** Keep the current centralized scripts where appropriate, but document when a helper should remain repo-global vs when it should live inside a skill folder. If future skills require bespoke helpers, prefer skill-local `scripts/` first.

### [Low] Frontmatter is present everywhere, but activation metadata is minimal
- **Evidence:** All `skills/*/SKILL.md` files use frontmatter with only `name` and `description`.
- **Impact:** This is sufficient for the current repo, but leaves less room for structured activation hints if the repo later wants richer automated routing or packaging. The information is mostly carried in prose rather than lightweight metadata.
- **Recommendation:** Only if future tooling needs it, consider adding a small optional metadata convention such as `tags`, `domain`, or `triggers`. Do not over-engineer it yet.

### [Low] The repo now has the right layered pieces, but the relationship between repo docs and skill docs should stay explicit
- **Evidence:** The project now includes `docs/skill-reference-taxonomy.md`, `docs/documentation-style-policy.md`, and multiple maintainer docs, while skills still depend mostly on `SKILL.md` + `references/`.
- **Impact:** This is healthy, but without a clear statement of “maintainer docs vs skill runtime docs,” future contributors may drift shared behavioral logic back into repo-global docs.
- **Recommendation:** Keep reinforcing this rule in maintainer docs: repository `docs/` are for maintainers and framework-level guidance; skill-local `references/` are for instructions that a skill needs at execution time.

## Applied to openclaw-upgrade-kit

`openclaw-upgrade-kit` is already **directionally aligned** with the Anthropic skill pattern:
- every skill is a folder with `SKILL.md`
- frontmatter is present
- `references/` are used heavily
- progressive disclosure exists in practice

The biggest remaining gap is **encapsulation and normalization**, not fundamentals.

In short:
- the repo does **not** need a structural rewrite
- it **does** need tighter rules for shared references, cross-skill concepts, and what belongs inside a skill folder versus top-level repo docs
