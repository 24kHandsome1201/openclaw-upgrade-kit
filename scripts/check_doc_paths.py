#!/usr/bin/env python3
"""Lightweight checker for repo-relative paths mentioned in Markdown code spans.

This intentionally uses a heuristic approach:
- scans `.md` files under the repository
- extracts single-backtick code spans
- treats likely repo-relative paths as candidates
- warns on wildcard-like paths or missing targets

It does not attempt to be a full Markdown parser.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

CODE_SPAN_RE = re.compile(r"`([^`\n]+)`")
TOP_LEVEL_HINTS = {
    "README.md",
    "CONTRIBUTING.md",
    "LICENSE",
    "docs",
    "skills",
    "examples",
    "benchmarks",
    "scripts",
    ".github",
}
WILDCARD_CHARS = {"*", "?", "[", "]"}


def looks_like_repo_path(token: str) -> bool:
    if not token or token.startswith(("http://", "https://", "#")):
        return False
    if " " in token:
        return False
    if token.startswith(("~/", "/")):
        return False
    if token.startswith("./") or token.startswith("../"):
        return True
    if "/" not in token or token.startswith("<"):
        return False
    first = token.split("/", 1)[0]
    if first in TOP_LEVEL_HINTS:
        return True
    return False


def classify_token(token: str) -> str | None:
    if not looks_like_repo_path(token):
        return None
    if any(ch in token for ch in WILDCARD_CHARS) or token.endswith("/**"):
        return "wildcard"
    return "path"


def resolve_exists(repo_root: Path, source_file: Path, token: str) -> bool:
    rel_source = source_file.parent / token
    rel_root = repo_root / token
    return rel_source.exists() or rel_root.exists()


def scan_markdown_file(repo_root: Path, md_file: Path):
    warnings = []
    text = md_file.read_text(encoding="utf-8", errors="ignore")
    for line_no, line in enumerate(text.splitlines(), start=1):
        for token in CODE_SPAN_RE.findall(line):
            kind = classify_token(token)
            if kind is None:
                continue
            if kind == "wildcard":
                warnings.append((md_file, line_no, token, "wildcard-like path is not directly resolvable"))
                continue
            if not resolve_exists(repo_root, md_file, token):
                warnings.append((md_file, line_no, token, "referenced path does not exist"))
    return warnings


def main() -> int:
    parser = argparse.ArgumentParser(description="Check repo-relative code-span paths in Markdown files.")
    parser.add_argument("paths", nargs="*", help="Optional markdown files or directories to scan. Defaults to repository root.")
    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parent.parent

    targets = []
    if args.paths:
        for raw in args.paths:
            p = (Path.cwd() / raw).resolve() if not Path(raw).is_absolute() else Path(raw)
            if p.is_dir():
                targets.extend(sorted(x for x in p.rglob("*.md") if x.is_file()))
            elif p.is_file() and p.suffix == ".md":
                targets.append(p)
    else:
        targets = sorted(x for x in repo_root.rglob("*.md") if x.is_file())

    warnings = []
    for md in targets:
        try:
            warnings.extend(scan_markdown_file(repo_root, md))
        except Exception as exc:  # pragma: no cover - defensive
            warnings.append((md, 0, "<scan>", f"failed to scan file: {exc}"))

    if warnings:
        print("doc-path lint warnings:")
        for md, line_no, token, reason in warnings:
            rel = md.relative_to(repo_root) if md.is_relative_to(repo_root) else md
            loc = f"{rel}:{line_no}" if line_no else str(rel)
            print(f"- {loc}: `{token}` -> {reason}")
        print(f"\nFound {len(warnings)} warning(s).")
        return 1

    print("doc-path lint passed: no missing or wildcard-like repo paths found in scanned Markdown files.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
