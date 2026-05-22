---
target: home / section / taxonomy listings
total_score: 31
p0_count: 0
p1_count: 1
timestamp: 2026-05-22T00-29-29Z
slug: layouts-index-html
---
# Critique: Inked Plate listings (home / section / taxonomy)

Scope: home (page 1 + page 2), section (`/post/`), taxonomy index (`/categories/`), taxonomy term (`/categories/gaming/`). Reviewed against rendered HTML + compiled SCSS. Test build: 4 dummy posts, real templates, real CSS.

## Design Health Score

| # | Heuristic | Score | Key issue |
|---|-----------|-------|-----------|
| 1 | Visibility of System Status | 3 | Pagination position is clear; no active-state for current section in the Teleportation Circle. |
| 2 | Match System / Real World | 3 | Diegetic register fully committed and coherent; opaque to a first-timer by design. |
| 3 | User Control and Freedom | 3 | No traps; term-page rubric isn't a link back up to the sigil catalog. |
| 4 | Consistency and Standards | 4 | Exceptional — primitives render identically across all four surfaces. |
| 5 | Error Prevention | 3 | Nothing to get wrong on a listing; no foot-guns. |
| 6 | Recognition Rather Than Recall | 3 | Everything visible; diegetic labels invert recognition into recall on first visit. |
| 7 | Flexibility and Efficiency | 2 | One rigid path (chronological scroll + pagination); no jump/search/archive affordance. |
| 8 | Aesthetic and Minimalist Design | 4 | Every element earns its place; ink discipline is provably held. |
| 9 | Error Recovery | 2 | Empty/edge states on listings are unhandled (blank scroll). |
| 10 | Help and Documentation | 2 | None on these surfaces; diegetic vocabulary is the case where a gloss would help. |
| **Total** | | **31/40** | **Good (upper band) — solid foundation, gaps concentrated in findability + first-timer onboarding.** |

## Anti-Patterns Verdict

**Does this look AI-generated? No — convincingly authored.** Committed flat ink-on-dark-stock palette, one period press face against a hyperlegible body, hairline rules as the only divider, diegetic vocabulary carried all the way into the paginator ("Scroll 1 of 2"). No SaaS residue, no kitsch, no stock imagery. The composition has a point of view.

**Deterministic scan (impeccable detect):** All five rendered HTML files scan **clean** (`[]`, exit 0). The only finding across the whole tree is one `side-tab` (thick one-sided border) at `styles.css:11` — traced to vendored **PureCSS** button-group dividers (`.pure-button-group .pure-button { border-right:1px solid rgba(0,0,0,.2) }`), a framework artifact, not an authored card stripe, and not rendered on these surfaces. **Confirmed false positive.** No gradients, glows, glassmorphism, gradient-text, hero-metric, or identical-card-grid flagged anywhere.

**Hard-ban audit (authored CSS):** glow / luminous shadow — CLEAN (only disavowing comments). Gradients — CLEAN. `background-clip:text` — CLEAN. `#000`/`#fff` — CLEAN (stock `#0d1310`, ink `#f3ece0`). `border-left/right > 1px` accent stripe — CLEAN (all borders 1px hairline; blockquote/code disavow the stripe). IM Fell English never sets body — CLEAN. Em-dashes — CLEAN in chrome. One nuance: `.tag` at-rest fill is `rgba($accent, 0.06)` (a translucent tint) — see P3.

## Overall Impression

This is a disciplined, on-brand implementation. The keystone is mostly held: the drop-cap scoping (fires only on the newest titled post on home page 1) and the three-ink discipline are exemplary restraint. The real gaps are concentrated and several are already flagged as deferred in the source: the **maximal aside** (and its content duplication on the taxonomy index), **unhandled empty states**, and the **card grid being the one conventional, keystone-risky pattern** left on these surfaces. The single biggest opportunity: the cards are now the last stack of bordered rectangles on the page — the same move the brief already made when it unboxed the side scroll.

## What's Working

1. **Drop-cap scoping** (`main.scss:619-631` + `.chronicle-front` body class). A 5em Smaug-Red press initial fires only on the single newest titled post on home page 1, structurally unable to fire on sections, deeper paginator pages, or untitled notes. The wonder is felt on arrival, never spotted as a repeated trick. This restraint *is* the brand.
2. **Diegetic consistency into the mechanical chrome.** The paginator — where themes usually break character — stays in voice: "Scroll 1 of 2", older-left/newer-right matching the single-post foot-nav, persistent ghost slots so the layout never reflows between ends, `aria-label="Scroll pagination"`.
3. **Three-ink discipline is provably held.** Blue=structure/links, green=section/warmth/tags, red=position-only. The `em` decision (`main.scss:327-338`) actively reverted an earlier green recolor to avoid "typographic confetti" — the rule is being defended, not just declared.

## Priority Issues

**[P1] The aside duplicates the catalog on the taxonomy index, and is maximal rather than marginal.**
- Why it matters: On `/categories/`, the page body *is* the 5-chip sigil catalog, and the aside's "Arcane Symbols" panel renders the same chips again, plus ~15 more links — 20+ targets competing with a body that is the catalog. That is friction a reader *spots*, and it undercuts the "chronicle on the left, quiet apparatus in the margin" hierarchy. (`categories/index.html` body vs aside; cognitive-load fails on minimal-choices + progressive-disclosure.)
- Fix: Suppress Arcane Symbols on taxonomy surfaces where it's redundant; cap/progressively disclose the aside generally. Note: `baseof.html:47-49` already flags index-side composition as deferred to the side-scroll pass — the duplication specifically is the sharp edge worth pulling forward.

**[P2] The card is the one conventional primitive left — the last stack of bordered rectangles.**
- Why it matters: It is the single most AI-template-shaped element on these surfaces (bordered panel → title → date → summary → rule → tags, repeated). Past the front card's drop cap, the identical plates risk being *spotted as a pattern* — the keystone's failure condition for the unhurried atmosphere-seeker. The brief already unboxed the side scroll for exactly this reason ("collapsed the page into a stack of similar rectangles").
- Fix: Evaluate a continuous index — entries separated by hairline + air on the bare stock — instead of bordered plates. The plate metaphor is load-bearing for the *single* reading scroll; on a list of five, five plates may be four too many. (This is a real design swing, not a defect — surfaced as the central decision.)

**[P2] Empty / edge states are unhandled.**
- Why it matters: A section or term with zero posts renders the rubric then a blank column; the taxonomy index hides the whole sigil block on zero terms. A chronicle that is "lived-in and continuous" should never present a blank scroll — a blank reads as broken, not as a journey beginning.
- Fix: Add a diegetic empty line in the rubric zone ("No inscriptions yet bear this sigil" / "The chronicle's sigils are not yet drawn"). Cheap, fully in-voice, removes the only "is this broken?" moment.

**[P3] The per-card footer is one zone too many.**
- Why it matters: Each card stacks title → timestamp → prose → centered short hairline (`.card-rule`, 40%) → centered tag row. Two adjacent centered separators doing neighboring jobs, repeated every card, is where the eye starts to *notice the apparatus*.
- Fix: Test dropping `.card-rule` and carrying prose→tags separation on whitespace alone (the chips are already visually distinct). One fewer horizontal mark per card.

**[P3] The `.tag` at-rest fill is the one literal translucency in the system.**
- Why it matters: `main.scss:156` `rgba($accent, 0.06)`. DESIGN.md §5 sanctions "a flat ink-tint fill at low strength," so this is defensible — but a chip sits on both Plate (`.card`) and Inkstock (aside/taxonomy), so the same stamp composites to two faintly different colors by surface. Microscopic, but it's the one place the "same stamp everywhere" identity isn't pixel-identical. The deterministic detector did *not* flag it as glassmorphism, which supports treating this as code-purity rather than a visible seam.
- Fix: If pursued, pre-mix an opaque ink at the same value so the stamp is identical on every surface; or write the carve-out into DESIGN.md so rule and code agree.

## Persona Red Flags

**Sam (Accessibility-dependent):** Heading outline is flattened — masthead `h1`, rubric `h2`, and every card title also `h2` (`post-card.html:19`), so cards are siblings of the rubric that names their section rather than nested under it (a defended design choice, but a real outline flattening). Pagination current page is distinguished from the total **by Smaug Red alone**, same size/face (`main.scss:1300-1315`) — the words "Scroll … of …" carry position, but the emphasis is color-only. Strong craft elsewhere: real in-voice skip-link, global `:focus-visible`, ghost opacity raised 0.4→0.6 specifically to clear AA, `prefers-reduced-motion` neutralizes every transition.

**Jordan (First-Timer):** Four mystified labels stacked in one column — "Teleportation Circle" (nav), "Mystic Missives" (status feed), "Random Incantations" (recent posts), "Arcane Symbols" (tags), "Allied Mages" (blogroll) — none glossed. No orientation copy on listing surfaces beyond the title (strapline deliberately removed). This is the accepted brand cost, but it is a genuine first-timer wall, sharpest on a cold landing at `/categories/`.

**Casey (Distracted Mobile):** Correct source order (chronicle first, aside stacks below). But the full ~20-link aside then sits below every listing as a long tail with no collapse/summary. Touch targets handled well (`%stamp-base` min-height under coarse pointer, block side-scroll links, full-column pagination slots); chips hit 36px under coarse pointer, under the 44pt iOS guideline.

**Unhurried Atmosphere-Seeker (project persona):** Surfaces are strongest at the top (masthead, front card) and weakest in the repeated middle — the identical cards risk being read as a template, puncturing the "private notebook" illusion this reader came for. The 20-link margin competes with the reading hush.

**Returning Recognizer-of-Furniture (project persona):** Random Incantations reshuffles daily (per-day md5, `side-scroll.html:61-65`) — furniture that *moves* overnight can read as instability rather than liveness. No active-state in the Teleportation Circle, so a reader deep in `/categories/gaming/` gets no persistent "you are here" marker beyond the one-line rubric.

## Minor Observations

- Masthead repeats at full frontispiece scale (clamp to 6rem) on `/page/2/` — should the wonder-moment recede after the front the way the drop cap does?
- Footer reading-ink dimmed to `opacity: 0.78` (`main.scss:453`) — quiet-by-fade rather than quiet-by-ink-choice; likely still AA, worth confirming.
- `title="Permanent link to this scroll"` is a nice in-character tooltip but is desktop-hover-only (invisible to touch/AT).
- Catalog-rubric `<em>` switches to body italic inside a press line to avoid synthetic italic — sharp craft call, not a flaw.
- Hugo build is 0.161.1; CLAUDE.md states a 0.158 micro.blog ceiling — confirm nothing used (`:has()`, `try`) postdates the production target.
- Vendored PureCSS uses `rgba(0,0,0,...)` dividers (pure-black-with-alpha) in framework CSS — not authored, not on these surfaces, but it's the one place pure black exists in shipped CSS.
