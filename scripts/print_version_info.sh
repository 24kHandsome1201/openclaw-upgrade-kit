#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

tag="$(git describe --tags --always 2>/dev/null || echo 'unversioned')"
commit="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"
branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'unknown')"

cat <<MSG
openclaw-upgrade-kit version info
- tag: $tag
- branch: $branch
- commit: $commit
MSG
