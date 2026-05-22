---
target: side scroll (signature aside component)
total_score: 28
p0_count: 0
p1_count: 2
timestamp: 2026-05-22T01-27-33Z
slug: layouts-partials-side-scroll-html
---
# Critique: The Side Scroll (signature aside component)

Scope: the `<aside>` "side scroll" across home, section, taxonomy term, and taxonomy index. Reviewed source (`side-scroll.html`, `baseof.html`, `main.scss` side-scroll rules) + rendered HTML. Two independent assessments (LLM review + deterministic detector) run blind to each other. Mystic Missives was populated from the live omg.lol fetch in this build.

## Design Health Score

| # | Heuristic | Score | Key issue |
|---|-----------|-------|-----------|
| 1 | Visibility of System Status | 2 | No current-page indicator in the Teleportation Circle; the DESIGN.md §5 Smaug-Red margin sigil is unimplemented. |
| 2 | Match System / Real World | 4 | Diegetic naming is fluent and in-register across all five panels. |
| 3 | User Control and Freedom | 3 | Clean exits; "View older missives" off-ramp well placed. |
| 4 | Consistency and Standards | 3 | Title+rule pattern uniform; three internal grammars (lists, stamp grid, missive notes) in one column. |
| 5 | Error Prevention | 4 | Read-only surface; template guards keep empty/broken panels from rendering. |
| 6 | Recognition vs Recall | 3 | Everything visible and labeled; the flip side is maximal visibility (20+ links, no disclosure). |
| 7 | Flexibility and Efficiency | 2 | No accelerators; no collapse on the long mobile tail. |
| 8 | Aesthetic and Minimalist | 2 | Five same-weight panels; nothing recedes. The component's weakest axis. |
| 9 | Error Recovery | 2 | omg.lol fetch failure degrades to *nothing* — panel vanishes silently. |
| 10 | Help and Documentation | 3 | Self-evident apparatus; par for the genre. |
| **Total** | | **28/40** | **Good (lower edge).** Weak axes cluster on two problems: no inter-panel hierarchy, and a missing spec'd feature. |

## Anti-Patterns Verdict

**Does this look AI-generated? No — authored, intentional work.** Every CSS block carries a load-bearing rationale comment recording why a prior approach was rejected; that decision-archaeology is the signature of human iteration, not a generator.

**Hard-ban audit (authored side-scroll CSS/HTML): ALL CLEAR.** No glow/shadow/filter, no gradient, no translucency on content surfaces (the only `rgba()` is the documented 6% chip tint), no side-stripe (panels carry no left/right border; `.side-title` uses `border-bottom`, `.status-footer` `border-top`), no `#000`/`#fff` (all via `ink()` tokens), press face on titles only, and the missive date is a spaced plain hyphen (`" - "`), not an em-dash.

**Deterministic scan — important methodology finding.** The rendered files link the stylesheet as a root-absolute `/styles.css?0`, which the detector's jsdom **cannot resolve**, so its CSS-level checks (gradients/glows/glassmorphism/etc.) silently pass against an *empty* stylesheet. The as-instructed runs returned a **hollow** `[]` — "no CSS examined," not "no problems." Re-run with a resolvable relative CSS path, the only finding was `overused-font: arial` ×4 — a jsdom font-fallback artifact (web @font-face faces aren't loaded by jsdom; the real stack is Atkinson / IM Fell), confirmed false positive. A direct grep confirmed the compiled CSS's one gradient and four box-shadows are all vendored normalize/PureCSS, none in authored card or aside styling. Net: with CSS actually loaded, authored markup and styles are clean of all 27 patterns — but the CSS-ban verification that matters came from reading the SCSS directly, not from the detector. Future runs should scan with the stylesheet at a resolvable path.

## Overall Impression

The single most important thing this component had to get right, it gets right: the **unboxing**. Removing plate fill and border genuinely subordinates the aside to the bordered post-card catalog, so the cards stay the page's visual primary and the margin reads as bare ink. The rationale is documented and the type judgment (title-above-its-own-rule) is craft-grade. What holds it back is the other half of "margin notes": five panels at identical weight read as a uniform 20-link wall rather than quiet, varied marginalia, and the one piece of the signature component the standing spec explicitly prescribes — the current-page sigil — isn't built.

## What's Working

1. **The unboxing is correct and documented** (`main.scss:1134-1152`). Plate fill/border removed; cards keep their hairline frames, the margin is bare ink. The "chronicle on the left, apparatus in the margin" hierarchy holds at the boxing level.
2. **Title-above-its-own-rule** (`main.scss:1179-1187`) is the right printed convention — green press title as the dominant section signal, hairline as its underline; the team correctly rejected the hairline-above variant.
3. **Tap-target discipline** is quietly excellent — padding moved into the `<a>` as `display:block`, `%stamp-base` bumping to 36px min-height under coarse pointers. Served without a visible "look, accessibility" seam.

## Priority Issues

- **[P1] The Teleportation Circle current-page sigil is unimplemented (spec gap).** DESIGN.md §5 prescribes a Smaug-Red printed margin sigil for the current page (no fill, no stripe); `side-scroll.html:14-20` ranges the menu with no `IsMenuCurrent`/`HasMenuCurrent` check, and there's no current-state CSS. It's the Heuristic-1 deduction and the one piece of the signature component that contradicts the standing spec. Fix: add the `IsMenuCurrent` guard, emit a current class, render the existing four-point `.sigil` SVG in Smaug Red before the current item — and carry `aria-current="page"` so the cue isn't color-only.
- **[P1 / decision] No visual hierarchy among the five panels, and the aside is maximal.** Five same-weight panels stack as a 20+ link wall with no progressive disclosure; Arcane Symbols (12) and Allied Mages (8) blow the ≤4 chunk rule; cognitive load scores 4/8 (HIGH). This is the keystone charge — apparatus that should be quiet marginalia reads as a second primary surface. **But there's a real counter-argument the reviewer raised and FJ#7 itself asks:** marginalia in a printed book *is* uniform (same hand, same ink running down the margin), so a designed weight-gradient could read as *less* book-like, not more. This is the component's central fork, not a settled defect. Fix depends on the answer: either a quiet weight gradient (navigational panels lead, reference panels recede) and/or capping the at-rest reveal (4 items + an off-ramp); or accept uniformity as the marginal-hand and instead address the load by trimming what shows on mobile. Do not re-box to solve it — that re-breaks the unboxing win.
- **[P2] The omg.lol fetch failure degrades to nothing.** On `$result.Err` the partial logs `warnf` and renders no Missives panel (`side-scroll.html:26-27`). "A journey, lived-in and continuous" breaks when a panel a returning reader knows silently vanishes. The new `.empty-scroll` custodial voice exists for exactly this. Fix: in the error branch, render the Missives title plus one `.empty-scroll`-voiced italic-green line ("The missives are resting…" or similar) instead of nothing.
- **[P2] Mystic Missives composition relies on inline-ifying block `<div>`s.** `.status-content` is a `<div>` forced to `display:inline` (`side-scroll.html:46`, `main.scss:1212-1220`), with the `<time>` a whitespace-separated sibling. It reads correctly as a margin note today (the prior stacked-feed failure is genuinely fixed), but the result rests on coercing block elements inline — fragile against any future reset/specificity change, and the keystone bar is "right 100% of the time." Fix: author the content as an inline `<span>` inside a single wrapper so the inline flow is structural; add `overflow-wrap: break-word` (which `.status-content` lacks, unlike `.prose`) so a `safeHTML` status carrying a long URL or @-mention can't push the narrow column.
- **[P3] Arcane Symbols repeats the post-foot `.tag` furniture verbatim.** On a section/term page the same green stamp appears in two card feet and again in the margin, tipping toward repeated furniture rather than legend. Judgment call: lean into it as a deliberate legend (a one-line italic-green caption, "Every sigil in the chronicle") so the repetition reads as index-by-design, or accept it.

## Persona Red Flags

- **Sam (a11y):** Current-page state is conveyed by *nothing* at all (worse than color-only) — when the P1 sigil is added it MUST carry `aria-current`, not color alone. The four non-nav `.side-title`s are `<div>`s, not headings/landmarks (only Teleportation Circle has `<nav aria-label>`), so a heading-jumping user gets no structure for Missives/Incantations/Allied Mages/Arcane Symbols. Contrast and focus-visible rings pass AA.
- **Casey (mobile):** Below 768px the aside is `pure-u-1` and stacks full-width below all content — a 20+ link wall with no collapse and no jump-back. The 52px inter-panel gap gives air but doesn't shorten the scroll. Tap targets are well sized once she's there.
- **Riley (edge cases):** omg.lol down → panel vanishes with no trace; `.status-content` passes omg.lol markup through `safeHTML` with no overflow-wrap guard, so a long URL in a status would push the narrow column.
- **Unhurried atmosphere-seeker:** The uniform five-panel wall is what dispels atmosphere — marginalia that's *felt* lets the eye drift; a same-weight 20-link stack asks to be *processed*. The boxing is right; the rhythm isn't yet.
- **Returning recognizer:** This reader is the one who notices Missives vanishing when omg.lol is down, and for whom Arcane Symbols' verbatim stamp repetition reads as furniture, not legend. Both bite hardest for the persona the brief most wants to reward.

## Minor Observations

- Random Incantations' per-day md5 shuffle is a genuine invisible-craft touch — same-day returnees see a stable three, the morning brings a fresh shuffle. Felt, not spotted.
- Single-nav-item Teleportation Circle (fixture sparseness) makes the grand title look oversized over one "Home" link; the template is sound — judged accordingly.
- The `.status-time::before " - "` renders fine but the `<time>` also carries incidental template whitespace; the spacing is correct by accident rather than control.

## Provocative Questions

1. **Is uniformity the enemy, or the genre?** Real marginalia is one consistent hand running down the margin. A designed weight-gradient could read as *less* book-like. Deciding "margin notes = varied importance" vs "one consistent marginal hand" changes the hierarchy fix entirely.
2. **Should the aside exist on mobile in this form?** A 20-link full-width tail below the content may be the wrong mobile expression of "margin." A collapsed/summary form, or dropping the reference panels below the breakpoint, might serve the keystone better than faithfully stacking everything.
3. **Does Mystic Missives want to be the one plated element?** It's the only panel with genuine prose (the author's voice) rather than navigation. Plating it alone would give the column a single primary and solve the hierarchy problem — counter to the brief's "all marginalia," but the tension worth naming.
