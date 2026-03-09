# Release Plan v0.1.1

## Version

`v0.1.1`

## Release intent

First expansion release after the initial MVP.

The goal of this release is to package the project's growth from:
- a small execution-upgrade skill pack

into:
- a broader skill system
- a more evidence-backed benchmark framework
- a more practical packaging/runtime documentation toolkit
- a more release-aware open-agent project

## Proposed release title

`v0.1.1 - Skills, routing, packaging, and evaluation expansion`

## Proposed release summary

`v0.1.1` expands `openclaw-upgrade-kit` with new specialized skills, richer benchmark examples, packaging/runtime integration guidance, long-task continuity patterns, and community/release evaluation docs.

## Scope

### Skills
- `openclaw-research`
- `openclaw-coding`
- `openclaw-docs`

### Benchmark and evaluation
- benchmark result examples for coding / ops / docs / long-task
- benchmark contribution guide
- evaluation cadence guidance
- release checklist improvements

### Packaging and runtime
- selective install / list / version scripts
- tag-based install support
- release archive workflow
- runtime routing patterns
- manual routing playbook
- runtime integration examples

### Long-task support
- long-task patterns
- checkpoint template
- resume / recovery guide
- long-task example

## Recommended release checklist focus

Before tagging `v0.1.1`, verify:
- README reflects the current skill set and doc map
- install/list/version scripts work as documented
- tag/archive workflows work as documented
- benchmark result examples referenced by docs actually exist
- routing docs and integration docs remain internally consistent
- release notes match the real repository contents

## Suggested pre-release verification commands

```bash
./scripts/list_packaged_skills.sh
./scripts/install_local_skills.sh /tmp/openclaw-v011-all
./scripts/install_selected_skills.sh /tmp/openclaw-v011-selected openclaw-manus openclaw-ops openclaw-research
./scripts/print_version_info.sh
./scripts/install_from_tag.sh v0.1.0 /tmp/openclaw-v011-from-tag
./scripts/create_release_archive.sh HEAD /tmp/openclaw-v011-archive
```

## Suggested release artifacts

- Git tag: `v0.1.1`
- GitHub release title: `v0.1.1 - Skills, routing, packaging, and evaluation expansion`
- Release notes source: `docs/release-notes-v0.1.1.md`

## Known release risks

- README may need one more pass to keep pace with the growing docs tree
- packaging automation is stronger than before, but still not host-specific
- some future automation helpers may land after this release and should not be claimed early

## Notable difference from v0.1.0

`v0.1.0` established the MVP.
`v0.1.1` should be positioned as the release that makes the project feel like a broader upgrade framework rather than only an initial skill drop.
