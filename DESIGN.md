---
name: The Game Mage
description: A lived-in spellbook — a personal blog where the design is the world.
colors:
  nightshade-void: "#1a0533"
  mana-teal: "#3fa3a3"
  ember-gold: "#d99141"
  spellfire-magenta: "#e31bce"
  ghost-script: "#f8f8ff"
  scroll-surface: "#0c0318cc"
  glyph-well: "#0000004d"
typography:
  display:
    fontFamily: "Berkshire Swash, cursive"
    fontSize: "3rem"
    fontWeight: 400
    lineHeight: 1.1
    letterSpacing: "normal"
  headline:
    fontFamily: "Berkshire Swash, cursive"
    fontSize: "2rem"
    fontWeight: 400
    lineHeight: 1.2
    letterSpacing: "normal"
  title:
    fontFamily: "Berkshire Swash, cursive"
    fontSize: "1.5rem"
    fontWeight: 400
    lineHeight: 1.3
    letterSpacing: "normal"
  body:
    fontFamily: "Atkinson Hyperlegible Next, sans-serif"
    fontSize: "16px"
    fontWeight: 400
    lineHeight: 1.6
    letterSpacing: "normal"
  label:
    fontFamily: "Atkinson Hyperlegible Next, sans-serif"
    fontSize: "0.8rem"
    fontWeight: 400
    lineHeight: 1.4
    letterSpacing: "normal"
  code:
    fontFamily: "Atkinson Hyperlegible Mono, monospace"
    fontSize: "0.9rem"
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: "normal"
rounded:
  small: "4px"
  medium: "8px"
  pill: "20px"
spacing:
  xs: "3px"
  sm: "5px"
  md: "10px"
  lg: "15px"
  xl: "20px"
  xxl: "30px"
  xxxl: "40px"
components:
  card:
    backgroundColor: "{colors.scroll-surface}"
    rounded: "{rounded.medium}"
    padding: "30px"
  side-content:
    backgroundColor: "{colors.scroll-surface}"
    rounded: "{rounded.medium}"
    padding: "20px"
  link:
    textColor: "{colors.mana-teal}"
  tag:
    textColor: "{colors.ember-gold}"
    rounded: "{rounded.pill}"
    padding: "3px 10px"
  response-tag:
    textColor: "{colors.spellfire-magenta}"
    rounded: "{rounded.pill}"
    padding: "3px 10px"
  code-inline:
    backgroundColor: "{colors.glyph-well}"
    textColor: "{colors.ghost-script}"
    rounded: "{rounded.small}"
    padding: "2px 4px"
---

# Design System: The Game Mage

## 1. Overview

**Creative North Star: "The Lived-In Spellbook"**

This is a grimoire someone actually writes in. Not a museum artifact behind
glass, not a launch page: a deep, worn, faintly glowing book that gets opened
nightly and inscribed in. The whole system reads as continuity and atmosphere
rather than polish. A first-time visitor should understand within one screen
that they have stepped into a crafted world with a voice, and a returning
reader should feel the chronicle picking up where it left off.

Every surface is the deep Nightshade Void of the page ground, faintly textured
with an interlocking arcane glyph at 6% opacity. Light does not fall onto this
world from above; it emanates from within it. Headings and links glow. Content
sits on translucent dark "scroll" surfaces that float over the ground rather
than casting hard shadows onto it. The persona is total and diegetic:
navigation is the "Teleportation Circle," statuses are "Mystic Missives,"
pages are "scrolls," posts are "Inscribed on." Breaking character anywhere
breaks the spell everywhere.

This system explicitly rejects the corporate SaaS landing page (no hero-metric
templates, no gradient CTAs, no feature-card grids, no "modern clean"
minimalism), cheesy fantasy kitsch (no faux-parchment textures, no
dragons-and-Comic-Sans, no Renaissance-faire clip art, no stock wizard
imagery), the sterile monospace-on-white dev blog, and overdesign (no
animation overload, no decorative glassmorphism, nothing that fights
readability). The atmosphere is built entirely from color, type, language, and
light — never from props.

**Key Characteristics:**
- Disney-grade invisible craft: delight is felt, never spotted; the system is
  defined by the absence of friction, jank, and visible seams
- Luminous, not lifted: depth from glow and translucency, not heavy shadows
- Fully diegetic labeling — in-world names replace all conventional UI vocabulary
- Committed dark palette: one deep ground, three saturated arcane accents
- Decorative display script paired with a deliberately hyperlegible body face
- Tactile, responsive interactive elements that glow on contact
- Reading comfort is non-negotiable craft, not a compromise on the aesthetic

## 2. Colors

A committed palette: one deep purple ground carries the entire surface, lit by
three saturated arcane accents used in strict role separation.

### Primary
- **Mana Teal** (`#3fa3a3`): The system's calm light. All links, `h1` and `h3`
  headings, side-panel titles, the glyph-well accent on code, and most
  hairline dividers. The most-used accent; it reads as the ambient magic of
  the place. Links carry a dotted teal underline that solidifies and gains a
  teal glow on hover.

### Secondary
- **Ember Gold** (`#d99141`): Warm counterpoint to the teal. `h2` headings and
  their underline rule, blockquote accents, emphasis text (`em`), the default
  "spell-tag" chips, and timestamp text. The hearth-light of the study.

### Tertiary
- **Spellfire Magenta** (`#e31bce`): The rarest, hottest accent. Reserved for
  strong emphasis (`strong`), the response/reply chips, status-link chips,
  pagination page numbers, and the timestamp icon. High-energy punctuation,
  never structure.

### Neutral
- **Nightshade Void** (`#1a0533`): The page ground. Every screen is this deep
  desaturated purple, overlaid with an interlocking glyph SVG at 6% opacity in
  a warm ash tone. Never `#000`.
- **Ghost Script** (`#f8f8ff`): Body text, header/footer prose, status
  content. A faintly cool off-white — the ink. Never pure `#fff`.
- **Scroll Surface** (`rgba(12, 3, 24, 0.8)`, `#0c0318cc`): Translucent darker
  panel behind cards and side-content. Lets the ground glyph ghost through so
  surfaces float rather than stack.
- **Glyph Well** (`rgba(0, 0, 0, 0.3)`, `#0000004d`): The recessed wash behind
  inline code and `pre` blocks. An inset, not a surface.

### Named Rules
**The Three-Flame Rule.** Teal, gold, and magenta never blend and never trade
jobs. Teal is ambient structure and links; gold is warmth and section
headings; magenta is rare hot emphasis. A screen where magenta does teal's job
has lost the spell.

**The Emanation Rule.** Color is never applied as a flat fill on large areas.
Accents arrive as text, hairline borders, glow, or small tinted chips against
the Nightshade ground. The darkness is the canvas; the magic is the light on
it.

## 3. Typography

**Display Font:** Berkshire Swash (with `cursive` fallback)
**Body Font:** Atkinson Hyperlegible Next (with `sans-serif` fallback)
**Label/Mono Font:** Atkinson Hyperlegible Mono (with `monospace` fallback)

**Character:** A deliberate two-voice pairing. Berkshire Swash is the
hand-inked spell-script: ornate, warm, used only for display moments.
Atkinson Hyperlegible — designed by the Braille Institute for maximum
character distinction — is the readable ink the chronicle is actually written
in. The contrast (flourish for headings, clarity for reading) is the typographic
expression of "wonder without kitsch."

### Hierarchy
- **Display** (Berkshire Swash, 400, `3rem`, lh 1.1; `2.5rem` ≤768px): The
  site title and post `h1`. Teal, with a soft teal glow.
- **Headline** (Berkshire Swash, 400, `2rem`, lh 1.2): `h2` post titles. Gold,
  underlined by a 1px gold hairline at 30% opacity.
- **Title** (Berkshire Swash, 400, `1.5rem`, lh 1.3): `h3`, side-panel titles
  ("Teleportation Circle," "Mystic Missives"), arcane timestamps. Teal.
- **Body** (Atkinson Hyperlegible Next, 400, `16px`, lh 1.6): All running
  prose. Ghost Script on Nightshade. Cap measure at 65–75ch.
- **Label** (Atkinson Hyperlegible Next, 400, `0.8rem`): Chip/tag text, status
  metadata.
- **Code** (Atkinson Hyperlegible Mono, 400, `0.9rem`, lh 1.5): Inline code
  and `pre` blocks.

### Named Rules
**The Inscription Rule.** Berkshire Swash is for inscription, never for
reading. It appears on titles, section headers, and timestamps only. It must
never set a sentence, a paragraph, or a button. Running text is always
Atkinson Hyperlegible.

**The Recolor-Not-Embolden Rule.** Emphasis is carried by color, not weight.
`strong` is Spellfire Magenta at normal weight; `em` is Ember Gold at normal
weight, italicized. The ink changes color like a charged glyph rather than
getting heavier.

## 4. Elevation

Luminous, not lifted. This system conveys depth through glow and translucency
against the dark ground, not through a stacked-shadow hierarchy. There is no
shadow scale. Surfaces are translucent panels that let the ground texture
ghost through; the only "light" is emitted by type and interactive elements,
not cast by surfaces onto each other.

### Shadow Vocabulary
- **Panel float** (`box-shadow: 0 10px 20px rgba(0,0,0,0.2)`): A single soft,
  diffuse shadow under `.card` only. Reads as the scroll resting just above
  the ground, not as a lifted Material card.
- **Contact glow** (`box-shadow: 0 3px 8px rgba(<accent>, 0.2)`): Appears on
  chip hover, tinted with that chip's own accent. Light responding to touch.
- **Text glow** (`text-shadow: 0 0 10px rgba(<accent>, 0.3–0.5)`): On `h1` and
  on links at hover. The signature emanation. The intensity rises on
  interaction.

### Named Rules
**The Emanation-Over-Elevation Rule.** Never add a shadow to imply stacking or
hierarchy. Depth comes from glow intensity and surface translucency. If an
element needs to feel "higher," it glows more, it does not cast a darker
shadow.

## 5. Components

Tactile and arcane: elements feel hand-set into the page and faintly lit, with
confident interactive feedback. Contact produces glow.

### Cards / Containers
- **Corner Style:** Gently rounded (8px, `rounded.medium`).
- **Background:** Scroll Surface (`rgba(12,3,24,0.8)`), ground glyph ghosting
  through.
- **Shadow Strategy:** Single soft *panel float* (see Elevation). Side-content
  panels carry no shadow at all — flatter, quieter.
- **Internal Padding:** Generous — `xxl` (30px), tightening to `xl` (20px)
  ≤768px.
- **Note (debt):** `.card`, `code`, `pre`, `.side-title`, and several dividers
  currently use a 3px colored `border-left` accent (`@mixin accent-border`).
  This is a flagged anti-pattern (see Don'ts) slated for replacement with full
  hairline borders or background tints. Document, do not propagate.

### Chips ("Spell-Tags")
- **Style:** Pill (20px radius), tinted background of the accent at ~15–20%
  opacity, accent-colored label, transparent 1px border at rest.
- **Variants:** `.tag` is Ember Gold (category/topic). `.response-tag` and
  `.status-link` are Spellfire Magenta (reply/status actions). Each is
  prefixed with a Phosphor sparkle/scroll icon.
- **State:** On hover the border takes the accent color and a matching
  *contact glow* appears. Tactile, immediate.

### Links
- **Style:** Mana Teal with a 1px **dotted** teal bottom border at rest.
- **Hover:** Border goes solid; a teal text-glow ignites. 0.2s ease.

### Inputs / Fields
- None in the theme today (micro.blog provides comment/reply UI externally).
  Any future field should follow the chip logic: dark translucent fill, 1px
  teal hairline, focus = teal glow (not a browser default outline), never a
  left-edge stripe.

### Navigation ("Teleportation Circle")
- **Style:** A side-panel list of plain teal links in the standard link
  treatment (dotted underline → solid + glow on hover). Titled in Berkshire
  Swash. No active/current state today; if added, use a gold marker, not a
  background fill or left stripe.
- **Mobile:** Aside stacks below main content (PureCSS responsive grid,
  768px breakpoint).

### Signature Component: The Side Scroll
The `aside` is a stack of titled translucent panels — Teleportation Circle
(nav), Mystic Missives (live omg.lol statuses), Random Incantations (shuffled
posts), Allied Mages (blogroll), Arcane Tags. Each panel: Berkshire Swash
title, teal hairline under the title, body content in Ghost Script. The Mystic
Missives panel renders remote status data with emoji, italic gold timestamps,
and a magenta "View all scrolls" chip footer. This stack is the strongest
expression of the diegetic-naming principle and must stay fully in-character.

## 6. Do's and Don'ts

### Do:
- **Do** sweat the small stuff. Every alignment, hover, wrap, empty state, and
  edge case is right 100% of the time. The Disney audit test: if a reader
  catches a delightful detail "happening," it is too loud. Quiet it until the
  magic is felt, not spotted.
- **Do** keep every label diegetic. Navigation is the "Teleportation Circle,"
  not "Menu"; pages are "scrolls"; posts are "Inscribed on." In-world naming
  over conventional UI vocabulary, always.
- **Do** build atmosphere from color, type, language, and glow only. The magic
  lives in the system, never in imagery or texture props.
- **Do** keep Berkshire Swash for inscription (titles, headers, timestamps)
  and Atkinson Hyperlegible for everything readable.
- **Do** carry emphasis with color at normal weight: magenta `strong`, gold
  italic `em`.
- **Do** convey depth with glow intensity and translucency, never a shadow
  stack.
- **Do** meet WCAG 2.1 AA contrast for every accent on the Nightshade ground,
  and honor `prefers-reduced-motion` for all glow/transition effects (the code
  does not do this yet — it is required, not optional).
- **Do** keep accents in their lanes per the Three-Flame Rule.

### Don't:
- **Don't** use a `border-left` / `border-right` greater than 1px as a colored
  accent stripe on cards, code, callouts, or list items. This is a hard ban.
  The existing `@mixin accent-border` usages are debt to remove, not a pattern
  to extend.
- **Don't** introduce SaaS-landing clichés: no hero-metric templates, no
  gradient CTAs, no feature-card grids, no "modern clean" minimalism.
- **Don't** drift into cheesy fantasy kitsch: no faux-parchment textures, no
  dragons-and-Comic-Sans, no Renaissance-faire clip art, no stock wizard
  imagery.
- **Don't** turn this into a sterile monospace-on-white dev blog. Atmosphere
  and personality outrank austerity.
- **Don't** overdesign: no animation overload, no decorative glassmorphism, no
  effect that fights readability. Restraint *within* the world.
- **Don't** set running text, paragraphs, or buttons in Berkshire Swash.
- **Don't** use `#000` or `#fff`; the ground is Nightshade Void and the ink is
  Ghost Script.
- **Don't** let magenta do teal's structural job, or recolor it as decoration.
  It is rare hot emphasis only.
- **Don't** ship gradient text (`background-clip: text`) or any effect that
  reads as "AI made that."
