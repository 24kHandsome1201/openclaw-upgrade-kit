# Benchmark Results Guide

Use this guide to record benchmark outcomes in a consistent way.

## Purpose

The goal is to make behavioral improvement visible and reviewable.

## Recommended workflow

1. choose one benchmark task
2. run it with base OpenClaw
3. run it with a generic prompt
4. run it with the relevant skill
5. score all three using `benchmarks/rubric.md`
6. record the result using `benchmarks/results/template.md`

## Current examples

- `benchmarks/results/research-example.md`
- `benchmarks/results/research-pricing-spec-change-example.md`
- `benchmarks/results/research-api-docs-verification-example.md`
- `benchmarks/results/coding-example.md`
- `benchmarks/results/coding-build-failure-example.md`
- `benchmarks/results/coding-ci-config-failure-example.md`
- `benchmarks/results/coding-small-refactor-example.md`
- `benchmarks/results/coding-flaky-test-example.md`
- `benchmarks/results/ops-example.md`
- `benchmarks/results/ops-conflict-example.md`
- `benchmarks/results/ops-misconfig-example.md`
- `benchmarks/results/ops-webhook-misconfig-example.md`
- `benchmarks/results/ops-stale-process-example.md`
- `benchmarks/results/docs-example.md`
- `benchmarks/results/docs-architecture-consistency-example.md`
- `benchmarks/results/docs-onboarding-setup-example.md`
- `benchmarks/results/long-task-example.md`

## Recommendation

When writing benchmark results, also note whether the run made these trust-first aspects visible:
- `docs/channel-health-model.md` style state separation for channel/runtime incidents
- `docs/provider-error-taxonomy.md` style root-cause labeling for model/provider failures
- `docs/touched-scope-reporting.md` style scope visibility for what was and was not touched

As the repo grows, keep one result file per benchmark category:
- coding
- coding / build-failure
- coding / small-refactor
- coding / ci-config-failure
- coding / flaky-test
- ops
- ops conflict / misconfiguration
- ops / webhook-misconfiguration
- ops / stale-process-cleanup
- research
- research / api-docs-verification
- research / pricing-spec-change
- docs
- docs / onboarding-setup
- docs / architecture-consistency
- long-task / resume
