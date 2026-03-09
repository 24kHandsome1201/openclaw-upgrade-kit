# Release Checklist

Use this checklist before creating a new tagged release.

## Goal

The goal of a release is not only to publish files, but to publish a clearly improved project state.

A good release should have:
- stable documentation
- usable skills
- consistent benchmark evidence
- a clear explanation of what changed

## Repository readiness

- [ ] working tree is clean
- [ ] README reflects current project state
- [ ] skill list in README matches actual packaged skills
- [ ] major docs links resolve correctly
- [ ] roadmap status is reasonably current

## Skill readiness

- [ ] each newly added skill has a valid `SKILL.md`
- [ ] each newly added skill has focused references
- [ ] each newly added skill has `agents/openai.yaml`
- [ ] install scripts include the intended packaged skills

## Benchmark readiness

- [ ] benchmark rubric is still aligned with project goals
- [ ] at least one recent benchmark result exists for the release focus
- [ ] benchmark examples referenced in docs actually exist
- [ ] new claims in the release are supported by benchmark evidence or examples

## Documentation readiness

- [ ] installation docs match current scripts
- [ ] setup examples still reflect current repo layout
- [ ] routing and fallback docs match current skill set
- [ ] long-task / recovery docs remain internally consistent

## Packaging readiness

- [ ] `scripts/list_packaged_skills.sh` works
- [ ] `scripts/install_local_skills.sh` works
- [ ] `scripts/install_selected_skills.sh` works
- [ ] `scripts/print_version_info.sh` works

## Release note readiness

- [ ] release scope is summarized clearly
- [ ] major additions are listed accurately
- [ ] known limitations are still true
- [ ] next steps are realistic and specific

## Suggested pre-release commands

```bash
./scripts/list_packaged_skills.sh
./scripts/install_local_skills.sh /tmp/openclaw-release-test
./scripts/install_selected_skills.sh /tmp/openclaw-release-selected-test openclaw-manus openclaw-ops
./scripts/print_version_info.sh
```

## Acceptance rule

A release is ready when:
- users can understand what changed
- users can install and use the current packaged skills
- claims in docs and release notes are supported by actual repository contents
