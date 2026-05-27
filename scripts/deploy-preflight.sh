#!/usr/bin/env bash
# ABOUTME: Leak gate run before publishing main to the public GitHub repo. Verifies
# ABOUTME: every published commit's identity is the pseudonym and no forbidden string ships.
set -euo pipefail

# The one identity allowed to reach the public repo. Kept out of this committed
# script on purpose: publishing the pseudonym's email as plaintext invites
# address harvesters (GitHub masks commit-metadata emails, but file content is
# not masked). The values are loaded from the gitignored deploy-guard config
# below, exactly like the forbidden list, and can be overridden via env for the
# test harness.
ALLOWED_NAME="${ALLOWED_NAME:-}"
ALLOWED_EMAIL="${ALLOWED_EMAIL:-}"

# What is being published, and what the public repo already has. Overridable for tests.
TARGET_REF="${TARGET_REF:-main}"
REMOTE_REF="${REMOTE_REF:-github/main}"

git rev-parse --show-toplevel >/dev/null 2>&1 || {
  echo "error: not inside a git repository" >&2
  exit 1
}
REPO_ROOT="$(git rev-parse --show-toplevel)"
FORBIDDEN_FILE="${FORBIDDEN_FILE:-$REPO_ROOT/.deploy-guard/forbidden.txt}"

# Load the allowlisted identity from the gitignored config when env didn't
# supply it. Format: `name=` and `email=` lines (other lines ignored). Fail
# closed if neither env nor file provides both — the gate must never run
# without knowing which identity is allowed.
ALLOWED_IDENTITY_FILE="${ALLOWED_IDENTITY_FILE:-$REPO_ROOT/.deploy-guard/allowed-identity}"
if [[ -z "$ALLOWED_NAME" || -z "$ALLOWED_EMAIL" ]] && [[ -f "$ALLOWED_IDENTITY_FILE" ]]; then
  [[ -z "$ALLOWED_NAME" ]] && ALLOWED_NAME="$(grep -E '^name=' "$ALLOWED_IDENTITY_FILE" | head -1 | cut -d= -f2-)"
  [[ -z "$ALLOWED_EMAIL" ]] && ALLOWED_EMAIL="$(grep -E '^email=' "$ALLOWED_IDENTITY_FILE" | head -1 | cut -d= -f2-)"
fi
[[ -n "$ALLOWED_NAME" && -n "$ALLOWED_EMAIL" ]] || {
  echo "error: no allowed identity configured (env ALLOWED_NAME/ALLOWED_EMAIL or $ALLOWED_IDENTITY_FILE)" >&2
  echo "       the deploy gate refuses to run without it (fail closed)" >&2
  exit 1
}

# Fail closed: refuse to run without a real list of forbidden strings.
[[ -f "$FORBIDDEN_FILE" ]] || {
  echo "error: forbidden-patterns file not found: $FORBIDDEN_FILE" >&2
  echo "       the deploy gate refuses to run without it (fail closed)" >&2
  exit 1
}
patterns_file="$(mktemp)"
trap 'rm -f "$patterns_file"' EXIT
grep -vE '^[[:space:]]*(#|$)' "$FORBIDDEN_FILE" >"$patterns_file" || true
[[ -s "$patterns_file" ]] || {
  echo "error: forbidden-patterns file has no usable patterns: $FORBIDDEN_FILE" >&2
  echo "       (only comments/blank lines found; fail closed)" >&2
  exit 1
}

git rev-parse --verify --quiet "${TARGET_REF}^{commit}" >/dev/null || {
  echo "error: cannot resolve target ref: $TARGET_REF" >&2
  exit 1
}

# Range of commits being published. If the remote ref is unknown (first publish),
# everything reachable from the target is new.
if git rev-parse --verify --quiet "${REMOTE_REF}^{commit}" >/dev/null; then
  range="${REMOTE_REF}..${TARGET_REF}"
else
  range="${TARGET_REF}"
fi

violations=()

# 1. Identity allowlist — author AND committer of every published commit.
while IFS=$'\t' read -r h an ae cn ce; do
  [[ -z "$h" ]] && continue
  if [[ "$an" != "$ALLOWED_NAME" || "$ae" != "$ALLOWED_EMAIL" ||
    "$cn" != "$ALLOWED_NAME" || "$ce" != "$ALLOWED_EMAIL" ]]; then
    violations+=("identity: $h author '$an <$ae>' committer '$cn <$ce>' (expected $ALLOWED_NAME <$ALLOWED_EMAIL>)")
  fi
done < <(git log --format='%h%x09%an%x09%ae%x09%cn%x09%ce' "$range")

# 2. Message denylist — forbidden strings in commit messages being published.
msg_hits="$(git log --format='%B' "$range" | grep -inF -f "$patterns_file" || true)"
[[ -n "$msg_hits" ]] && violations+=("message: forbidden text in a published commit message")

# 3a. Content denylist — forbidden strings in the live files at the published tip.
tip_hits="$(git grep -nIiF -f "$patterns_file" "$TARGET_REF" -- . 2>/dev/null || true)"
[[ -n "$tip_hits" ]] && violations+=("content (tip): $(printf '%s' "$tip_hits" | head -1)")

# 3b. Content denylist — forbidden strings introduced anywhere in the published range,
#     even if edited out before the tip (the removed version still ships in history).
range_hits="$(git log -p -U0 --no-color "$range" -- . 2>/dev/null |
  grep -E '^\+[^+]' | grep -iF -f "$patterns_file" || true)"
[[ -n "$range_hits" ]] && violations+=("content (history): forbidden text introduced in the published range")

if ((${#violations[@]} > 0)); then
  echo "DEPLOY PREFLIGHT FAILED — identity or content leak detected:" >&2
  for v in "${violations[@]}"; do
    echo "  - $v" >&2
  done
  echo "Nothing was published." >&2
  exit 1
fi

echo "Deploy preflight passed: $(git rev-list --count "$range") commit(s) clean for publish."
exit 0
