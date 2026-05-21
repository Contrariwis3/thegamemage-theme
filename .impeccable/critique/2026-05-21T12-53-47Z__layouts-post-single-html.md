---
target: single post / reading page
total_score: 34
p0_count: 0
p1_count: 3
timestamp: 2026-05-21T12-53-47Z
slug: layouts-post-single-html
---
# Critique — Single Post / Reading Page (round 3, post-coda asymmetry + harden + body-face skip link)

**Target:** `layouts/post/single.html` (rendered: `testsite/public/post/real-post/`)
**Register:** brand · **System:** The Inked Plate

## Anti-Patterns Verdict

**Deterministic scan:** clean across all four post variants.

**LLM assessment:** moved from "solid second-pass work" to "Strong" (34/40). The agent explicitly named the asymmetric post-coda as load-bearing craft: "two poles balance the row without collapsing onto a centered axis." Visibility, real-world match, consistency, recognition, and aesthetic-minimalist all scored 4. The page is no longer hovering around 30 — it's in a different band.

## Design Health Score

| # | Heuristic | Score | Δ from r2 |
|---|---|---|---|
| 1 | Visibility of System Status | 4 | +1 |
| 2 | Match System / Real World | 4 | = |
| 3 | User Control and Freedom | 3 | = |
| 4 | Consistency and Standards | 4 | +1 |
| 5 | Error Prevention | 3 | = |
| 6 | Recognition Rather Than Recall | 4 | +1 |
| 7 | Flexibility and Efficiency | 2 | = |
| 8 | Aesthetic and Minimalist Design | 4 | +1 |
| 9 | Error Recovery | 4 | +1 |
| 10 | Help and Documentation | 2 | = |
| **Total** | | **34/40** | **+5** |

Five points up from the prior reviewer's read. Bigger signal: per-row improvements track the moves we made (the foot subtraction, the asymmetric coda, the AA fixes, the prose ink discipline), not reviewer noise.

## What's Working

- **The cartouche-as-system, not as ornament.** The four-point diamond glyph at the cartouche-rule's center, at the colophon's center, and as the standalone `.sigil` for chip leading marks is one shape doing three jobs. "The chronicle has its own glyph and uses it consistently. This is the single highest-conviction move on the page."
- **The asymmetric foot-coda.** Tags left, reply right, the gap between them carrying breath. The agent called out: "Compared to the older stacked centered-tags + centered-reply + 40ch divider arrangement, this is one composed line where the prior was three centered slabs saying the same thing."
- **The ghost slot in foot-nav.** "Same words, opacity 0.6, AA-cleared, ARIA-hidden. The chronicle 'has a continuing tense' reads as authored, not retrofitted."

## Priority Issues

### [P0/content] Drop cap fires on chatty preamble paragraphs, not the substantive opening
On `real-post`, the cap drops a 5em Smaug Red "T" on a "have some soup" gag — four paragraphs of food riff before the first H2 ("Okay So What Did We Actually Get Done?"). The selector guard (`:first-child`) only knows the prose's first child is a `<p>`; it can't know whether that `<p>` is *thematically* the opening line of the inscription. **Status:** this is content-style-meets-design-intent, not a bug. You're both author and designer; if the chatty preamble is your voice and the cap firing wherever the first paragraph lands is fine with you, no action needed. Surfaces here for awareness — the typography assumes the lead paragraph carries the substantive opening; your voice runs preamble-first.

### [P1] The corner-mark partial exists but is never rendered — dead code or unshipped intent
`layouts/partials/ornament/corner-mark.html` is authored. `single.html` line 8 comments: "Corner registration marks frame the scroll as a quiet tipped-in plate." There are no calls to the partial in the template, and `main.scss` has no `.corner-mark` rules. The `.reading-scroll` already has `position: relative` (`:466`) — the absolute-positioning hook is sitting there. **Fix:** decide. Either render the partial four times on `.reading-scroll` (top-left, top-right, bottom-left, bottom-right) with `.corner-mark--{tl|tr|bl|br}` styling, or delete the partial. Documented intent that didn't ship. **`/impeccable craft`** to build them, or **`/impeccable distill`** to remove.

### [P1] Untitled-post `<title>` leaks raw HTML
`test-short/index.html` line 1: `<title>&lt;p>A short untitled post, like … | The Game Mage (Test)</title>`. The browser tab shows `<p>A short untitled post, like …`. Hugo's default title fallback when `.Title` is empty pulls from `.Summary` or `.Content`, picking up the raw HTML. Lives outside `single.html` (the fix is in `layouts/partials/head.html`'s `<title>` block) but is a single-post-page bug worth surfacing. **Fix:** add an untitled-post branch that synthesizes a title like "An untitled scroll, January 10 2025" or pulls from `.PlainText`. **`/impeccable clarify`**.

### [P1] "Inscribed on" wraps to a separate line from the date on narrow viewports
`white-space: nowrap` is on `<time>` only, which keeps the date intact but lets "Inscribed on" break onto its own line above. At press-face title size (1.5rem), the result on iPhone-SE width is two centered lines instead of one composed press-set caption. **Fix:** move `white-space: nowrap` to the whole `.arcane-timestamp`. "Inscribed on January 15, 2026" fits well under 30 characters even at 1.5rem on 375px width. **`/impeccable typeset`**.

### [P2] Reply chip wraps inelegantly when post has 3+ tags
On `real-post` (3 tags + reply chip), the four items overflow 70ch at mobile chip sizes. The reply chip wraps to its own line — and `margin-left: auto` becomes meaningless on a single-item wrap row, so the chip lands hard-left, not right. The asymmetric pole inverts when the row wraps. **Fix:** when the chip wraps onto its own line, give it `width: 100%` (or `flex: 1 0 100%`) so it spans the full coda and right-aligns via `text-align: right` or `justify-content: flex-end`. **`/impeccable harden`** on the post-coda wrap behavior.

### [P3] The foot's spacing rhythm flattens
`.reading-scroll` bottom margin `space(xxl)` (52px) + `.post-coda` top margin `space(xl)` (34px) + `.post-footnav` top margin `space(xl)` (34px) reads as one long furniture run rather than three composed zones. **Fix:** push `.post-footnav` top margin to `space(xxxl)` (80px) so the chronicle continuation has clear separation from the catalog row above. **`/impeccable layout`**.

## Cognitive Load
**Low.** Title plate concentrates the wonder-moment at the head; body recedes; foot zones are clearly ranked. A reader can drop in at any scroll position and orient instantly.

## Persona Red Flags

**Wanderer (first arrival).** Lands on `real-post`. Title plate fires, "Inscribed on" lands, body reads. Then no signal of where they are. No masthead (suppressed by design), no "this is the chronicle of Contrariwise" until they click "Return to the chronicle." The brief argues for the half-title metaphor — but a real tipped-in plate sits inside a bound book; the reader knows the book's title from the spine. A deep-linked reader has no spine. The plate carries no folio. **Specific failure of orientation.**

**Returning chronicler.** Page serves them well. No specific failures. The ghost slot is genuinely beautiful for them.

## AI-Slop Verdict

**First-order:** clear. "Blog → dark + serif" produces a Medium clone with a hero image and a centered byline; this page commits to green-tinted near-black ground (not pure black), no glow, hairline-only separators, the cartouche-rule as a composed engraved bar (not a CSS `<hr>`), and a system-wide diamond glyph reused three ways. The Hobbit-jacket palette discipline is real.

**Second-order:** slight risk, earned. Display serif + drop cap + ruled separators is the editorial-typographic reflex of the moment. What rescues it: (1) the drop cap is gated behind two conditions (titled-post + not-front-page) and suppressed on untitled notes, so it doesn't fire reflexively; (2) the rules are the cartouche-and-fleuron system, not standard `<hr>` slashes; (3) the press face is committed to one job (titles + timestamps + section heads) and forbidden from running text. The deployment is disciplined.

**One reflex flagged:** the press-serif title clamping to 6rem at desktop peak is the implementation being more confident than typical content can support. The brief says short titles only; the code permits long ones at peak scale. Worth deciding whether content discipline holds.

## Provocative Questions

1. **Should the inscription itself carry the chronicle's identity?** The single post is the only surface where the chronicle name is absent. A real tipped-in plate sits inside a bound book — the reader knows the book's title from the spine. A deep-linked reader has no spine. Is a small "Contrariwise" colophon line, or a chronicle name inscribed somewhere quiet, the missing folio?
2. **The drop cap fires on whatever the first paragraph is.** Author voice is chattier than typographic intent. Either the rule needs to relax (the cap is decorative, fire-or-don't is fine) or the content needs to discipline. Which is the design's posture?
3. **Where do you stand on the suppressed masthead?** It's documented and considered, but it costs the site one chance to introduce itself to a cold-link reader. Is "chronicle apparatus is deferred" load-bearing enough to justify the orientation cost?

## Minor Observations
- `.arcane-timestamp` base + `.title-plate .arcane-timestamp` (line 570) duplicate styling. The nested override doesn't change anything the base doesn't already set. One of them is dead.
- Cartouche SVG renders inline twice with identical contents — 14 SVG nodes for a single title plate. A `<use>` ref or sprite would halve it. Negligible perf; low priority.
- `.incipit-reply` (`main.scss:589–595`) — no test fixture exercises it (no reply-to post in `testsite/`). Worth adding so the state is regression-protected.
- `text-wrap: balance` / `pretty` browser support: verify Firefox 121+ and Safari 17.4+ are in the micro.blog audience.
- The Hobbit-jacket reference is *asymmetric* (title block left, illustration right). The plate-on-Inkstock-with-no-side-marks is symmetric. The corner marks (if reinstated per P1) would restore the asymmetric anchoring the print lineage suggests.
