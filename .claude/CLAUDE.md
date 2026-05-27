# The Game Mage Hugo Theme

Hugo theme for [thegamemage.com](https://thegamemage.com), hosted on micro.blog.

## Platform
- **Hosting:** micro.blog (Hugo-based)
- **micro.blog supports up to:** Hugo 0.158
- **Theme compatible with:** Hugo 0.159

## Architecture
- Hugo theme (layouts + static assets only — no full site here)
- Frontend built with webpack: SCSS via sass-loader, PureCSS grid, self-hosted IM Fell English
- `npm run build` compiles frontend assets into `static/`

## Testing
A minimal test site lives in `testsite/`. To test the theme against your local Hugo:

```sh
hugo --source testsite --themesDir ../..
```

This builds the theme with dummy content. Any template errors, deprecations, or
incompatibilities will show up in Hugo's output.

The test site includes stub partials for templates micro.blog normally provides
(`microblog_head.html`, `reply-by-email.html`).

After building frontend (npm run build), pause for the test blog upload before continuing.
Final verification happens on the Micro.blog test instance.

## Build and Deployment
- NO CI/CD pipeline exists for this project
- Webpack-generated assets in static/ MUST be committed to git
- The repo must be in final deployable form at all times
- After running npm run build, always commit the updated static/ files

### Remotes
- **`origin` → Forgejo (private).** All everyday git — `push`, `pull`, `fetch`,
  branch work — targets Forgejo only. Forgejo is trusted: access is limited to
  the proprietor.
- **`github` → the public GitHub repo.** micro.blog renders the live site from
  GitHub's `main`, so **publishing to production = pushing `main` to `github`.**
  Reached only through the deploy gate below; never `git push github` by hand.

### Publishing (`just deploy`)
Production deploys are gated to keep the proprietor's real identity off the
public repo. Run from `main` with a clean tree: `just deploy` fetches `github`,
runs `scripts/deploy-preflight.sh`, and pushes `main` to `github` only if the
gate passes (fail closed otherwise). `just preflight` runs the same check
without publishing.

The gate inspects every commit in `github/main..main`:
- **Identity allowlist** — author AND committer of every published commit must
  match the allowlisted pseudonymous identity (kept out of the published tree;
  see below).
- **Content + message denylist** — forbidden real-identity strings must not
  appear in published file contents (tip tree plus lines introduced in the
  range) or in commit messages.

Both the forbidden strings (`.deploy-guard/forbidden.txt`) and the allowlisted
identity (`.deploy-guard/allowed-identity`) live under `.deploy-guard/`, which is
**gitignored and never published** — so they are absent from a fresh clone, and
the pseudonym's email never sits in the public repo for harvesters. Recreate
both before the first deploy or the gate fails closed. `just test` runs
`scripts/test-deploy-preflight.sh`, which covers the gate's behavior.

## Micro.blog Image Constraint
- micro.blog does NOT poll git LFS. Images committed via git LFS will not be
   fetched. Keep theme images out of LFS (check `.gitattributes`).
- Non-LFS images committed normally in the theme are fine, provided they are
   not huge and do not change frequently.
- The failure mode to avoid: theme imagery that is large or churns often, or
   anything that forces a manual out-of-band update to an external host (easy
   to forget). It is not a ban on theme images.
- External hosting (e.g., static.thegamemage.com) remains an option for
   assets that change rarely.
- Other static assets like fonts work fine. CopyWebpackPlugin stays for
   non-image assets.


## Design Context
Strategic design context lives in `PRODUCT.md` (root); visual system in
`DESIGN.md`. Register: **brand** — the design IS the product. Read PRODUCT.md
before any design/UI work. The guiding principles, keystone first:

1. **Sweat the small stuff (keystone)** — the Disney thesis. Magic is hundreds
   of small things right 100% of the time, none consciously noticed. Delight by
   invisible craft, never spectacle; defined by the absence of friction. If a
   detail gets caught "happening," it's too loud.
2. **Experience first; the game is embroidered in** — long-horizon intent (not
   a built feature): the site grows into a game woven invisibly into a
   top-tier reading experience. Build now as if the game is coming. A delight
   that becomes load-bearing or gets in the way has broken this.
3. **The persona is load-bearing** — diegetic labels everywhere ("Teleportation
   Circle," not "Navigation"); breaking character anywhere breaks the spell.
4. **Wonder without kitsch** — atmosphere from palette/voice/type, never props.
5. **Legibility is part of the spell** — accessibility (WCAG AA, motion-aware,
   Atkinson Hyperlegible) is craft, not compromise.
6. **A journey, not a portfolio** — lived-in and continuous, never a launch.

## Design Work: The Impeccable Track

> Project-local process experiment. This section deliberately overrides the
> global Agentic SDLC for **design work in this repo**. It is being baked here
> before any promotion to global guidance — treat it as authoritative for this
> project and expect it to diverge from `~/.config` guidance on purpose.

Design work is the realm of **impeccable** and follows a separate track. It
does **not** use OpenSpec, beads, or `/propose` → `/implement` → `/finalize`.
Those are optimized for code: a dependency DAG of independent units verified
automatically against a spec. Design craft is holistic, single-agent,
iteratively refined, and cross-cutting by definition (the keystone *is*
cross-surface consistency) — decomposing it into beads is ceremony with no
drift-detection payoff, and `live` mode is human-in-the-loop with no code-track
analog. Do not build a "decompose design to beads" path on speculation; the
trigger to revisit this is a concrete design effort too large for impeccable
to self-manage, with the example in hand.

### Track mapping

| Layer | Code track | Design track |
|---|---|---|
| Standing spec | OpenSpec `specs/` | `PRODUCT.md` + `DESIGN.md` |
| Per-effort spec | `/propose` → OpenSpec change + `tasks.md` | impeccable `shape` → confirmed brief |
| Execution tracking | beads | impeccable self-manages (no beads) |
| Build | `/implement` | impeccable `craft` |
| Verify + integrate | `/finalize` (code-vs-spec, automated) | `audit` / `critique` / `polish` (hybrid, heuristic) |

`DESIGN.md` is the design analog of OpenSpec `specs/` (standing). A `shape`
brief is the analog of an OpenSpec change (per-effort). Never route a design
task through `/propose`, OpenSpec, or beads, and never try to OpenSpec
`DESIGN.md` itself.

### The three seams

1. **Shared backlog, substrate-resolved "done."** Forgejo issues remain the
   one backlog surface; the draft/planned lifecycle is identical. Only the
   draft → done trigger differs: code = "OpenSpec change + beads exist";
   design = "a confirmed `shape` brief exists, or the `craft` scope is
   accepted."
2. **The design track is a first-class peer of the code verbs**, not a
   footnote: `shape` ≈ propose, `craft` ≈ implement, `audit` + `critique` +
   `polish` ≈ finalize/verify.
3. **The spec-layer mapping is explicit** (table above) so a session does not
   "helpfully" apply the code pipeline to design work.

### Routing rule

If the deliverable is the visual/interaction experience (CSS, templates,
layout, motion, component craft), it is design-track: use impeccable. If the
deliverable is program behavior verified by tests, it is code-track: use the
OpenSpec/beads pipeline. Mixed efforts split: the code-shaped part runs the
code track, the experience-shaped part runs impeccable. When genuinely
unsure, ask the operator rather than defaulting to either pipeline.
