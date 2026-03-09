# openclaw-upgrade-kit

Upgrade OpenClaw from a chat assistant into a more execution-oriented agent.

**You only need to tell your agent how to work.**

`openclaw-upgrade-kit` is a modular behavior-upgrade layer for OpenClaw-style agents. It packages reusable skills, routing rules, benchmark assets, installation scripts, and release workflows so an open agent can become more planning-first, tool-first, evidence-based, and delivery-oriented.

It is designed for both:
- **agents** — to follow clearer execution rules
- **humans** — to define how their agents should investigate, act, verify, and deliver

It is **not**:
- an official Manus implementation
- a leaked prompt archive
- a one-file persona prompt
- a guarantee of full autonomous execution

---

## Current capability overview

Today this repository includes:
- **5 packaged skills**: general execution, ops, research, coding, docs
- **benchmark system**: rubric, task prompts, result template, result examples
- **installation/distribution tooling**: install all, install selected, install from tag, version info, release archive generation
- **runtime guidance**: routing, fallback, manual routing playbooks, integration examples
- **long-task guidance**: checkpoints, resume/recovery, long-task examples
- **release/community docs**: contribution guide, release checklist, evaluation cadence, roadmap

---

## Why this exists

Most open agents can answer questions.

Far fewer can reliably:
- plan a task before acting
- use tools before guessing
- gather evidence before claiming
- report progress during long tasks
- produce concrete deliverables instead of vague advice

This project focuses on that gap.

---

## Recommended reading paths

### Path 1: I just want to use it
1. `docs/installation-and-usage.md`
2. `docs/openclaw-setup-example.md`
3. `docs/skill-selection-guide.md`
4. `docs/openclaw-integration.md`

### Path 2: I want to understand the skill system
1. `README.md`
2. `docs/roadmap-10-phases.md`
3. `docs/runtime-routing-patterns.md`
4. `docs/default-vs-specialized-routing.md`
5. `docs/fallback-policy.md`

### Path 3: I want to evaluate results
1. `benchmarks/rubric.md`
2. `benchmarks/tasks/`
3. `docs/benchmark-results-guide.md`
4. `benchmarks/results/`

### Path 4: I want release / packaging workflow
1. `docs/versioned-installation-notes.md`
2. `docs/packaging-plan.md`
3. `docs/release-archive-workflow.md`
4. `docs/release-checklist.md`

---

## Skills matrix

| Skill | Primary use | Best for | Key files |
| --- | --- | --- | --- |
| `openclaw-manus` | general execution upgrade | mixed multi-step tasks, planning, delivery | `skills/openclaw-manus/SKILL.md` |
| `openclaw-ops` | ops specialization | service failures, logs, config, runtime validation | `skills/openclaw-ops/SKILL.md` |
| `openclaw-research` | research specialization | latest info, source-backed comparison, differentiation | `skills/openclaw-research/SKILL.md` |
| `openclaw-coding` | coding specialization | bug fixing, minimal diffs, validation-heavy changes | `skills/openclaw-coding/SKILL.md` |
| `openclaw-docs` | docs specialization | README/setup/runbook review, doc-to-code drift | `skills/openclaw-docs/SKILL.md` |

**Default routing rule:** if the task is mixed or still unclear, start with `openclaw-manus`, then switch to a specialized skill when one lane becomes dominant.

---

## Scripts matrix

| Script | Purpose | Example |
| --- | --- | --- |
| `scripts/list_packaged_skills.sh` | list packaged skills | `./scripts/list_packaged_skills.sh` |
| `scripts/install_local_skills.sh` | install all packaged skills into a target dir | `./scripts/install_local_skills.sh ~/.codex/skills` |
| `scripts/install_selected_skills.sh` | install only selected skills | `./scripts/install_selected_skills.sh ~/.codex/skills openclaw-manus openclaw-ops` |
| `scripts/install_from_tag.sh` | install skills from a local git tag | `./scripts/install_from_tag.sh v0.1.0 ~/.codex/skills` |
| `scripts/print_version_info.sh` | print tag / branch / commit info | `./scripts/print_version_info.sh` |
| `scripts/create_release_archive.sh` | create a `.tar.gz` release archive for a git ref | `./scripts/create_release_archive.sh v0.1.0 /tmp/release-out` |
| `scripts/prepare_release.sh` | release preparation helper | `./scripts/prepare_release.sh` |
| `scripts/smoke_test_release.sh` | release smoke-test helper | `./scripts/smoke_test_release.sh` |

---

## Docs map

### Core onboarding
- `docs/installation-and-usage.md`
- `docs/openclaw-setup-example.md`
- `docs/skill-selection-guide.md`
- `docs/openclaw-integration.md`

### Routing and runtime behavior
- `docs/runtime-routing-patterns.md`
- `docs/default-vs-specialized-routing.md`
- `docs/fallback-policy.md`
- `docs/runtime-integration-examples.md`
- `docs/manual-routing-playbook.md`
- `docs/integration-snippets.md`

### Long-task / state / recovery
- `docs/long-task-patterns.md`
- `docs/checkpoint-template.md`
- `docs/resume-recovery-guide.md`
- `docs/long-task-example.md`

### Evaluation and benchmarks
- `docs/benchmark-results-guide.md`
- `docs/benchmark-contribution-guide.md`
- `docs/evaluation-cadence.md`
- `benchmarks/rubric.md`
- `benchmarks/tasks/`
- `benchmarks/results/`

### Packaging and release
- `docs/versioned-installation-notes.md`
- `docs/packaging-plan.md`
- `docs/release-archive-workflow.md`
- `docs/release-checklist.md`
- `docs/release-plan-v0.1.0.md`
- `docs/release-plan-v0.1.1.md`
- `docs/release-notes-v0.1.0.md`
- `docs/release-notes-v0.1.1.md`

### Project direction
- `docs/design-principles.md`
- `docs/upgrade-philosophy.md`
- `docs/launch-positioning.md`
- `docs/limitations.md`
- `docs/roadmap-10-phases.md`

---

## Benchmarks

This repository evaluates upgrades by comparing:
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + the relevant skill / routing pattern

Current benchmark assets include:
- task prompts in `benchmarks/tasks/`
- scoring in `benchmarks/rubric.md`
- result template in `benchmarks/results/template.md`
- example results for `research`, `coding`, `ops`, `docs`, and `long-task`

---

## Quick start

```bash
./scripts/list_packaged_skills.sh
./scripts/install_local_skills.sh ~/.codex/skills
./scripts/print_version_info.sh
```

Then read:
- `docs/openclaw-setup-example.md`
- `docs/skill-selection-guide.md`
- `docs/runtime-routing-patterns.md`
- `docs/benchmark-results-guide.md`

---

## Repository layout

```text
openclaw-upgrade-kit/
├── skills/        # packaged skills
├── benchmarks/    # rubric, task prompts, result examples
├── docs/          # integration, routing, long-task, release docs
├── scripts/       # install, packaging, release helpers
└── examples/      # before/after examples
```

---

## Roadmap status

The project now has a staged roadmap with explicit goals, dependencies, and verifiable deliverables.

See:
- `docs/roadmap-10-phases.md`

Current near-term focus:
- community benchmark contribution flow
- release/evaluation discipline
- long-task benchmark examples
- more engineering-focused packaging and runtime patterns

---

## Contributing

High-value contributions include:
- benchmark tasks and benchmark evidence
- stronger before/after examples
- skill improvements with clear validation value
- runtime integration examples
- packaging and release workflow improvements

Start with:
- `CONTRIBUTING.md`
- `docs/benchmark-contribution-guide.md`
- `docs/release-checklist.md`

---

## License

MIT
