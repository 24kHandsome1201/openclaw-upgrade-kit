#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

usage() {
  cat <<MSG
Usage:
  $0 <tag> <target-skill-directory> [<skill-name> ...]

Examples:
  $0 v0.1.0 ~/.codex/skills
  $0 v0.1.0 ~/.codex/skills openclaw-manus openclaw-ops

Behavior:
- extracts the repository at the given tag into a temporary directory
- copies all packaged skills if no explicit skill names are provided
- copies only the requested skills if names are provided
MSG
}

TAG="${1:-}"
TARGET_DIR="${2:-}"
shift 2 || true

if [[ -z "$TAG" || -z "$TARGET_DIR" ]]; then
  usage
  exit 1
fi

cd "$REPO_ROOT"
if ! git rev-parse -q --verify "refs/tags/$TAG" >/dev/null; then
  echo "tag not found: $TAG" >&2
  exit 1
fi

TMP_DIR="$(mktemp -d)"
cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

git archive --format=tar "$TAG" | tar -xf - -C "$TMP_DIR"
SOURCE_SKILLS_DIR="$TMP_DIR/skills"

if [[ ! -d "$SOURCE_SKILLS_DIR" ]]; then
  echo "skills directory not found in tag: $TAG" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

copy_skill() {
  local skill_name="$1"
  local src="$SOURCE_SKILLS_DIR/$skill_name"
  local dst="$TARGET_DIR/$skill_name"

  if [[ ! -d "$src" ]]; then
    echo "[error] skill not found in tag $TAG: $skill_name" >&2
    return 1
  fi

  rm -rf "$dst"
  cp -a "$src" "$dst"
  echo "[ok] installed $skill_name from $TAG -> $dst"
}

if [[ "$#" -eq 0 ]]; then
  while IFS= read -r skill_name; do
    copy_skill "$skill_name"
  done < <(find "$SOURCE_SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)
else
  for skill_name in "$@"; do
    copy_skill "$skill_name"
  done
fi

echo
cat <<MSG
Done.
- source tag: $TAG
- installed into: $TARGET_DIR
MSG
