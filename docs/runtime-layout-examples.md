# Runtime Layout Examples

This document shows concrete host-specific integration layouts for using `openclaw-upgrade-kit` with a local skill directory.

The goal is to keep the layouts:
- easy to reproduce
- based on existing repository scripts
- explicit about what to verify

These examples do **not** assume any hidden automation beyond what already exists in this repository.

## Layout 1: User-level local skills directory

### Best for
- one developer
- one workstation
- quick local experimentation

### Example layout

```text
~/projects/openclaw-upgrade-kit/
~/.codex/skills/
├── openclaw-manus/
├── openclaw-ops/
├── openclaw-research/
├── openclaw-coding/
└── openclaw-docs/
```

### Install commands

```bash
cd ~/projects/openclaw-upgrade-kit
./scripts/list_packaged_skills.sh
./scripts/install_local_skills.sh ~/.codex/skills
```

### Skill selection suggestion
- start with `openclaw-manus` for mixed tasks
- use `openclaw-ops` for service/runtime incidents
- use `openclaw-research` for latest-info and source-backed comparison
- use `openclaw-coding` for implementation changes and validation
- use `openclaw-docs` for README/setup/runbook review

### What to verify
- `~/.codex/skills` exists after install
- each installed skill contains `SKILL.md`
- each installed skill contains `references/`
- each installed skill contains `agents/openai.yaml`
- your local runtime or workflow can point at `~/.codex/skills`

---

## Layout 2: Repo-local vendor skills mirror

### Best for
- project-specific experiments
- keeping runtime inputs close to one repo
- avoiding changes to global user skill directories

### Example layout

```text
~/projects/openclaw-upgrade-kit/
├── skills/
├── scripts/
└── .runtime-skills/
    ├── openclaw-manus/
    ├── openclaw-coding/
    └── openclaw-docs/
```

### Install commands

```bash
cd ~/projects/openclaw-upgrade-kit
./scripts/install_selected_skills.sh ./.runtime-skills openclaw-manus openclaw-coding openclaw-docs
```

### Skill selection suggestion
Use this layout when the host workflow is tightly scoped to one repository and you want only a subset of skills nearby.

A common subset is:
- `openclaw-manus` for mixed execution
- `openclaw-coding` for repo changes
- `openclaw-docs` for doc-to-code review

### What to verify
- `./.runtime-skills` contains only the selected skills
- the selected skills match the task family you expect
- repo-local paths do not conflict with your global skills directory
- your runtime can be configured to read a repo-local skill path if needed

---

## Layout 3: Shared team skills directory with versioned source repo

### Best for
- a small team
- repeatable local installs from a known tag
- reducing drift between teammates

### Example layout

```text
~/shared/openclaw-upgrade-kit/
~/shared/agent-skills/
├── openclaw-manus/
├── openclaw-ops/
├── openclaw-research/
├── openclaw-coding/
└── openclaw-docs/
```

### Install commands

Install from a known local tag:

```bash
cd ~/shared/openclaw-upgrade-kit
./scripts/install_from_tag.sh v0.1.0 ~/shared/agent-skills
```

Or install only a small team subset:

```bash
cd ~/shared/openclaw-upgrade-kit
./scripts/install_from_tag.sh v0.1.0 ~/shared/agent-skills openclaw-manus openclaw-ops openclaw-docs
```

### Skill selection suggestion
Use this layout when the team wants:
- stable versioned installs
- less ambiguity about which skill version is active
- easier benchmark/release comparisons tied to a known tag

### What to verify
- the requested tag exists locally
- `~/shared/agent-skills` contains the expected skills from that tag
- installed skill set matches the release/version you intended
- `./scripts/print_version_info.sh` output is captured somewhere for reproducibility

---

## Layout 4: Release-archive consumer workflow

### Best for
- validating what a release package contains
- users who want to inspect an archive before copying skills
- packaging/release smoke testing

### Example layout

```text
~/projects/openclaw-upgrade-kit/
/tmp/openclaw-release-archive-test/
└── openclaw-upgrade-kit-v0.1.0.tar.gz
```

### Archive creation command

```bash
cd ~/projects/openclaw-upgrade-kit
./scripts/create_release_archive.sh v0.1.0 /tmp/openclaw-release-archive-test
```

### Skill selection suggestion
This layout is best for release validation rather than day-to-day routing.

Use it when you want to verify:
- the archive is produced correctly
- the chosen ref/tag can be distributed cleanly
- the release candidate matches the documented skill set

### What to verify
- the archive file exists at the expected path
- the archive name matches the requested ref/tag
- the archive can be unpacked and inspected manually if needed
- release notes and packaged skills are consistent with the archive source ref

---

## Choosing between layouts

Use this quick rule:

- choose **Layout 1** for simple local usage
- choose **Layout 2** for repo-specific or sandboxed experiments
- choose **Layout 3** for versioned team installs from a stable local tag
- choose **Layout 4** for packaging and release verification

## Recommended follow-up docs

After choosing a layout, continue with:
- `docs/skill-selection-guide.md`
- `docs/runtime-routing-patterns.md`
- `docs/manual-routing-playbook.md`
- `docs/versioned-installation-notes.md`
