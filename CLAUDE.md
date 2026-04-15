# The Game Mage Hugo Theme

Hugo theme for [thegamemage.com](https://thegamemage.com), hosted on micro.blog.

## Platform

- **Hosting:** micro.blog (Hugo-based)
- **Current Hugo version on micro.blog:** 0.91
- **micro.blog supports up to:** Hugo 0.158
- **Goal:** Upgrade theme compatibility from 0.91 toward 0.158

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

## Build and Deployment
- NO CI/CD pipeline exists for this project
- Webpack-generated assets in static/ MUST be committed to git
- Build happens locally, gets pushed to repo, and Micro.blog downloads the repo as-is
- The repo must be in final deployable form at all times
- After running npm run build, always commit the updated static/ files

## Micro.blog Limitations
- Micro.blog does NOT support image files in themes (even in static/)
- Images must be hosted externally (e.g., on static.thewizardly.com subdomain)
- Other static assets like fonts work fine
- CopyWebpackPlugin configuration kept in place for future non-image assets
