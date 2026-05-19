---
name: The Game Mage
description: A hand-printed plate from an illustrated chronicle — flat ink on dark stock, the design is the world.
colors:
  inkstock: "#0d1310"
  plate: "#13201a"
  glyph-well: "#0a0f0c"
  bone: "#f3ece0"
  hobbit-blue: "#5fa8d3"
  hobbit-green: "#6fb894"
  smaug-red: "#e8694a"
  hairline: "#2c3a32"
typography:
  display:
    fontFamily: "IM Fell English, serif"
    fontSize: "3rem"
    fontWeight: 400
    lineHeight: 1.1
    letterSpacing: "0.01em"
  headline:
    fontFamily: "IM Fell English, serif"
    fontSize: "2rem"
    fontWeight: 400
    lineHeight: 1.2
    letterSpacing: "0.01em"
  title:
    fontFamily: "IM Fell English, serif"
    fontSize: "1.5rem"
    fontWeight: 400
    lineHeight: 1.3
    letterSpacing: "0.01em"
  body:
    fontFamily: "Atkinson Hyperlegible Next, sans-serif"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: 1.65
    letterSpacing: "normal"
  label:
    fontFamily: "Atkinson Hyperlegible Next, sans-serif"
    fontSize: "0.8rem"
    fontWeight: 400
    lineHeight: 1.4
    letterSpacing: "0.04em"
  code:
    fontFamily: "Atkinson Hyperlegible Mono, monospace"
    fontSize: "0.9rem"
    fontWeight: 400
    lineHeight: 1.55
    letterSpacing: "normal"
rounded:
  small: "2px"
  medium: "3px"
  stamp: "2px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "14px"
  lg: "22px"
  xl: "34px"
  xxl: "52px"
  xxxl: "80px"
components:
  card:
    backgroundColor: "{colors.plate}"
    rounded: "{rounded.medium}"
    padding: "34px"
    border: "1px solid {colors.hairline}"
  side-content:
    backgroundColor: "{colors.plate}"
    rounded: "{rounded.medium}"
    padding: "22px"
    border: "1px solid {colors.hairline}"
  link:
    textColor: "{colors.hobbit-blue}"
  tag:
    textColor: "{colors.hobbit-green}"
    rounded: "{rounded.stamp}"
    padding: "3px 9px"
  response-tag:
    textColor: "{colors.smaug-red}"
    rounded: "{rounded.stamp}"
    padding: "3px 9px"
  code-inline:
    backgroundColor: "{colors.glyph-well}"
    textColor: "{colors.bone}"
    rounded: "{rounded.small}"
    padding: "2px 5px"
---

# Design System: The Game Mage

## 1. Overview

**Creative North Star: "The Inked Plate"**

This is a hand-printed color plate, tipped into a fine old book by the one
person who illustrated, set, and bound the whole thing. Not a screen that
lights up; a sheet that was inked. The site is dark because its stock is
ink-saturated, the way a printed night plate is dark, never because a fantasy
"void" is glowing magic out at the reader. A first-time visitor should feel
they have opened a beautifully made book to a full-page plate, and a returning
reader should feel the chronicle has been printed onward, one more plate added
to a book that was always being made.

There is no glow. There is no emanation, no light "from within," no
translucency, no surface floating over another surface. Those were the
discarded reflex and they are deliberately, completely gone. Depth is achieved
the way it is on a real printed plate: flat opaque ink layers, hairline
registration rules, the weight and color of the type, and generous, confident
margins. Light does not move in this world; ink sits where it was set, and it
was set by someone who cared.

The persona is total and diegetic and unchanged: navigation is the
"Teleportation Circle," statuses are "Mystic Missives," pages are "scrolls,"
posts are "Inscribed on." Breaking character anywhere breaks the spell
everywhere.

This system explicitly rejects: the corporate SaaS landing page (no
hero-metric templates, no gradient CTAs, no feature-card grids, no "modern
clean" minimalism); cheesy fantasy kitsch (no faux-parchment, no
dragons-and-Comic-Sans, no Renaissance-faire clip art, no stock wizard
imagery, no blackletter); the sterile monospace-on-white dev blog; overdesign
(no animation overload, no glassmorphism, nothing that fights readability);
and — specific to this rebuild — the first-order fantasy reflex it was born to
escape: deep-purple ground, neon accents, and glow-as-magic. Atmosphere is
built entirely from flat color, printed type, language, and rule — never from
imagery, texture props, or light effects.

**Reference lineage (the three anchors, kept explicit so the system can be
checked against them):**
- **The Hobbit dust jacket** — bold, limited, flat printed inks that
  harmonize; hand-made craft, iconic rather than photoreal. Source of the
  palette and the flatness law.
- **The Disneyland Park lettering** — warm, old, lived-in, enchanted; evokes
  wonder without quoting anyone. Source of the display voice (an evocation, a
  period press face, never the literal font).
- **The 1991 Addams Family** — theatrical near-black and bone, a single
  blood-warm accent, the macabre rendered with joy and play. Source of the
  tonal license: dark held together with delight, unapologetically itself.

**Key Characteristics:**
- Printed, not rendered: flat opaque inks, hard registration, zero glow
- Dark by conviction (ink-saturated stock), never by fantasy reflex
- A committed five-role ink palette anchored on the Hobbit jacket
- A period press display face against a deliberately hyperlegible body face
- Diegetic labeling replaces all conventional UI vocabulary, everywhere
- Depth from ink layer, hairline rule, type weight, and margin — never shadow
  stacks, never blur, never translucency
- Disney-grade invisible craft: every detail right 100% of the time, felt and
  never spotted; reading comfort is non-negotiable craft, not a compromise

## 2. Colors

A committed palette anchored directly on the Hobbit jacket's flat inks —
blue, green, black, bone, and a rare hot red — reversed onto dark stock.
Author every value in OKLCH; reduce chroma toward the lightness extremes; tint
every neutral toward the green-ink hue. The hex values in the token block are
the printed reference, not the authoring format. Never `#000`, never `#fff`.

### Neutral (the stock and the ink we read in)
- **Inkstock** (`#0d1310`): The page ground. A deep, near-black green-tinted
  ink. This is the single most important anti-reflex decision: the ground is
  *not* purple and *not* pure black. Every screen is this stock.
- **Bone** (`#f3ece0`): The reading ink, reversed onto the stock. Warm aged
  off-white — body text, prose, status content. The chronicle is written in
  this. Never pure white.
- **Plate** (`#13201a`): Panels and cards. A flat opaque ink one step up in
  value from the stock. It is a *printed block*, not a translucent pane —
  nothing ghosts through it.
- **Glyph Well** (`#0a0f0c`): The recessed wash behind inline code and `pre`.
  An inked-darker inset, opaque, never a surface.
- **Hairline** (`#2c3a32`): The registration rule. 1px full borders and
  dividers only. Never a thick colored edge.

### Primary
- **Hobbit Blue** (`#5fa8d3`): The cool structural ink. All links, `h1`, and
  most structural rules. A link carries a solid 1px printed underline at rest;
  on hover the ink inverts (blue field, stock-colored glyph) — a stamp
  pressing down, never a glow.

### Secondary
- **Hobbit Green** (`#6fb894`): The warm structural ink, of the same family as
  the stock's undertone so it reads as belonging. `h2`/`h3`, side-panel
  titles, default spell-tag chips, timestamps.

### Tertiary
- **Smaug Red** (`#e8694a`): The rarest, hottest ink — the dragon-and-sun red
  of the jacket, the Addams blood-warmth. Strong emphasis (`strong`), the
  response/reply chips, pagination current-page. High-energy punctuation,
  never structure, never decoration.

### Named Rules
**The Three-Ink Rule.** Blue, green, and red never blend and never trade jobs.
Blue is structure and links; green is section and warmth; red is rare heat. A
screen where red does blue's structural job has lost the print.

**The Inked-Flat Rule.** Every color is a flat, opaque, fully saturated ink.
No gradient, ever. No `background-clip: text`, ever. No translucency on a
content surface, ever. No glow, halo, or text-shadow used as a luminous
effect, ever. If an element needs to feel more present, it is set in a heavier
ink or inverted — it does not light up. This rule supersedes and deletes the
former "Emanation" model in full.

## 3. Typography

**Display Font:** IM Fell English (with `serif` fallback)
**Body Font:** Atkinson Hyperlegible Next (with `sans-serif` fallback)
**Label/Mono Font:** Atkinson Hyperlegible Mono (with `monospace` fallback)

**Character:** A deliberate two-voice pairing. IM Fell English is Igino
Marini's open revival of the 17th-century Fell types — it reads as ink pressed
into old paper by a press that was set by hand, with the slight irregularity
that signals a made object rather than a rendered one. It is the display voice
the Disneyland-Park reference asked for: warm, old, lived-in, enchanted,
evoking wonder without quoting the source. Atkinson Hyperlegible — designed by
the Braille Institute for maximum character distinction — is the readable ink
the chronicle is actually written in. The contrast between the pressed period
display and the hyperlegible body *is* the typographic expression of "wonder
without kitsch" and "legibility is part of the spell." (The display face is a
committed proposal in the spirit of the brief, not a literal copy of the
reference; if a different period press hand serves the plate better, it
substitutes here without disturbing the rest of the system.)

### Hierarchy
- **Display** (IM Fell English, 400, `3rem`, lh 1.1; `2.5rem` ≤768px): The
  site title and post `h1`. Hobbit Blue, flat — no glow.
- **Headline** (IM Fell English, 400, `2rem`, lh 1.2): `h2` post titles.
  Hobbit Green, underlined by a 1px Hairline rule.
- **Title** (IM Fell English, 400, `1.5rem`, lh 1.3): `h3`, side-panel titles
  ("Teleportation Circle," "Mystic Missives"), arcane timestamps. Hobbit
  Green.
- **Body** (Atkinson Hyperlegible Next, 400, `16px`, lh 1.65): All running
  prose. Bone on Inkstock. Cap measure at 65–75ch.
- **Label** (Atkinson Hyperlegible Next, 400, `0.8rem`, tracked `0.04em`):
  Chip/stamp text, status metadata.
- **Code** (Atkinson Hyperlegible Mono, 400, `0.9rem`, lh 1.55): Inline code
  and `pre`.

### Named Rules
**The Press Rule.** IM Fell English is for the pressed line — titles, section
headers, timestamps — never for reading. It must never set a sentence, a
paragraph, or a button. Running text is always Atkinson Hyperlegible.

**The Recolor-Not-Embolden Rule.** Emphasis is carried by ink color at normal
weight, not by heavier strokes. `strong` is Smaug Red at normal weight; `em`
is Hobbit Green at normal weight, italicized. The ink changes color the way a
second pass of the press would, rather than getting heavier.

## 4. Elevation

There is no elevation system, by design. A printed plate has no stack and no
shadow. This section exists to forbid, not to scale.

- **No drop shadows.** Not on cards, not on panels, not anywhere. The former
  "panel float" shadow is deleted.
- **No glow.** No `text-shadow` or `box-shadow` used as a luminous halo. The
  former "text glow" and "contact glow" are deleted.
- **No translucency on content surfaces.** Panels are opaque ink blocks.

### Named Rule
**The Flat-Plate Rule.** Separation between elements is achieved by Hairline
rule, by a one-step change in ink value (Inkstock → Plate → Glyph Well), and
by margin and white space. If an element needs to feel distinct, give it a
rule, a different ink block, or more room — never a shadow, never a blur,
never a lift.

## 5. Components

Every element is set into the page like type into a forme: hard edges, flat
ink, a hairline where a boundary is needed. Interactive feedback is an ink
press (inversion or value shift), never illumination.

### Cards / Containers
- **Corner Style:** Nearly hard (3px, `rounded.medium`). Print has crisp
  corners; the radius only takes the curse off a literal pixel corner.
- **Background:** Plate, opaque. The stock does not show through.
- **Border:** A single 1px Hairline rule on all four sides. Full borders only.
- **Separation Strategy:** Hairline + ink-value step + margin (see the
  Flat-Plate Rule). No shadow.
- **Internal Padding:** Generous — `xl` (34px), tightening to `lg` (22px)
  ≤768px.

### Chips ("Spell-Stamps")
- **Style:** A small printed stamp, not a pill. Near-rectangular (2px,
  `rounded.stamp`), a flat ink-tint fill of its accent at low strength, a 1px
  full hairline of the same accent, accent-colored label.
- **Variants:** `.tag` is Hobbit Green (category/topic). `.response-tag` and
  `.status-link` are Smaug Red (reply/status actions). Each may carry a single
  small printed sigil glyph.
- **State:** On hover the stamp *inks in* — the fill goes to full accent, the
  label flips to Inkstock. A press, not a glow. Honors
  `prefers-reduced-motion` (instant state, no transition).

### Links
- **Style:** Hobbit Blue with a solid 1px printed underline rule at rest.
- **Hover:** The ink inverts — blue field, Inkstock-colored glyph, underline
  removed. ~0.15s ease-out, or instant under reduced motion. No glow.

### Inputs / Fields
- None in the theme today (micro.blog provides comment/reply UI externally).
  Any future field follows the stamp logic: opaque dark fill, 1px Hairline,
  focus = a 2px Hobbit Blue rule (a `:focus-visible` ring, never a browser
  default outline removed without replacement, never a glow, never a left-edge
  stripe).

### Navigation ("Teleportation Circle")
- **Style:** A side-panel list of plain Hobbit Blue links in the standard link
  treatment (printed underline → ink inversion on hover). Titled in IM Fell
  English. Current-page state, when present, is a Smaug Red printed sigil in
  the margin — never a background fill, never a stripe.
- **Mobile:** Aside stacks below main content (PureCSS responsive grid, 768px
  breakpoint).

### Signature Component: The Side Scroll
The `aside` is a stack of titled opaque plates — Teleportation Circle (nav),
Mystic Missives (live omg.lol statuses), Random Incantations (shuffled posts),
Allied Mages (blogroll), Arcane Tags. Each plate: IM Fell English title, a 1px
Hairline rule under the title, body content in Bone. Mystic Missives renders
remote status data with its emoji, italic Hobbit Green timestamps, and a Smaug
Red "View all scrolls" stamp footer. This stack is the strongest expression of
the diegetic-naming principle and stays fully in character.

## 6. Inherited Craft (carried forward, not re-derived)

These are settled correctness requirements harvested from the parked
`design/fj3-designmd-conformance` baseline. They are part of this system from
the first commit; do not rebuild them from zero during craft.

- Honor `prefers-reduced-motion` for every transition and state change.
- `:focus-visible` rings on every interactive element; never strip the default
  outline without an equal or better replacement.
- A working skip link to main content.
- Every accent verified to WCAG 2.1 AA against the ink it sits on (this
  changes hue from the discarded system — re-verify all values, do not assume
  the old contrast math carries over).
- Titled posts must keep their tags (the "titled-posts-lose-their-tags" bug
  stays fixed).
- One shared post-card partial for list and index surfaces (the list/index
  drift consolidation stays).
- Deterministic daily-seed Random Incantations.

## 7. Do's and Don'ts

### Do:
- **Do** sweat the small stuff. Every alignment, hover, wrap, empty state, and
  edge case is right 100% of the time. The Disney audit test: if a reader
  catches a delightful detail "happening," it is too loud. Quiet it until the
  magic is felt, not spotted.
- **Do** keep every label diegetic. Navigation is the "Teleportation Circle,"
  not "Menu"; pages are "scrolls"; posts are "Inscribed on." In-world naming
  over conventional UI vocabulary, always.
- **Do** build atmosphere from flat color, pressed type, language, and rule
  only. The magic lives in the print, never in imagery, texture, or light.
- **Do** keep IM Fell English for the pressed line and Atkinson Hyperlegible
  for everything readable.
- **Do** carry emphasis with ink color at normal weight: Smaug Red `strong`,
  Hobbit Green italic `em`.
- **Do** convey depth with Hairline rule, ink-value step, and margin — never a
  shadow, blur, or lift.
- **Do** keep every accent within its lane per the Three-Ink Rule, and verify
  every value at WCAG 2.1 AA against its ink.

### Don't:
- **Don't** reintroduce glow, emanation, halo, or any luminous `text-shadow` /
  `box-shadow`. This is the discarded reflex; it is a hard ban.
- **Don't** use translucency on a content surface, or let one surface show
  through another. Plates are opaque.
- **Don't** use a `border-left` / `border-right` greater than 1px as a colored
  accent stripe on cards, code, callouts, or list items. Hard ban; full
  borders only.
- **Don't** ship a gradient anywhere, or `background-clip: text`.
- **Don't** use `#000` or `#fff`; the stock is Inkstock and the ink is Bone.
- **Don't** drift the ground toward purple or neon — that is the exact
  first-order fantasy reflex this rebuild exists to escape.
- **Don't** introduce SaaS-landing clichés, cheesy fantasy kitsch (including
  blackletter), monospace-on-white austerity, or overdesign.
- **Don't** set running text, paragraphs, or buttons in IM Fell English.
- **Don't** let Smaug Red do structural work, or recolor it as decoration. It
  is rare hot emphasis only.
