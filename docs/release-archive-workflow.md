# Release Archive Workflow

This document explains how to create and use simple release archives for `openclaw-upgrade-kit`.

## Goal

Provide a transparent, low-friction way to package a tagged or branch-based snapshot of the repository.

## Included scripts

- `scripts/install_from_tag.sh`
- `scripts/create_release_archive.sh`

## 1. Install skills directly from a local tag

Install all packaged skills from a tag into a target directory:

```bash
./scripts/install_from_tag.sh v0.1.1 ~/.codex/skills
```

Install only selected skills from a tag:

```bash
./scripts/install_from_tag.sh v0.1.1 ~/.codex/skills openclaw-manus openclaw-ops
```

### Inputs
- git tag
- target skill directory
- optional skill names

### Outputs
- copied skill folders under the target directory

### Limitations
- the tag must already exist in the local repository
- this workflow does not fetch remote tags automatically
- installation copies skill folders only; it does not modify runtime config

## 2. Create a release archive

Create a tar.gz archive for a ref:

```bash
./scripts/create_release_archive.sh v0.1.1
```

Or choose a custom output directory:

```bash
./scripts/create_release_archive.sh v0.1.1 /tmp/release-out
```

### Inputs
- tag or git ref
- optional output directory

### Outputs
- `openclaw-upgrade-kit-<ref>.tar.gz`

### Limitations
- this creates a repository snapshot archive, not an installer bundle
- users still need to unpack it and run the install scripts manually if desired

## Suggested release flow

1. verify release readiness with `docs/release-checklist.md`
2. confirm the target tag exists
3. create the archive with `scripts/create_release_archive.sh`
4. optionally smoke test install-from-tag with `scripts/install_from_tag.sh`
5. publish the tag and attach the generated archive if desired

## Suggested smoke tests

```bash
./scripts/install_from_tag.sh v0.1.1 /tmp/openclaw-from-tag-test
./scripts/create_release_archive.sh v0.1.1 /tmp/openclaw-release-archive-test
```
