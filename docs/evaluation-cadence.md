# Evaluation Cadence

This document defines a lightweight evaluation rhythm for `openclaw-upgrade-kit`.

## Goal

The goal is to make project progress measurable over time instead of relying on one-off intuition.

## Cadence model

Use three layers of evaluation:

### 1. Change-level checks
Run these whenever a meaningful change lands:
- verify touched docs still match repo structure
- verify affected scripts still work
- verify touched examples or benchmark references still exist

### 2. Milestone-level checks
Run these before tagging a release:
- compare current release focus against at least one relevant benchmark result
- verify install and packaging scripts
- verify README and key docs reflect current state

### 3. Periodic health review
Run this on a regular basis, for example every few weeks or before a larger public push:
- review roadmap status
- identify weak benchmark coverage
- identify skill gaps
- identify stale examples or docs

## Suggested periodic review checklist

- [ ] does the roadmap still reflect the real project state?
- [ ] do current benchmark results cover the major task families?
- [ ] are there missing benchmark examples for newer skills?
- [ ] are install and routing docs still accurate?
- [ ] is the release story supported by evidence?

## Good cadence signals

A good cadence means:
- documentation does not drift far behind implementation
- benchmark evidence grows alongside skills
- releases are tied to demonstrated progress
- stale materials are noticed and corrected

## Poor cadence signals

A weak cadence often looks like:
- many new files without benchmark coverage
- outdated setup docs after packaging changes
- release claims that are not supported by examples or results
- roadmap status lagging behind actual repo state

## Minimal operating rule

For each meaningful project phase, try to add at least one of these:
- a benchmark result
- a setup/integration validation
- a release-readiness check

This keeps the project grounded in verifiable progress.
