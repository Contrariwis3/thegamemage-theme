---
target: single post / reading page
total_score: 29
p0_count: 0
p1_count: 1
timestamp: 2026-05-21T12-26-45Z
slug: layouts-post-single-html
---
# Critique — Single Post / Reading Page (round 2, post-distill/quieter/polish)

**Target:** `layouts/post/single.html` (rendered: `testsite/public/post/real-post/`)
**Register:** brand · **System:** The Inked Plate

## Anti-Patterns Verdict

**Deterministic scan:** clean across all four post variants. No new findings.

**LLM assessment:** the prior round's P0/P1 findings are visibly resolved — the foot apparatus is described as "Subtraction at the foot" (3 zones, not 5), the em recolor as "Disciplined ink restraint," the ghost AA as "explicit about AA and shows real care." The page reads as solid second-pass work.

## Design Health Score

| # | Heuristic | Score | Δ |
|---|---|---|---|
| 1 | Visibility of System Status | 3 | = |
| 2 | Match System / Real World | 4 | = |
| 3 | User Control and Freedom | 3 | = |
| 4 | Consistency and Standards | 3 | = |
| 5 | Error Prevention | 3 | = |
| 6 | Recognition Rather Than Recall | 3 | −1 |
| 7 | Flexibility and Efficiency | 2 | = |
| 8 | Aesthetic and Minimalist Design | 3 | +1 |
| 9 | Error Recovery | 3 | = |
| 10 | Help and Documentation | 2 | −1 |
| **Total** | | **29/40** | **−1** |

Per-row deltas net to roughly noise (a different reviewer reading the same surface). The aesthetic bump (+1) tracks the foot subtraction; the help/docs and recognition slips reflect a different reviewer being marginally harsher, not a regression.

## What's Working

- The incipit composition reads as one inked plate: cartouche + frontispiece title + green timestamp + closing cartouche, with the `:has(+ .arcane-timestamp)` margin pull (`frontend/sass/main.scss:559`) doing exactly the invisible-craft work the keystone asks for.
- The foot subtracted: `.colophon` + `.post-coda` (tag chips + reply chip on one composed row) + `.post-footnav`. Three zones, not five.
- Disciplined ink restraint in running prose — italic Bone `em`, Smaug Red `strong`, Hobbit Blue links, Glyph Well `code`. Two accent inks max in a dense paragraph.
- The chronicle navigation grid (`:679–721`) keeps "Return to the chronicle" optically centered whether the back/forward slots are live or ghosts. Ghost opacity 0.6 documented for AA.

## Priority Issues

### [P1] Drop cap reads as a second wonder-moment after the title plate
The title plate is the C; the body should recede into B. A 5em Smaug Red press-serif initial fires 80–120px below the cartouche — a second wonder-moment, in the system's rarest hot ink, on every titled post. **Status: previously discussed; operator chose to keep the cap and fix only the selector fragility (which is done). Carrying as an ignore-list candidate.**

### [P2] 70ch centered-apparatus monotony
Title plate, post-coda, foot-nav all centered on the same 70ch axis; prose is the only left-aligned zone. The apparatus dominates by count of centered zones even if individually quiet. **Fix:** left-align `.post-coda` and `.post-footnav` to the reading column's left edge. Keep the title plate centered as the *one* centered moment. The contrast makes the plate feel more composed by isolation. **`/impeccable layout`** on the foot zones.

### [P2] Article-foot colophon SVG sits in dead air
60px hairline fleuron between the last paragraph and the post-coda, doing no compositional work. **Status: previously discussed; operator chose to keep it. Carrying as an ignore-list candidate.**

### [P2] `text-wrap: balance` at frontispiece clamp can stack long titles
`clamp(3rem, 5vw + 1rem, 6rem)` on a 15-word title can produce 5–6 stacked lines of 6rem press serif on desktop, pushing the body two screens down on mobile. **Fix:** cap the clamp at ~4.5rem, add a 768px media reduction, consider a `line-clamp` guard with graceful tail overflow. **`/impeccable harden`** on the title plate.

### [P3] Skip link uses press face on an accessibility-critical control
`.skip-link` (`:1200–1217`) is IM Fell English at 1.15rem. Persona over speed-to-comprehension on a utility path. **Fix:** switch to `face(body)` italic Hobbit Blue (Atkinson Hyperlegible); keep border and diegetic phrasing. **`/impeccable harden`** on the a11y path.

## Cognitive Load Assessment
**Moderate.** Body is low-load (Atkinson at 1.125rem/1.65, 70ch, two accent inks max). Page-level load is moderate because the foot stacks four centered zones (colophon, post-coda, foot-nav, site footer) and the head competes between cartouche-bracket + frontispiece title + drop cap.

## Persona Red Flags

**Wanderer (first arrival).** Deep-link from a micro.blog timeline. Sees engraved cartouche → frontispiece title → "Inscribed on" date → second cartouche → red drop cap → prose. The brief deliberately omits the masthead from reading pages — but the URL is the only context a web reader has. They never see the site name "The Game Mage" above the fold; the author signature is in the footer. Worth deciding: smallest possible wordmark that doesn't break the tipped-in plate metaphor (a pressed `<small>` above the top cartouche; or replacing "Return to the chronicle" with "Return to The Game Mage").

**Returning chronicler.** Apparatus repeats identically per post — drop cap fixed, post-coda fixed, foot-nav identical. After 30 reads, the drop cap and the colophon-then-coda-then-footnav stack start to read as ceremonial. Variability would help; nothing surfaces as evolving.

## AI-Slop Verdict
**First-order: clear.** Specific committed plate aesthetic with named inks, a specific press face, diegetic vocabulary. Not a category-default.

**Second-order: borderline.** The editorial-magazine kit (display serif, italic em, drop cap, ruled separators, centered title plate) is fully deployed. Mostly earned by the diegetic labels and the specific palette. The drop cap is the one element that, if removed, would make the kit's remaining deployment feel more deliberate by subtraction.

## Provocative Questions

1. **Should the reading page carry a smallest-possible wordmark?** A pressed `<small>` above the top cartouche reading "from The Game Mage chronicle, no. 47" feels more like a real plate's caption than absence does.
2. **What if the drop cap moved from "every reading page" to "only the first post of each month / chapter"?** Rare hot moments are the Smaug Red discipline; the cap currently isn't rare.
3. **What if the reply chip were italic body-voice instead of a stamp?** "Reply to this inscription by raven" in Smaug-Red italic, below the green tag row. Smaug Red is supposed to be rare hot emphasis, never structure — and a reply chip *is* structure.

## Minor Observations
- `.reading-body img` has no framing — content images sit raw on Inkstock. Worth deciding whether a 1px Hairline frame would honor the printed-plate register.
- `.arcane-timestamp` is defined twice (line 484 base, line 564 nested in `.title-plate`); the nested one repeats family/size/color. Tighten by deleting the redundant overrides.
- `.incipit-reply` uses `opacity: 0.78` on Bone — verified well clear of AA.
- The `time` `white-space: nowrap` could push the cartouche past column edge on iPhone SE width with a long localized date. Worth testing.
