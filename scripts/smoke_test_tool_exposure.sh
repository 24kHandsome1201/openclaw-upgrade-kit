#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAIL=0

check_file() {
  local path="$1"
  if [[ -f "$REPO_ROOT/$path" ]]; then
    echo "[PASS] file exists: $path"
  else
    echo "[FAIL] missing file: $path"
    FAIL=1
  fi
}

check_dir() {
  local path="$1"
  if [[ -d "$REPO_ROOT/$path" ]]; then
    echo "[PASS] dir exists: $path"
  else
    echo "[FAIL] missing dir: $path"
    FAIL=1
  fi
}

echo "Running openclaw-upgrade-kit tool exposure smoke test"
echo "Repo root: $REPO_ROOT"

echo
for skill in \
  openclaw-manus \
  openclaw-ops \
  openclaw-research \
  openclaw-coding \
  openclaw-docs \
  openclaw-runtime \
  openclaw-release
  do
  check_dir "skills/$skill"
  check_file "skills/$skill/SKILL.md"
done

echo
for script in \
  scripts/install_local_skills.sh \
  scripts/install_selected_skills.sh \
  scripts/list_packaged_skills.sh \
  scripts/print_version_info.sh \
  scripts/install_from_tag.sh \
  scripts/create_release_archive.sh \
  scripts/prepare_release.sh \
  scripts/smoke_test_release.sh
  do
  check_file "$script"
done

echo
for doc in \
  README.md \
  docs/openclaw-integration.md \
  docs/installation-and-usage.md \
  docs/benchmark-results-guide.md \
  docs/release-checklist.md
  do
  check_file "$doc"
done

echo
if [[ $FAIL -ne 0 ]]; then
  echo "Smoke test failed: one or more expected repo assets are missing."
  exit 1
fi

echo "Smoke test passed: expected repo-level tool exposure assets are present."
