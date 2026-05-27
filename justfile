# ABOUTME: Task surface for thegamemage-theme. Everyday git work targets Forgejo (origin);
# ABOUTME: publishing to the public GitHub repo goes only through the gated `deploy` recipe.

# List available recipes.
default:
    @just --list

# Run the leak gate against main vs the public repo without publishing.
preflight:
    @scripts/deploy-preflight.sh

# Run the deploy-preflight test harness.
test:
    @bash scripts/test-deploy-preflight.sh

# Publish main to the public GitHub repo, gated by the identity/content leak check.
deploy:
    #!/usr/bin/env bash
    set -euo pipefail
    branch="$(git symbolic-ref --short HEAD)"
    [[ "$branch" == "main" ]] || { echo "deploy: must be on main (currently on '$branch')" >&2; exit 1; }
    git diff --quiet && git diff --cached --quiet || { echo "deploy: working tree not clean" >&2; exit 1; }
    git fetch github
    scripts/deploy-preflight.sh
    git push github main
    echo "Published main to github."
