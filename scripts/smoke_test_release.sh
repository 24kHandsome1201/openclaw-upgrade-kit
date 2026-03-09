#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
TMP_ROOT="${1:-/tmp/openclaw-release-smoke}"
REF="${2:-HEAD}"

ALL_DIR="$TMP_ROOT/all"
SELECTED_DIR="$TMP_ROOT/selected"
ARCHIVE_DIR="$TMP_ROOT/archive"

rm -rf "$TMP_ROOT"
mkdir -p "$ALL_DIR" "$SELECTED_DIR" "$ARCHIVE_DIR"

cd "$REPO_ROOT"

echo "[1/5] list packaged skills"
./scripts/list_packaged_skills.sh

echo
echo "[2/5] install all packaged skills"
./scripts/install_local_skills.sh "$ALL_DIR"

echo
echo "[3/5] install selected packaged skills"
./scripts/install_selected_skills.sh "$SELECTED_DIR" openclaw-manus openclaw-ops

echo
echo "[4/5] print version info"
./scripts/print_version_info.sh

echo
echo "[5/5] create release archive for $REF"
./scripts/create_release_archive.sh "$REF" "$ARCHIVE_DIR"

echo
echo "Smoke test complete."
echo "- all skills dir: $ALL_DIR"
echo "- selected skills dir: $SELECTED_DIR"
echo "- archive dir: $ARCHIVE_DIR"
