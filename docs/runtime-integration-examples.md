# Runtime Integration Examples

This document gives concrete examples for using `openclaw-upgrade-kit` in a runtime that can load local skills or manually route between them.

The goal is not to assume one exact OpenClaw implementation, but to show realistic patterns that work with the current repository structure.

## Example 1: Local skill directory integration

### Objective
Install the packaged skills into a local skill directory and make them available to an OpenClaw-compatible workflow.

### Example commands

```bash
./scripts/list_packaged_skills.sh
./scripts/install_local_skills.sh ~/.codex/skills
```

### Expected result

```text
~/.codex/skills/
├── openclaw-manus/
├── openclaw-ops/
├── openclaw-research/
├── openclaw-coding/
└── openclaw-docs/
```

### What to verify
- the target skill directory exists
- each copied skill contains `SKILL.md`
- each copied skill contains `references/`
- each copied skill contains `agents/openai.yaml`

## Example 2: Minimal manual routing without automatic skill loading

### Objective
Use the repository as a manual routing layer when the host runtime cannot auto-select skills.

### Steps
1. start with the user request
2. classify the dominant task shape
3. open the matching `SKILL.md`
4. load only the needed references
5. execute using that skill as the active behavior spec
6. switch if the task shape changes

### Example request

> Check why the bot is not replying, fix the obvious issue, and update the README if the setup instructions are wrong.

### Manual routing flow
1. start with `openclaw-manus` because the task is mixed
2. switch to `openclaw-ops` when service status, logs, and config become the main evidence source
3. if the root cause requires code changes, switch to `openclaw-coding`
4. if the README also needs correction, switch to `openclaw-docs`
5. return to `openclaw-manus` for the final mixed summary and handoff

### What to verify
- the switching logic follows the dominant evidence source
- the task does not stay in a specialized skill after the work becomes mixed again
- final output clearly states what was done and what remains

## Example 3: Research-first runtime flow

### Objective
Handle a task that begins with latest-information research and then becomes implementation or docs work.

### Example request

> Research whether this API changed recently, then update our internal docs if needed.

### Runtime flow
1. start with `openclaw-research`
2. gather current official sources
3. compare the findings with internal docs
4. switch to `openclaw-docs` if the main task becomes documentation correction
5. switch to `openclaw-coding` only if implementation changes are also required

### What to verify
- current sources are checked before conclusions are made
- research output clearly separates fact vs inference
- doc updates only happen after source-backed verification

## Example 4: Coding-first runtime flow

### Objective
Handle a task where repository inspection and validation are the main work.

### Example request

> Find one obvious bug, apply the smallest fix, and validate it.

### Runtime flow
1. start with `openclaw-coding`
2. inspect the relevant files
3. isolate the narrowest useful fix
4. patch the code
5. validate with a focused check
6. fall back to `openclaw-manus` only if the task broadens into mixed follow-up work

### What to verify
- file inspection happens before editing
- the change remains narrow and reviewable
- validation is explicit before completion is claimed

## Example 5: Docs-first runtime flow

### Objective
Review setup docs against the real repository state.

### Example request

> Make sure the README setup section still matches the repository.

### Runtime flow
1. start with `openclaw-docs`
2. inspect README, scripts, configs, and repo paths
3. patch only the highest-value drift first
4. if the task reveals missing implementation changes, switch to `openclaw-coding`
5. return to `openclaw-docs` to finish the documentation update

### What to verify
- doc-to-code comparison happens before rewriting
- documented commands and paths are checked against the repo
- the final summary states what was verified and what still needs runtime confirmation

## Example 6: Recommended local testing loop

Use this loop to test the runtime behavior manually:

1. install the relevant skill(s)
2. choose one benchmark task from `benchmarks/tasks/`
3. run the task once with base OpenClaw
4. run it again with the selected skill or routing flow
5. score the result with `benchmarks/rubric.md`
6. save the result under `benchmarks/results/`

## Related docs

- `docs/openclaw-integration.md`
- `docs/runtime-routing-patterns.md`
- `docs/default-vs-specialized-routing.md`
- `docs/fallback-policy.md`
- `docs/manual-routing-playbook.md`
