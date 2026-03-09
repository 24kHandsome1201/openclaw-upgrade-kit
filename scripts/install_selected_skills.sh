#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
SOURCE_SKILLS_DIR="$REPO_ROOT/skills"

usage() {
  cat <<MSG
Usage:
  $0 <target-skill-directory> <skill-name> [<skill-name> ...]

Examples:
  $0 ~/.codex/skills openclaw-manus openclaw-ops
  $0 ~/.codex/skills openclaw-research

Available skills:
$(find "$SOURCE_SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '  - %f\n' | sort)
MSG
}

TARGET_DIR="${1:-}"
shift || true

if [[ -z "$TARGET_DIR" || "$#" -eq 0 ]]; then
  usage
  exit 1
fi

mkdir -p "$TARGET_DIR"

copy_skill() {
  local skill_name="$1"
  local src="$SOURCE_SKILLS_DIR/$skill_name"
  local dst="$TARGET_DIR/$skill_name"

  if [[ ! -d "$src" ]]; then
    echo "[error] missing source skill: $skill_name" >&2
    return 1
  fi

  rm -rf "$dst"
  cp -a "$src" "$dst"
  echo "[ok] installed $skill_name -> $dst"
}

for skill in "$@"; do
  copy_skill "$skill"
done

cat <<MSG

Done.
Target directory:
  $TARGET_DIR
MSG
