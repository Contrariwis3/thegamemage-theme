---
target: single post / reading page
total_score: 30
p0_count: 1
p1_count: 2
timestamp: 2026-05-21T11-57-03Z
slug: layouts-post-single-html
---
# Critique — Single Post / Reading Page

**Target:** `layouts/post/single.html` (rendered: `testsite/public/post/real-post/`)
**Register:** brand · **System:** The Inked Plate

## Anti-Patterns Verdict

**Deterministic scan:** clean. `npx impeccable detect` returned `[]` across all four post variants. No gradient text, no side-stripe borders, no hero-metric template, no glassmorphism, no `#000`/`#fff`. The hard bans hold.

**LLM assessment:** passes first-order AI-slop — the green-tinted ink stock, hairline rules, and Hobbit-jacket palette genuinely escape the deep-purple-neon fantasy reflex. At risk on second-order: the page currently runs the full editorial-typographic vocabulary at once — cartouche-bracketed display serif + balanced wrap + 5em drop cap + arcane timestamp + ornamental hairlines + 40ch divider + italic foot nav. The brief asks you to evoke that lineage; right now you are quoting all of it. Subtraction is the escape route.

## Design Health Score

| # | Heuristic | Score | Key Issue |
|---|---|---|---|
| 1 | Visibility of System Status | 3 | Ghost foot-nav slot at opacity 0.4 is sub-AA. |
| 2 | Match System / Real World | 4 | Diegetic vocabulary is the strongest persona expression in the theme. |
| 3 | User Control and Freedom | 3 | No back-to-top after long posts; foot nav is the only escape. |
| 4 | Consistency and Standards | 3 | 70ch holds; the all-italic foot nav is non-standard as a link family. |
| 5 | Error Prevention | 3 | Drop-cap selector breaks silently when first child of .Content isn't `<p>`. |
| 6 | Recognition Rather Than Recall | 4 | Labels named explicitly, no icon-only affordances. |
| 7 | Flexibility and Efficiency | 2 | No keyboard nav for prev/next; no read-position memory. |
| 8 | Aesthetic and Minimalist Design | 2 | Above-fold disciplined; below-prose is busy. |
| 9 | Error Recovery | 3 | Edge cases handled gracefully. |
| 10 | Help and Documentation | 3 | Appropriately spare for a reading page. |
| **Total** | | **30/40** | **Strong, with visible craft gaps in the foot region.** |

## What's Working

- Title plate composes as one inscribed object (`single.html:28–36`; SCSS `:507–556`). Cartouches use `currentColor` so the rules ink in the same pass as the title.
- Article on Inkstock with no card wrap (`single.html:11–13`; SCSS `:458–471`).
- Invisible-craft baseline: reduced-motion blanket, `:focus-visible` rings, working skip link, AA-verified accents.

## Priority Issues

### [P0] The post-foot apparatus is busier than the reading it follows
Five zones below `</article>` (colophon → tag stamps → reply chip → 40ch divider → 3-column nav). The colophon and divider restate the same closing signal 80px apart. Pick one closing mark; collapse stamps and reply chip onto one composed line. **`/impeccable distill` on the foot.**

### [P1] The drop cap is twice-wonder and the selector is fragile
`.reading-body > .prose > p:first-of-type::first-letter` at 5em Smaug Red (SCSS `:589–601`). Russian-doll wonder against the C-incipit, in the system's rarest ink, on every titled post. `:first-of-type` breaks when `.Content` opens with `<h2>`/`<img>`/`<blockquote>`. Delete from the reading page; reserve for the chronicle-front home card. If kept, swap to `:first-child` and Hobbit Blue. **`/impeccable quieter`.**

### [P1] Three accent inks in body prose is one too many on dense paragraphs
`<a>` blue, `<strong>` red, `<em>` green, `code` wash. Drop the green recolor on `<em>`; let italic alone carry it. Four inks → two on dense paragraphs. **`/impeccable quieter`.**

### [P2] The 40ch `post-divider` is a fifth seam in a footer that already has too many
`:762–768`. Restates spacing that's already doing the work. Near-rhymes with the 32ch cartouche above without being a real rhyme. Delete. **`/impeccable distill`** (folds into the foot pass).

### [P3] The untitled microblog scroll is a sibling in name only
60px colophon fleuron at the foot of a single-sentence body inverts the apparatus-to-prose ratio. Hide `.colophon` on `.reading-body--untitled`. **`/impeccable polish`** on the untitled variant.

## Persona Red Flags

**Wanderer (first arrival).** Title plate works. Drop cap on ¶1 is the first moment the spell can break. By the foot they walk past ornament → green stamps → red button → hairline → italic nav. They feel "end of a themed CMS article," not "I visited somewhere."

**Returning chronicler.** Diegetic labels pay off as in-jokes. But the four-piece footer recurs identically every post — noticed every time, the opposite of invisible craft.

## Minor Observations
- Add `white-space: nowrap` on `.arcane-timestamp time`.
- 15-word titles vs. 32ch cartouche: stacked lines disconnect from the rule width.
- Ghost foot-nav slot at opacity 0.4 fails 4.5:1 AA.
- `align-items: baseline` on the foot-nav drifts the home link 1–2px high.
- `<footer>` inside `<article>` contains only an aria-hidden glyph; consider `<div>`.
- The ~90px gap last-paragraph→colophon is already doing the closing work the divider tries to do 60px later.
