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
