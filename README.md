# openclaw-upgrade-kit

Upgrade OpenClaw from a chat assistant into a more execution-oriented agent.

**You only need to tell your agent how to work.**

`openclaw-upgrade-kit` is a modular skill and policy layer for making OpenClaw-style agents more planning-first, tool-first, evidence-based, and delivery-oriented.

It is designed for both:
- **agents** — to follow clearer execution behavior
- **humans** — to define how their agents should investigate, act, verify, and deliver

It is **not** a prompt dump, a leaked-system-prompt mirror, or an official clone of any closed product.

Instead, it is a practical, reusable upgrade layer for making open agents more capable in real tasks.

## Why

Most open agents can answer questions.

Far fewer can reliably:

- plan a task before acting
- use tools before guessing
- gather evidence before claiming
- report progress during long tasks
- produce concrete deliverables instead of vague advice

This project focuses on that gap.

## Human-facing idea

This project is built around a simple principle:

> **You only need to tell your agent how to work.**

That means giving your agent reusable execution rules instead of relying only on raw model behavior.

## Agent-facing idea

This repo gives an agent a structured way to:

- frame goals
- make short actionable plans
- use tools before speculating
- separate evidence from inference
- report progress during long tasks
- deliver outcomes instead of commentary

## What this repo provides

- **Skills** for execution-oriented behavior
- **Policies** for planning, tool selection, and reporting
- **References** for reusable task patterns
- **Benchmarks** for before/after comparisons
- **Examples** that show how behavior improves in practice

## Project goals

- Make OpenClaw more proactive
- Make outputs more structured and reliable
- Reduce “chatty but non-executing” behavior
- Provide reusable patterns for the open-agent community

## Included in v0

- `skills/openclaw-manus/`
  - a Manus-like execution skill for OpenClaw
- `skills/openclaw-ops/`
  - a specialized ops / incident-response skill for OpenClaw
- `skills/openclaw-research/`
  - a specialized research / comparison / latest-info skill for OpenClaw
- `skills/openclaw-coding/`
  - a specialized coding / minimal-diff / validation skill for OpenClaw
- `skills/openclaw-docs/`
  - a specialized documentation review / drift-check / setup-validation skill
- planning / execution / reporting references
- benchmark task definitions
- benchmark result templates and examples
- before/after examples
- local install and packaging scripts

## What this is not

This project is **not**:

- an official Manus implementation
- a leaked prompt archive
- a one-file persona prompt
- a guarantee of full autonomous execution

## Design principles

- **Planning-first** — understand and break down the task before acting
- **Tool-first** — prefer checking, running, and verifying over guessing
- **Evidence-based** — claims should be grounded in observed results
- **Progress-aware** — long tasks should expose state and next steps
- **Delivery-oriented** — aim to produce outputs, not just commentary

## Repository structure

```text
openclaw-upgrade-kit/
├── README.md
├── LICENSE
├── skills/
│   ├── openclaw-manus/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── execution-loop.md
│   │   │   ├── tool-selection-policy.md
│   │   │   ├── reporting-format.md
│   │   │   ├── task-patterns.md
│   │   │   └── examples.md
│   │   └── agents/
│   │       └── openai.yaml
│   ├── openclaw-ops/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── incident-loop.md
│   │   │   ├── ops-checklist.md
│   │   │   └── validation-patterns.md
│   │   └── agents/
│   │       └── openai.yaml
│   ├── openclaw-research/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── research-loop.md
│   │   │   ├── source-hierarchy.md
│   │   │   └── synthesis-patterns.md
│   │   └── agents/
│   │       └── openai.yaml
│   ├── openclaw-coding/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── coding-loop.md
│   │   │   ├── diff-strategy.md
│   │   │   └── validation-patterns.md
│   │   └── agents/
│   │       └── openai.yaml
│   └── openclaw-docs/
│       ├── SKILL.md
│       ├── references/
│       │   ├── doc-review-loop.md
│       │   ├── drift-checklist.md
│       │   └── validation-boundaries.md
│       └── agents/
│           └── openai.yaml
├── benchmarks/
│   ├── results/
│   │   ├── template.md
│   │   ├── coding-example.md
│   │   ├── docs-example.md
│   │   ├── ops-example.md
│   │   └── research-example.md
│   ├── tasks/
│   │   ├── coding.md
│   │   ├── docs.md
│   │   ├── ops.md
│   │   └── research.md
│   └── rubric.md
├── docs/
│   ├── installation-and-usage.md
│   ├── integration-snippets.md
│   ├── openclaw-integration.md
│   ├── openclaw-setup-example.md
│   ├── skill-selection-guide.md
│   ├── design-principles.md
│   ├── upgrade-philosophy.md
│   ├── launch-positioning.md
│   ├── limitations.md
│   ├── benchmark-results-guide.md
│   ├── packaging-plan.md
│   ├── versioned-installation-notes.md
│   └── roadmap-10-phases.md
├── scripts/
│   ├── install_local_skills.sh
│   ├── install_selected_skills.sh
│   ├── list_packaged_skills.sh
│   └── print_version_info.sh
└── examples/
    ├── before-after-coding.md
    ├── before-after-docs.md
    ├── before-after-ops.md
    └── before-after-research.md
```

## Included skills

### `openclaw-manus`
A general execution-upgrade skill for planning, tool use, evidence gathering, progress reporting, and delivery.

### `openclaw-ops`
A specialized ops skill for runtime troubleshooting, log inspection, config validation, and safe corrective actions.

### `openclaw-research`
A specialized research skill for current-info lookup, source-backed comparison, and differentiation analysis.

### `openclaw-coding`
A specialized coding skill for repository inspection, minimal diffs, implementation changes, and validation-heavy tasks.

### `openclaw-docs`
A specialized documentation skill for README/setup/runbook review, doc-to-code drift detection, and correction planning.

## Current package contents

Today this repository already includes:

- 5 packaged skills
- local install, selective install, listing, and version-info scripts
- benchmark tasks, scoring rubric, result template, and example results
- setup, integration, packaging, and roadmap docs

Recommended first path:

1. list packaged skills with `./scripts/list_packaged_skills.sh`
2. install all skills with `./scripts/install_local_skills.sh ~/.codex/skills`
3. read `docs/openclaw-setup-example.md`
4. use `docs/skill-selection-guide.md` to pick the right skill for the task
5. record benchmark outcomes with `docs/benchmark-results-guide.md`

## Benchmarks

This repo encourages comparing:

1. base OpenClaw
2. OpenClaw with a simple prompt
3. OpenClaw with `openclaw-manus`

Suggested evaluation dimensions:

- does it create a plan?
- does it use tools before speculating?
- does it verify findings?
- does it keep the user updated?
- does it produce a concrete outcome?

## Roadmap

The project now has a staged roadmap with explicit goals, dependencies, and verifiable deliverables.

- `docs/roadmap-10-phases.md` — 10 development phases with goals, scope, deliverables, acceptance criteria, and dependency notes

Current near-term focus:
- runtime integration patterns
- long-task / checkpoint / recovery patterns
- packaging/version clarity

## Contributing

Contributions are welcome, especially in:

- benchmark tasks
- before/after examples
- tool-use policies
- task decomposition patterns
- OpenClaw integration improvements

## License

This repository is released under the MIT License.


## Additional docs

- `docs/installation-and-usage.md`
- `docs/integration-snippets.md`
- `docs/openclaw-integration.md`
- `docs/openclaw-setup-example.md`
- `docs/skill-selection-guide.md`
- `docs/github-launch-kit.md`
- `docs/release-notes-v0.1.0.md`
- `docs/roadmap-10-phases.md`
- `docs/runtime-routing-patterns.md`
- `docs/default-vs-specialized-routing.md`
- `docs/fallback-policy.md`
- `docs/benchmark-results-guide.md`
- `docs/long-task-patterns.md`
- `docs/checkpoint-template.md`
- `docs/resume-recovery-guide.md`
- `benchmarks/results/template.md`
- `benchmarks/results/research-example.md`
- `benchmarks/results/coding-example.md`
- `benchmarks/results/ops-example.md`


## Quick start

Install the packaged local skills into a target skill directory:

```bash
./scripts/install_local_skills.sh ~/.codex/skills
```

Then review:
- `docs/installation-and-usage.md`
- `docs/openclaw-setup-example.md`
- `docs/skill-selection-guide.md`
- `docs/roadmap-10-phases.md`
- `docs/runtime-routing-patterns.md`
- `docs/default-vs-specialized-routing.md`
- `docs/fallback-policy.md`
- `docs/benchmark-results-guide.md`
- `docs/long-task-patterns.md`
- `docs/checkpoint-template.md`
- `docs/resume-recovery-guide.md`
