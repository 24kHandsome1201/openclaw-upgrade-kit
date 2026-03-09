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
- planning / execution / reporting references
- benchmark task definitions
- before/after examples

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
│   └── openclaw-ops/
│       ├── SKILL.md
│       ├── references/
│       │   ├── incident-loop.md
│       │   ├── ops-checklist.md
│       │   └── validation-patterns.md
│       └── agents/
│           └── openai.yaml
├── benchmarks/
│   ├── tasks/
│   │   ├── coding.md
│   │   ├── docs.md
│   │   ├── ops.md
│   │   └── research.md
│   └── rubric.md
├── docs/
│   ├── design-principles.md
│   ├── upgrade-philosophy.md
│   ├── launch-positioning.md
│   └── limitations.md
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

- more execution skills
- task-specific variants (research / coding / ops / docs)
- better benchmark coverage
- multi-step workflow patterns
- optional runtime integration guides

## Contributing

Contributions are welcome, especially in:

- benchmark tasks
- before/after examples
- tool-use policies
- task decomposition patterns
- OpenClaw integration improvements

## License

This repository is released under the MIT License.
