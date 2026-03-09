#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
REF="${1:-HEAD}"
WORK_DIR="${2:-/tmp/openclaw-release-prepare}"

cd "$REPO_ROOT"

echo "== openclaw-upgrade-kit release prep =="
echo "ref: $REF"
echo "work dir: $WORK_DIR"
echo

echo "[A] repo status"
git status --short

echo
echo "[B] version info"
./scripts/print_version_info.sh

echo
echo "[C] packaged skills"
./scripts/list_packaged_skills.sh

echo
echo "[D] running smoke test"
./scripts/smoke_test_release.sh "$WORK_DIR" "$REF"

echo
echo "Release prep complete."
echo "Next checks:"
echo "- verify docs/release-checklist.md"
echo "- verify release notes match current repo state"
echo "- if ready, tag or publish from ref: $REF"
