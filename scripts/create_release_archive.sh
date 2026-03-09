#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

usage() {
  cat <<MSG
Usage:
  $0 <tag-or-ref> [output-directory]

Examples:
  $0 v0.1.0
  $0 master /tmp/release-out

Behavior:
- creates a tar.gz archive for the requested git ref
- stores it under the chosen output directory
MSG
}

REF="${1:-}"
OUT_DIR="${2:-$REPO_ROOT/dist}"

if [[ -z "$REF" ]]; then
  usage
  exit 1
fi

cd "$REPO_ROOT"
if ! git rev-parse --verify "$REF^{commit}" >/dev/null 2>&1; then
  echo "git ref not found: $REF" >&2
  exit 1
fi

mkdir -p "$OUT_DIR"
SAFE_REF="$(printf '%s' "$REF" | tr '/' '-')"
ARCHIVE_PATH="$OUT_DIR/openclaw-upgrade-kit-$SAFE_REF.tar.gz"

git archive --format=tar.gz -o "$ARCHIVE_PATH" "$REF"

echo "created archive: $ARCHIVE_PATH"
