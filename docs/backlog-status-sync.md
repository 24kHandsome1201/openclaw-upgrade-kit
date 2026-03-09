# Backlog Status Sync Helper

This document explains the lightweight backlog status reporter for `openclaw-upgrade-kit`.

## Goal

Give maintainers a quick, readable status summary from:
- `docs/research/derived/executable-backlog-from-feedback-2026-03.md`

The helper is intentionally one-way:
- it **reads** backlog metadata
- it **reports** status
- it does **not** rewrite backlog entries automatically

## Script

- `scripts/backlog_status_report.py`

## What it reads

The script looks for backlog items with fields such as:
- `状态`
- `Execution Venue`
- `Maps to`
- `Landed in`

It especially helps when items already have:
- `状态：done`
- `Landed in：<commit + files>`

## What it outputs

A short report with:
- total item count
- status counts
- execution-venue counts
- completed items and their landed commits
- items missing status or missing `Landed in` despite being marked `done`
- per-section summary (`P0 backlog`, `P1 backlog`, `P2 backlog`)

## Usage

From the repo root:

```bash
./scripts/backlog_status_report.py
```

Or point it at a specific backlog file:

```bash
./scripts/backlog_status_report.py docs/research/derived/executable-backlog-from-feedback-2026-03.md
```

## What it checks

- whether backlog items can be parsed
- whether `状态` is present
- whether `Landed in` is present for `done` items
- whether a concise section-level summary can be produced

## What it does not check

- whether the referenced commit actually exists remotely
- whether listed files were truly modified by that commit
- whether backlog content is semantically correct
- whether backlog items are fully up to date with current repo state

## Why this helper exists

The backlog was upgraded to be more execution-ready by adding:
- status
- execution venue
- traceability
- landed commit notes

This helper makes that metadata usable without turning backlog maintenance into a heavy workflow.

## Exit behavior

- `0` — parsed successfully and printed a report
- `2` — backlog file missing
- `3` — no backlog items could be parsed

## Recommended use

Use it:
- before delegating a new batch of tasks
- after landing a group of fixes
- when reviewing whether `done` items actually carry their landing notes
