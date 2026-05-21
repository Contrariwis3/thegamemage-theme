---
target: index — post-cards + side-scroll
total_score: 31
p0_count: 0
p1_count: 1
timestamp: 2026-05-21T02-50-55Z
slug: index-post-cards-side-scroll
---
## Design Health Score (Nielsen's 10 heuristics)

| # | Heuristic | Score | Key Issue |
|---|-----------|-------|-----------|
| 1 | Visibility of System Status | 3 | Strong. Current page red, ghost slots for absent directions, consistent focus states. |
| 2 | Match System / Real World | 4 | Diegetic vocabulary is total ("Teleportation Circle," "Mystic Missives," "Inscribed on"). Never breaks character. |
| 3 | User Control and Freedom | 3 | Pagination + foot-nav + skip-link + side panels all give plenty of exits. No traps. |
| 4 | Consistency and Standards | 3 | Strong internal vocabulary (cartouche + colophon + sigil). Two consistency points noted below. |
| 5 | Error Prevention | 3 | n/a-adjacent — few interactive elements to err with; ghosts prevent inactive-link surprises. |
| 6 | Recognition Rather Than Recall | 3 | Catalog rubric names location; timestamps always visible. Diegetic-vocabulary mapping cost is paid in voice. |
| 7 | Flexibility and Efficiency | 2 | Skip link present; no keyboard power tools (appropriate scale). |
| 8 | Aesthetic and Minimalist Design | 4 | The system's strongest dimension — committed Inked Plate, banned anti-patterns honored in actual CSS. |
| 9 | Error Recovery | 3 | omg.lol fetch fails silently via `try`/`warnf`; panel just doesn't render. Right fallback — a user-facing error would break the spell. |
| 10 | Help and Documentation | 3 | n/a-adjacent for a reading blog. Persona is self-explanatory in context. |
| **Total** | | **31/40** | **Strong band — genuine "good design" range.** |

## Anti-Patterns Verdict

**LLM assessment: this does not look AI-generated.** The first-order fantasy-blog reflex (purple/neon glow, blackletter, dragons-and-mist) is escaped completely. The second-order reflex is also avoided — this is neither editorial-typographic (Klim/Stripe-adjacent) nor brutalist-utility. The Hobbit-jacket palette as reversed inks, IM Fell English period restraint, diegetic copy, and named no-glow law produce something that reads as authored, not generated. The system commits in three places where AI defaults equivocate:

- **A single committed palette role per ink** (Three-Ink Rule). Smaug Red is genuinely rare hot emphasis.
- **No translucency and no glow.** Both AI-default crutches, banned by name in DESIGN.md.
- **No left-stripe accent borders.** Another AI default, banned explicitly.

**Deterministic scan:**
- `npx impeccable detect --json --fast layouts/` → **0 findings**
- `npx impeccable detect --json testsite/public/index.html testsite/public/post` → **0 findings**

Clean. No first-order AI tells trip.

**Visual overlays:** Skipped — browser automation not available in this environment.

## Overall Impression

Genuinely good craft. The system is committed (named rules, banned anti-patterns, three-ink discipline) and reads as authored. The recent post-card iterations have landed: drop cap on the front-page first card, centered colophon-then-tags, italic continuation phrase. The reading scroll has the C-incipit / B-body composition the brief asks for.

**The biggest opportunity:** the index page has two stacked card families (`.card` post-cards and `.side-content` side-scroll panels) with nearly identical treatment — both are plate fill + hairline border + 3px radius. That visual sameness undermines the side-scroll's "apparatus around the chronicle" framing because the apparatus reads like more chronicle. The single hairline-bordered Plate is the dominant motif and it appears 4–8 times in a single viewport.

## What's Working

1. **The diegetic system holds.** Every label is in-world ("Teleportation Circle," "Mystic Missives," "Older inscriptions," "Return to the chronicle," "View all scrolls," "Scroll N of M"). Never breaks character, never overplays the bit — no ✨ embellishment, no "scroll of holding," just the right words.
2. **The post-card composition lands.** The recent run (drop cap on the front-page first card, colophon then centered tags, italic continuation phrase as a left-aligned cue) reads as one composed catalog entry, not a feature list. The `.Truncated`-gated continuation phrase is correct — it appears only when there's more to read.
3. **The ban discipline is real.** "No glow / no gradient / no shadow / no left-stripe / no translucency" is honored in the actual CSS, not just in the spec. The `ink-in` hover (background fills to full accent, glyph flips to stock) is the right interpretation of "interactive feedback is an ink press, never illumination."

## Priority Issues

### [P1] `.card` and `.side-content` share too much treatment

The post-card and the side-scroll panels both use: `background: plate`, `border: 1px solid hairline`, `border-radius: 3px`. On the index that's 1 masthead + N post cards + 5 side panels rendered in the same plate-on-stock step. The page becomes a stack of similar rectangles.

**Why it matters:** DESIGN.md frames `.card` as "the true Plate" (catalog entry) and the side-scroll as "the chronicle's apparatus" — that's a hierarchy claim. The current treatment renders both as Plate, so the apparatus reads as more catalog. Keystone audit catches this: a reader scanning sees "boxes," not "the chronicle on the left, the apparatus in the margin."

**Fix:** Differentiate the apparatus from the catalog.
- **A (recommended):** Remove the border + plate fill from `.side-content`, leave only a hairline above each title. The side-scroll becomes unboxed printed marginalia; the catalog stays plated. Page becomes "the chronicle is the object, the apparatus is the margin."
- **B:** Keep both plated but step their ink values apart (side panels darker toward `glyph-well` or hairline-only on `inkstock`). Less commitment than A; still corrects the sameness.

**Suggested command:** `/impeccable layout` then `/impeccable distill`.

### [P2] The card foot-colophon fires on every card

The colophon is the *closing* mark of an inscription. On a single reading scroll, exactly one fires — right. On the index, every card fires its own — so 5 cards = 5 identical close-marks. The mark loses meaning ("this inscription is closing") and becomes a separator that happens to be a fleuron.

**Why it matters:** Exactly the small thing the keystone catches — feels right per-card, slightly off in aggregate. If the colophon means "close," repeating it means nothing closes; it punctuates rather than concludes.

**Fix:**
- **A:** Drop the colophon from `.card` entirely. Border + tag row alone close the entry. Colophon stays exclusive to the single reading scroll, where its meaning is preserved.
- **B:** Show one colophon, but only on the **last** card in the paginator (boundary of the visible catalog). Marks "you've reached the end of this scroll's worth of entries."

A is simpler and aligns with DESIGN.md's "the foot colophon ... closes the inscription" (singular). B is clever but might feel like a tell rather than invisible craft.

**Suggested command:** `/impeccable distill`.

### [P2] "Inscribed on …" repeats in title-weight on every card

On a titled card the structure is: H2 → "Inscribed on January 15, 2026" in Hobbit Green press-face at title-size → prose. With 5 cards on the index, "Inscribed on" appears 5× in title weight.

**Why it matters:** The voice is correct, but the *repetition* is the SaaS-blog "Published on …" antipattern wearing in-world costume. A title-page-style "Inscribed on" earns its place on a single reading scroll (one wonder-moment); on listings it's furniture.

**Fix:** Step `.arcane-timestamp` down on the listing context — same green, but body italic small (matching `.status-time` in Mystic Missives or the `.post-footnav` italic). Reserve press-face title-size treatment for the single-scroll incipit alone. Diegetic word stays; the typographic shouting steps down.

This is the same insight the masthead made when it dropped its strapline ("masthead names the chronicle; rubric names the chapter") — apply the same restraint to per-card timestamps.

**Suggested command:** `/impeccable typeset`.

### [P3] Front-page drop cap competes with the H2 it sits under

The CSS scopes the decorated initial to: every titled reading scroll, AND the absolutely-newest titled post card on the chronicle front. The chronicle-front rule is a clever touch — front of the book gets one wonder-moment per page load.

**Why it matters:** On a single reading scroll the title is a frontispiece (clamp 3–6rem) and the 5em cap is the second moment in hierarchy. On a card the H2 is 2rem; the 5em cap is roughly the same height as the title that introduces the post. The hierarchy inverts — the cap dwarfs the title.

**Fix:** On the card context only, step the cap down (3em or 3.5em) so it sits inside the H2's hierarchical world. Or drop it from the card entirely and keep it exclusive to the reading scroll.

**Suggested command:** `/impeccable typeset` (fold into the timestamp pass above).

### [P3] Drop-cap selector relies on `:first-of-type`, which carries intent it doesn't express

`.chronicle-front main > article.card:first-of-type:has(> h2)` is intended to mean "the most-recent titled post." The `:has(> h2)` correctly handles "first article is an untitled microblog." But `:first-of-type` matches the first `article.card` in document order regardless of any non-`article.card` element placed above it.

**Why it matters:** Today this is correct because `main` only contains post-cards and the pagination nav. The moment anything else lives there (pinned card, "currently inscribing" panel, an editorial header card), the cap fires on whichever article is first in DOM order — which may not be the newest.

**Fix:** Tighten the guard at the template layer — add `.post-card--head` (or similar) to the actually-first-by-date post in `index.html`, target that. Don't rely on `:first-of-type` carrying intent it doesn't actually express. Trivial-tier work per the SDLC; flag as a `state:draft` Forgejo issue rather than design scope.

**Suggested command:** Not an impeccable pass — small template change.

## Persona Red Flags

**The unhurried micro.blog drifter** (PRODUCT.md's primary user — arriving from a timeline, reading for atmosphere).
- **Works:** Chronicle-front drop cap on the newest card immediately signals "this is an opened book, not a feed."
- **Caught:** The 5 stacked plates (cards + side panels) with identical treatment register as "feed cards in side panels" — closer to micro.blog's default UI than the inked-plate brief intends (P1).
- **Caught:** Repeated "Inscribed on" title-line in green press-face on every card reads as a content-feed metadata pattern dressed in in-world copy (P2).

**The returning reader** (PRODUCT.md: recognizes recurring in-world furniture).
- **Works:** Cartouche bars, colophon fleuron, four-point sigil — one printed vocabulary. Internally consistent.
- **Caught:** Colophon repetition on every card flattens its meaning. A returning reader should learn "colophon = scroll closing"; right now it means "card divider" (P2).

**The skeptical first-time visitor** (the brand register's "AI made this" test).
- **Works:** Palette commitment, no-glow law, IM Fell English (genuinely period, not the Cormorant Garamond reflex), Atkinson Hyperlegible as legibility backbone. No category-reflex tells fire.
- **Caught:** The page's structural rhythm (3-column grid, right-rail stack) is more conventional than the type system promises. The "main column scroll + right rail of plates" is one of the most-trained-on blog layouts. The Inked Plate type carries the brand; the layout grid doesn't fully back it up. Not a P0 — micro.blog reality constrains layout — but worth naming.

## Minor Observations

- **`.post-foot` is a one-job element with a generic name.** On the single reading scroll it currently holds only the colophon; the name implies more (it once held tags + reply). Either rename to `.post-colophon-wrap` or fold it away.
- **Skip-link uses `top: -10rem`.** Works fine; `top: -100px` is more defensive against very-large-rem font settings. (Minor.)
- **`.spacer-column` adds 6 empty DOM nodes** purely for desktop margin (hidden on mobile via `display: none !important`). Replacing with `padding-inline: 4.1667%` on the outer `.pure-g` is equivalent without empty divs. (Out of design scope; flag for backlog.)
- **Random Incantations has no CTA.** Mystic Missives has "View all scrolls"; Allied Mages doesn't need one. Optional: a tiny "Shuffled at dawn" diegetic note would affirm the per-day behavior without exposing implementation. Borderline gold-plating — only if it doesn't break the keystone's quiet.
- **Catalog rubric's `<em>` switches serif→sans italic mid-line** — the comment explains why (no italic IM Fell bundled, synthetic italic is bad craft). Right call; visual transition looks intentional, not like a font-load fallback. Hold.

## Questions to Consider

- *If a reader landed only on the home page and never clicked through, would they understand this is one mage's chronicle, or read as a multi-author blog?* The masthead is the only place "the chronicle" gets named at scale.
- *Does the side scroll deserve to be plated at all?* "Apparatus around the chronicle" in DESIGN.md is doing more work than the rendered surface honors.
- *What does the chronicle look like at 60+ posts, page 4 of 6?* Today pagination has 2 pages; once the all-post-cards-look-alike density grows, does it still read as "a chronicle being inscribed" or shift into "a list"?
