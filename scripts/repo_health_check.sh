#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
FAIL=0
WARN=0

step() {
  printf '\n==> %s\n' "$1"
}

pass() {
  printf '[PASS] %s\n' "$1"
}

warn() {
  printf '[WARN] %s\n' "$1"
  WARN=1
}

fail() {
  printf '[FAIL] %s\n' "$1"
  FAIL=1
}

run_check() {
  local label="$1"
  shift
  step "$label"
  if "$@"; then
    pass "$label"
  else
    fail "$label"
  fi
}

cd "$REPO_ROOT"

echo "openclaw-upgrade-kit repo health check"
echo "repo root: $REPO_ROOT"

run_check "print version info" ./scripts/print_version_info.sh
run_check "tool exposure smoke test" ./scripts/smoke_test_tool_exposure.sh

if [[ -f ./scripts/check_doc_paths.py ]]; then
  step "doc path lint"
  mapfile -t tracked_markdown < <(git ls-files '*.md')
  if python3 ./scripts/check_doc_paths.py "${tracked_markdown[@]}"; then
    pass "doc path lint"
  else
    fail "doc path lint"
  fi
else
  step "doc path lint"
  warn "scripts/check_doc_paths.py not present; skipping doc path lint"
fi

step "git working tree"
if [[ -n "$(git status --short)" ]]; then
  warn "working tree is not clean"
  git status --short
else
  pass "working tree is clean"
fi

echo
if [[ $FAIL -ne 0 ]]; then
  echo "repo health check finished with failures."
  exit 1
fi

if [[ $WARN -ne 0 ]]; then
  echo "repo health check finished with warnings."
  exit 0
fi

echo "repo health check passed."
