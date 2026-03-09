# Integration Snippets

This file provides small copy/paste snippets for common local layouts.

## 1. Install all packaged skills into a local skill directory

```bash
./scripts/install_local_skills.sh ~/.codex/skills
```

## 2. Install only selected skills

```bash
./scripts/install_selected_skills.sh ~/.codex/skills openclaw-research openclaw-coding
```

## 3. List packaged skills

```bash
./scripts/list_packaged_skills.sh
```

## 4. Print local version info

```bash
./scripts/print_version_info.sh
```

## 5. Example local layout

```text
~/projects/openclaw-upgrade-kit/
~/.codex/skills/
```

## 6. Example resulting skill tree

```text
~/.codex/skills/
├── openclaw-manus/
├── openclaw-ops/
├── openclaw-research/
├── openclaw-coding/
└── openclaw-docs/
```

## 7. Example workflow for testing one specialized skill

```bash
./scripts/install_selected_skills.sh ~/.codex/skills openclaw-coding
```

Then run a coding benchmark and score it with:
- `benchmarks/rubric.md`
- `benchmarks/results/template.md`

## 8. Example workflow for documentation review

```bash
./scripts/install_selected_skills.sh ~/.codex/skills openclaw-docs
```

Then run a README/setup drift review and record findings with:
- `benchmarks/tasks/docs.md`
- `benchmarks/results/template.md`


## 9. Manual routing reference flow

1. Start with `openclaw-manus` if the task is mixed.
2. Switch to `openclaw-ops` for logs/status/config.
3. Switch to `openclaw-research` for latest-info/source checks.
4. Switch to `openclaw-coding` for implementation changes.
5. Switch to `openclaw-docs` for doc-to-code correction.
6. Return to `openclaw-manus` for mixed final delivery.
