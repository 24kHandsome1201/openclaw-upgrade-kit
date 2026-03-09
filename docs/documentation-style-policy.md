# Documentation Style Policy

This file defines the default documentation style for `openclaw-upgrade-kit`.

The goal is not to rewrite every existing document immediately.
The goal is to give future edits a consistent direction.

## 1. Primary language strategy

### Default rule
- Use **English** for shared project documentation by default.
- This includes:
  - `README.md`
  - install/setup docs
  - routing/runtime docs
  - release/process docs
  - benchmark and contribution docs

### Why
The repository is public-facing and designed for broader reuse.
English should remain the default language for cross-project readability.

## 2. When mixed Chinese + English is acceptable

Mixed language is allowed when one of these is true:
- a document captures internal planning history or fast-moving working notes
- a section benefits from preserving short Chinese labels for a current workflow
- a translated clarification is genuinely useful and kept brief

### Rules for mixed language usage
- Keep the **main structure language consistent** inside one document.
- Do not alternate languages sentence by sentence unless necessary.
- If Chinese labels are used inside an otherwise English doc, keep them limited to compact field labels or notes.
- Prefer one primary language plus short secondary-language clarification, not two full parallel versions in the same section.

## 3. Titles and headings

### Default heading style
- Use concise English headings.
- Prefer noun phrases or short action phrases.
- Keep heading depth shallow unless the document truly needs more structure.

Good:
- `## Goal`
- `## Recommended workflow`
- `## Release boundary`

Avoid:
- very long conversational headings
- mixing multiple naming styles in one file
- switching between title case and sentence case randomly

### Recommended convention
- File title: sentence case or simple title phrase
- Section headings: short, direct, and stable

## 4. Field and template style

When using repeated fields, keep labels stable.

Preferred reusable field set:
- Goal
- Plan
- Progress
- Validation
- Next step
- Risks / blockers

For research or evaluation documents, also use:
- Evidence
- Impact
- Recommendation
- Verdict

For backlog or planning docs, prefer:
- Priority
- Status
- Execution venue
- Maps to
- Landed in

## 5. Path and command formatting

- Use backticks for repo-relative file paths and commands.
- Prefer **real file paths** over wildcard placeholders when pointing readers to concrete files.
- If a pattern is only illustrative, say so in plain text instead of pretending it is a literal path.

Good:
- `docs/runtime-routing-patterns.md`
- `./scripts/install_local_skills.sh ~/.codex/skills`

Avoid when a real path is expected:
- wildcard placeholders such as examples/*.md in literal examples should be avoided in real repo references
- broad recursive placeholders such as skills/<skill>/references/ or recursive globs should be described in plain text instead of presented as a literal target path

## 6. Tone

Default tone should be:
- operational
- explicit
- low-hype
- reviewable

Avoid:
- marketing-heavy claims in technical docs
- overstating guarantees
- vague phrases without an action or verification angle

## 7. Versioned documents

For versioned release docs:
- state clearly whether the file describes a tagged release or current `master`
- avoid implying that historical release notes automatically describe current HEAD
- prefer a short boundary note near the top of the file

## 8. Documentation update policy

When adding a new document, also check whether it should be linked from:
- `README.md`
- a relevant docs map section
- a maintainer/development reading path
- a related skill or integration guide

A useful document that is not discoverable is still incomplete.

## 9. Practical migration rule

Do **not** pause normal work to rewrite the entire repo for style consistency.

Instead:
- apply this policy to new docs
- clean touched docs when you are already editing them
- fix high-confusion style drift first
- treat older mixed-language planning docs as acceptable until they need active maintenance

## 10. Success criteria

This policy is working well when:
- new docs are easier to scan
- repeated fields use stable labels
- readers can trust file paths and commands
- release/process docs clearly state their scope
- mixed-language usage feels intentional rather than accidental
