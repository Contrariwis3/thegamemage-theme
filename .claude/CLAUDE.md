# The Game Mage Hugo Theme

Hugo theme for [thegamemage.com](https://thegamemage.com), hosted on micro.blog.

## Platform
- **Hosting:** micro.blog (Hugo-based)
- **micro.blog supports up to:** Hugo 0.158
- **Theme compatible with:** Hugo 0.159

## Architecture
- Hugo theme (layouts + static assets only — no full site here)
- Frontend built with webpack: SCSS via sass-loader, PureCSS grid, Phosphor Icons
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
- Build happens locally, gets pushed to repo, and Micro.blog downloads the repo as-is
- The repo must be in final deployable form at all times
- After running npm run build, always commit the updated static/ files

## Micro.blog Limitations
- Micro.blog does NOT support image files in themes (even in static/)
- Images must be hosted externally (e.g., on static.thegamemage.com subdomain)
- Other static assets like fonts work fine
- CopyWebpackPlugin configuration kept in place for future non-image assets

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
