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
└── openclaw-coding/
```

## 7. Example workflow for testing one specialized skill

```bash
./scripts/install_selected_skills.sh ~/.codex/skills openclaw-coding
```

Then run a coding benchmark and score it with:
- `benchmarks/rubric.md`
- `benchmarks/results/template.md`
