# Packaging Plan

This document outlines the near-term packaging direction for `openclaw-upgrade-kit`.

## Current packaging state

Current distribution is repo-based:
- clone the repository
- install all skills or selected skills with shell scripts
- follow docs for routing and benchmark usage

## Current packaging assets

- `scripts/install_local_skills.sh`
- `scripts/install_selected_skills.sh`
- `scripts/list_packaged_skills.sh`
- `scripts/print_version_info.sh`
- `scripts/install_from_tag.sh`
- `scripts/create_release_archive.sh`
- installation and setup docs

## Phase 7 goals

Phase 7 focuses on:
- fewer manual installation steps
- version-aware setup
- clearer integration snippets
- predictable local packaging behavior

## Recommended next packaging steps

### 1. Keep repo-based installation as the default
This is the simplest and most transparent path right now.

### 2. Add version-aware setup guidance
Users should know when to use tags vs `master`.

### 3. Support selective installation
This reduces clutter for users who only want one or two skills.

### 4. Keep scripts small and transparent
Simple shell scripts are easy to audit and adapt.

## Possible future packaging paths

- optional one-command bootstrap script
- release archives with packaged skill folders
- runtime-specific installers for known OpenClaw layouts
- manifest-based installation if the host runtime matures

## Packaging acceptance targets

A strong packaging phase should make it possible to:
- list packaged skills
- install all skills quickly
- install selected skills only
- identify the installed repo version
- install skills from an existing local tag
- create a simple release archive from a tag or ref
- follow a documented stable-install path using tags
