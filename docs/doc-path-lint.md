# Doc Path Lint

This repository includes a lightweight checker for repo-relative paths mentioned inside Markdown code spans.

Script:
- `scripts/check_doc_paths.py`

## What it checks

The script scans Markdown files and looks for single-backtick code spans that *appear* to be repo-relative paths, for example:
- `docs/openclaw-integration.md`
- `scripts/install_local_skills.sh`
- `benchmarks/results/docs-example.md`

It then warns when:
- the referenced path does not exist
- the reference uses obvious wildcard-style notation such as `*.md` or `**`

## What it does not try to do

This is intentionally conservative and lightweight.

It does **not** try to:
- fully parse Markdown
- validate ordinary shell commands
- validate HTTP/HTTPS links
- understand every possible path-like string
- decide whether a path is semantically the best reference

## Why this exists

As the docs surface grows, small path drifts become easy to miss:
- stale file names
- wildcard placeholders left in docs
- examples that no longer match the repo

This checker catches those issues early enough to keep docs more trustworthy.

## Usage

From the repository root:

```bash
./scripts/check_doc_paths.py
```

Scan a specific file or directory:

```bash
./scripts/check_doc_paths.py README.md docs/
```

## Exit behavior

- exit `0` when no issues are found
- exit `1` when any warning is found

This makes it suitable for lightweight local review or future CI integration.
