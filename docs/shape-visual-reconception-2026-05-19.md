# Shape Brief — Visual Reconception (Inked Plate), Reading Core

ABOUTME: Confirmed impeccable shape brief for reshaping the theme's reading
ABOUTME: core to the Inked Plate system; design-track per-effort spec (FJ#4).

Standing spec: `PRODUCT.md` + `DESIGN.md` ("The Inked Plate"). This brief is
the per-effort contract for the first craft pass. Design-track only
(impeccable) — not OpenSpec/beads. FJ#4.

## 1. Feature Summary

Reshape the Game Mage Hugo theme's **single-post reading surface** to the
Inked Plate system. This surface is the proving ground: it is where "a
top-tier reading experience" is won or lost, and it sets the standard the
rest of the theme conforms to in a later, separate craft pass ("reading core
first, then propagate").

## 2. Primary User Action

Read a post comfortably, and on arrival feel transported — that they have
opened a well-kept book, not loaded a blog. Continuity for returnees;
immediate "this is a crafted world" for first-timers.

## 3. Design Direction

- **Color strategy:** Committed — one deep ink ground (Inkstock `#0d1310`)
  carries the surface; the three flat inks (Hobbit Blue / Hobbit Green /
  Smaug Red) in strict role separation per the Three-Ink Rule. No glow, no
  gradient, no translucency (Inked-Flat Rule).
- **Theme scene sentence (forces dark):** *A returning reader, late evening,
  low light, unhurried, opening the chronicle on a phone to read the newest
  entry the way you would open a well-kept book by lamplight.*
- **Anchor references:** the three confirmed physical references (the Hobbit
  dust jacket; the Disneyland Park lettering, evoked via an antique press
  face, never quoted; the 1991 Addams Family) + the Inked Plate north-star in
  DESIGN.md.
- **Ornament topology (probe synthesis — the winning direction):** the
  reading core is **C-incipit on a B-calm body**: one concentrated engraved
  wonder-moment at the head, then the page recedes into austere,
  edge-crafted reading. **A** (tipped-in-plate framing) is used *sparingly*
  and opt-in, default subtle. **D** (accreted chronicle apparatus,
  journey-spine) is explicitly **out of scope here** and reserved for the
  later non-reading surfaces (home / index / journey view) where it does not
  compete with body text.

## 4. Scope

- **Fidelity:** production-ready (real theme code, shipped quality).
- **Breadth:** the single-post template; the **shared post-card partial**
  it implicates (list/index drift consolidation — a listed keeper); and the
  **global SCSS token + ornament layer** the system sits on (ink/type/space
  tokens, the code-native ornament vocabulary). The system layer is shared,
  so reading-core-first still requires laying that foundation.
- **Out of scope (second pass):** full reshape of home/index/aside/pagination
  beyond what the shared post-card partial and token layer require; the D
  apparatus; 404/empty surfaces.
- **Interactivity:** shipped-quality. **Time intent:** polish until it ships
  — this is the standard-setter, not an exploration.

## 5. Layout Strategy

- **The incipit (arrival wonder, C):** a concentrated engraved title zone —
  post title in the press face, an engraved cartouche rule, a single
  decorated initial that is the one Smaug-Red moment on the surface, the
  diegetic "Inscribed on the Nth day…" line. This is the only place wonder
  is allowed to be near-visible, and even here it must pass the keystone
  audit ("if you notice it happening, quiet it").
- **The body (B):** austere. Bone on Inkstock, measure 65–75ch, generous
  asymmetric margins, ornament banished to the edges — corner registration
  marks, hairline section rules, a foot colophon/folio. Atkinson
  Hyperlegible running text; the press face never sets running text.
- **A, sparingly:** an optional single-weight hairline plate frame on the
  page, implemented as an opt-in token defaulting subtle; dropped entirely
  if it cannot stay felt-not-spotted.
- **Ornament is a reusable code-native vocabulary**, not one-offs: a small
  authored set of inline-SVG fleurons / sigils / registration marks + CSS
  rules, defined as a partial + token set. Zero raster. Committed in-theme.

## 6. Key States

Default post; very long post (measure holds, no sticky furniture, no
overflow at any width); short post; **titled post and untitled post — tags
survive both** (the titled-posts-lose-their-tags keeper); post with code
(Glyph Well + mono); post with blockquote; post with many tags (spell-stamps
wrap gracefully); `prefers-reduced-motion` (every transition neutralized);
keyboard focus (`:focus-visible` rings on all interactive elements, skip-link
to main); mobile ≤768px (single column, incipit scales down, ornament
density reduces, never clips).

## 7. Interaction Model

Links: ink-invert on hover (blue field, Inkstock glyph), no glow;
`:focus-visible` 2px Hobbit-Blue rule. Spell-stamps: ink-in on hover.
`prefers-reduced-motion` → instant state, no transition. No hover-only
information. The reading experience requires no JavaScript. Deterministic
daily-seed Random Incantations is a carried keeper implemented where it lives
(server-side Hugo), not on the post-read critical path.

## 8. Content Requirements

Diegetic strings only, wired to Hugo variables — no placeholder copy in the
template: "Inscribed on the Nth day…", "Teleportation Circle", "Mystic
Missives", scrolls. Ornament roles enumerated and each sourced as bespoke
inline SVG / CSS, committed in-theme, zero raster: title cartouche rule; one
decorated initial; corner registration marks; section hairline rule; foot
colophon/folio; spell-stamp tag marks; reply/status mark.

## 9. Recommended References (impeccable)

`typography.md` (the two-voice press/hyperlegible system, measure,
hierarchy), `spatial-design.md` (margin-as-craft, the incipit→body rhythm),
`color-and-contrast.md` (hold AA on the new hues during craft),
`motion-design.md` (restraint, reduced-motion), `ux-writing.md` (diegetic
labels).

## 10. Asserted Defaults (resolved, not open)

- **Self-host the press face (IM Fell English) through the webpack pipeline**,
  not a CDN, so the theme stays self-contained and offline-deployable on
  micro.blog. Fonts work on the platform; this honors "self-contained" and
  the no-out-of-band-asset principle.
- **Harvest, do not re-derive, the parked-branch keepers** from
  `design/fj3-designmd-conformance`: `prefers-reduced-motion`,
  `:focus-visible`, skip-link, AA contrast, titled-posts-keep-tags fix,
  shared post-card partial consolidation, deterministic daily-seed Random
  Incantations. These are inherited acceptance criteria, listed in §6–7.
- **The A-frame is opt-in and subtle by default**; craft tunes or drops it
  against the keystone, no further decision needed.

## Anti-Goals / Biggest Risk

Not a bordered-everything plate (A overused); not D's marginal apparatus on
the reading body; not glow / parchment / purple / Berkshire-era reflex; not
raster; not a break in persona; not "a beautifully typeset blog with no
arrival moment." **The single biggest risk:** the incipit reading as a
spotted gimmick (too loud) *or* the body so austere the artifact-ness never
registers. The synthesis exists to thread exactly that needle; craft must
tune incipit intensity against the keystone audit test, in-browser, until
the wonder is felt and not spotted.
