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

## Known Hugo Compatibility Concerns

These patterns work in 0.91 but are deprecated or removed in newer Hugo versions:

- `getJSON` (baseof.html:38) — deprecated; replaced by `resources.GetRemote` in newer Hugo
- `taxonomyTerm` (baseof.html:80) — renamed to `taxonomy` in Hugo 0.73+
- `.Site.Author` (socialcardimage.html, newsletter.html) — removed in Hugo 0.124+
- `relLangURL` pipe (baseof.html:32) — deprecated in favor of `relURL`
