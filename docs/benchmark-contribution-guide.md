# Benchmark Contribution Guide

This guide explains how contributors should submit benchmark evidence to `openclaw-upgrade-kit`.

## Goal

The goal is to make benchmark contributions:
- reproducible
- easy to compare
- easy to review
- useful for release decisions

A good benchmark contribution should help answer:
- what changed?
- what task was tested?
- what improved?
- what remains weak?

## What counts as benchmark evidence

Good benchmark evidence includes:
- a benchmark task prompt
- the compared run types
- rubric-based scoring
- concise qualitative notes
- version information
- a clear conclusion

Preferred comparison pattern:
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + relevant specialized or general skill

## Recommended submission workflow

1. choose a benchmark task from `benchmarks/tasks/` or propose a clearly scoped new task
2. run the task in the compared modes
3. score each run using `benchmarks/rubric.md`
4. record the result using `benchmarks/results/template.md`
5. include the repo version using `./scripts/print_version_info.sh`
6. submit the result as a PR with concise notes

## Required contribution fields

A benchmark contribution should include:
- task name
- exact prompt
- task type
- compared run modes
- rubric scores
- short qualitative notes
- conclusion
- repo version info

## Suggested file placement

Place result files under:
- `benchmarks/results/`

Suggested naming patterns:
- `coding-example-<short-name>.md`
- `ops-example-<short-name>.md`
- `research-example-<short-name>.md`
- `docs-example-<short-name>.md`
- `long-task-example-<short-name>.md`

## Review checklist for maintainers

Before accepting a benchmark contribution, check:
- [ ] task scope is clear
- [ ] compared runs are stated clearly
- [ ] rubric was used consistently
- [ ] qualitative notes are concise and useful
- [ ] conclusion is supported by the scores and notes
- [ ] version information is included or referenced
- [ ] the benchmark adds value beyond existing examples

## What to avoid

Avoid contributions that:
- use vague prompts without task scope
- score without showing the comparison setup
- make broad claims without qualitative notes
- duplicate existing result files with little new insight
- hide which repo version was tested

## Minimum acceptable contribution

A minimum acceptable benchmark contribution should include:
- one clear task
- three compared run modes
- completed rubric table
- at least three concise qualitative observations
- one supported conclusion

## Strong contribution signs

A strong contribution:
- covers a realistic task
- reflects actual user pain points
- includes a non-trivial comparison
- identifies both strengths and remaining weaknesses
- helps inform roadmap or release decisions
