#!/usr/bin/env bash
# ABOUTME: Test harness for deploy-preflight.sh — builds throwaway git fixtures
# ABOUTME: and asserts the leak gate fails on bad commits and passes on clean ones.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PREFLIGHT="$SCRIPT_DIR/deploy-preflight.sh"

# Synthetic allowed identity — the gate reads its allowlist from env, so the
# harness hands it throwaway values and the real pseudonym email never appears
# in this committed file.
GOOD_NAME="Pseudonym Handle"
GOOD_EMAIL="good@example.test"
# Synthetic forbidden strings — the real values never appear in this committed file.
FORBIDDEN_STR="Realname Person"
FORBIDDEN_EMAIL="realname@example.com"

pass=0
fail=0
last_out=""

# Fresh fixture repo with a clean baseline commit. Sets globals REPO, BASE, FORBIDDEN.
setup_repo() {
  REPO="$(mktemp -d)"
  FORBIDDEN="$(mktemp)"
  printf '%s\n%s\n' "$FORBIDDEN_STR" "$FORBIDDEN_EMAIL" >"$FORBIDDEN"
  git -C "$REPO" -c init.defaultBranch=main init -q
  git -C "$REPO" config user.name "$GOOD_NAME"
  git -C "$REPO" config user.email "$GOOD_EMAIL"
  echo "baseline" >"$REPO/README.md"
  git -C "$REPO" add -A
  git -C "$REPO" commit -q -m "baseline"
  BASE="$(git -C "$REPO" rev-parse HEAD)"
}

# Run the gate against the fixture. Captures exit code (never aborts the harness)
# and stores combined output in last_out. Honors an optional FORBIDDEN_FILE override.
run_preflight() {
  local forbidden="${1:-$FORBIDDEN}"
  local code=0
  last_out="$(cd "$REPO" && TARGET_REF=main REMOTE_REF="$BASE" FORBIDDEN_FILE="$forbidden" \
    ALLOWED_NAME="$GOOD_NAME" ALLOWED_EMAIL="$GOOD_EMAIL" "$PREFLIGHT" 2>&1)" || code=$?
  return "$code"
}

check() {
  local name="$1" expected="$2" actual="$3"
  if [[ "$actual" == "$expected" ]]; then
    echo "PASS: $name (exit $actual)"
    pass=$((pass + 1))
  else
    echo "FAIL: $name (expected exit $expected, got $actual)"
    echo "----- output -----"
    echo "$last_out"
    echo "------------------"
    fail=$((fail + 1))
  fi
}

check_reason() {
  local name="$1" needle="$2"
  if grep -qi "$needle" <<<"$last_out"; then
    echo "PASS: $name (reason mentions '$needle')"
    pass=$((pass + 1))
  else
    echo "FAIL: $name (output did not mention '$needle')"
    echo "----- output -----"
    echo "$last_out"
    echo "------------------"
    fail=$((fail + 1))
  fi
}

# 1. Clean pseudonymous commit, clean content, clean message → passes.
setup_repo
echo "clean content" >"$REPO/page.md"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "add clean page"
run_preflight && code=0 || code=$?
check "clean commit passes" 0 "$code"

# 2. Commit authored AND committed by a non-allowed identity → fails on identity.
setup_repo
echo "x" >"$REPO/a.md"
git -C "$REPO" add -A
git -C "$REPO" -c user.name="Wrong Person" -c user.email="wrong@example.com" commit -q -m "wrong identity"
run_preflight && code=0 || code=$?
check "wrong author+committer fails" 1 "$code"
check_reason "wrong identity reason" "identit\|author\|committer"

# 3. Good author but non-allowed committer → fails (committer checked independently).
setup_repo
echo "y" >"$REPO/b.md"
git -C "$REPO" add -A
GIT_COMMITTER_NAME="Wrong Person" GIT_COMMITTER_EMAIL="wrong@example.com" \
  git -C "$REPO" commit -q -m "good author, bad committer"
run_preflight && code=0 || code=$?
check "bad committer fails" 1 "$code"

# 4. Forbidden string in a published file → fails on content.
setup_repo
printf 'contact %s for details\n' "$FORBIDDEN_STR" >"$REPO/leak.md"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "add page"
run_preflight && code=0 || code=$?
check "forbidden string in content fails" 1 "$code"
check_reason "content leak reason" "leak.md\|content\|forbidden"

# 5. Forbidden string in a commit message → fails on message.
setup_repo
echo "clean" >"$REPO/c.md"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "page authored by $FORBIDDEN_STR"
run_preflight && code=0 || code=$?
check "forbidden string in message fails" 1 "$code"

# 6. Forbidden string added then removed before tip — clean tip, dirty history → fails.
setup_repo
printf '%s\n' "$FORBIDDEN_STR" >"$REPO/temp.md"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "add temp"
git -C "$REPO" rm -q temp.md
git -C "$REPO" commit -q -m "remove temp"
run_preflight && code=0 || code=$?
check "forbidden string in history (not tip) fails" 1 "$code"

# 7. Missing forbidden-patterns file → fails closed.
setup_repo
echo "d" >"$REPO/d.md"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "clean"
run_preflight "/nonexistent/path/forbidden.txt" && code=0 || code=$?
check "missing forbidden file fails closed" 1 "$code"
check_reason "missing-file reason" "forbidden\|pattern"

# 8. Forbidden-patterns file with only comments/blanks → fails closed.
setup_repo
echo "e" >"$REPO/e.md"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "clean"
empty_forbidden="$(mktemp)"
printf '# just a comment\n\n' >"$empty_forbidden"
run_preflight "$empty_forbidden" && code=0 || code=$?
check "empty forbidden file fails closed" 1 "$code"

# 9. No allowed identity (no env, no config file) → fails closed.
setup_repo
echo "f" >"$REPO/f.md"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "clean"
code=0
last_out="$(cd "$REPO" && TARGET_REF=main REMOTE_REF="$BASE" FORBIDDEN_FILE="$FORBIDDEN" \
  ALLOWED_NAME="" ALLOWED_EMAIL="" "$PREFLIGHT" 2>&1)" || code=$?
check "missing allowed identity fails closed" 1 "$code"
check_reason "missing-identity reason" "identity\|allow"

echo
echo "=== $pass passed, $fail failed ==="
[[ "$fail" -eq 0 ]]
