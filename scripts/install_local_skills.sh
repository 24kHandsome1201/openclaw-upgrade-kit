#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"
SOURCE_SKILLS_DIR="$REPO_ROOT/skills"

TARGET_DIR="${1:-}"
if [[ -z "$TARGET_DIR" ]]; then
  echo "Usage: $0 <target-skill-directory>"
  echo
  echo "Example:"
  echo "  $0 ~/.codex/skills"
  exit 1
fi

mkdir -p "$TARGET_DIR"

copy_skill() {
  local skill_name="$1"
  local src="$SOURCE_SKILLS_DIR/$skill_name"
  local dst="$TARGET_DIR/$skill_name"

  if [[ ! -d "$src" ]]; then
    echo "[skip] missing source skill: $skill_name"
    return
  fi

  rm -rf "$dst"
  cp -a "$src" "$dst"
  echo "[ok] installed $skill_name -> $dst"
}

copy_skill "openclaw-manus"
copy_skill "openclaw-ops"

echo
cat <<MSG
Done.

Installed skills from:
  $SOURCE_SKILLS_DIR

to:
  $TARGET_DIR

Next step:
- point your OpenClaw-compatible skill loader at that directory, or
- copy these skill folders into your existing local skills path.
MSG
