# Design System Rules

All styling tokens and design rules for the project are detailed below. Reference this file when styling components or checking UI/UX specifications.

---

## Typography

This project uses a **two-font system** loaded in `src/app/layout.tsx`:

| Role                   | Font      | Source                            | CSS Variable       | Tailwind Token   | Weights Loaded               |
| ---------------------- | --------- | --------------------------------- | ------------------ | ---------------- | ---------------------------- |
| **Headings / Display** | Trip Sans | Local WOFF2 (`public/fonts/`)     | `--font-trip-sans` | `--font-display` | 400, 500, 700 + VF (100–900) |
| **Body / UI**          | Poppins   | Google Fonts (`next/font/google`) | `--font-poppins`   | `--font-sans`    | 300, 400, 500, 600, 700      |

### Font Application Rules

- **Headings**: All `h1`–`h6` elements automatically receive Trip Sans via the CSS rule in `globals.css` that binds `font-family: var(--font-display)` to heading tags.
- **Display utility**: Use the `.font-display` class on any non-heading element that should render in Trip Sans — logo text, branding labels, decorative callouts.
- **Body default**: The `<body>` element inherits Poppins via `--font-sans`. All paragraphs, buttons, form inputs, navigation links, calendar pickers, and general UI use this font automatically.
- **Never mix**: Do not apply `font-display` to body text or `font-sans` to headings.

### Font Weight Hierarchy

| Element                                              | Weight | Tailwind Class  | Rationale                                           |
| ---------------------------------------------------- | ------ | --------------- | --------------------------------------------------- |
| Section headings (`h1`–`h3`)                         | 700    | `font-bold`     | Strong visual anchors for content hierarchy         |
| Card titles, package names (`h4`–`h6`)               | 700    | `font-bold`     | Consistent with heading scale                       |
| Taglines, mid-page callouts                          | 500    | `font-medium`   | Subtle and distinct from standard page headings     |
| Body text, paragraphs, descriptions                  | 400    | `font-normal`   | Maximum readability for running text                |
| CTA buttons, "View Details", "Find Packages"         | 600    | `font-semibold` | Prominent but not shouting — signals interactivity  |
| Secondary UI (nav links, dates, filter labels, tags) | 500    | `font-medium`   | Subtle emphasis without competing with headings     |
| Fine print, footnotes, placeholders                  | 400    | `font-normal`   | Same as body but typically paired with `text-muted` |

---

## Color Palette

| CSS Variable     | Hex       | Tailwind Token | Purpose                                                       |
| ---------------- | --------- | -------------- | ------------------------------------------------------------- |
| `--brand`        | `#E05423` | `brand`        | **Primary CTA orange**                                        |
| `--brand-hover`  | `#C54417` | `brand-hover`  | Hover / focus / active states for brand elements              |
| `--brand-light`  | `#FFF3EE` | `brand-light`  | Light orange backgrounds for tags, badges, card accents       |
| `--brand-dark`   | `#111111` | `brand-dark`   | Dark backgrounds, overlays                                    |
| `--background`   | `#FFFFFF` | `background`   | Page and section backgrounds                                  |
| `--foreground`   | `#111111` | `foreground`   | Primary text — headings, body copy                            |
| `--muted`        | `#666666` | `muted`        | Secondary text — subtitles, descriptions, placeholders, icons |
| `--border-light` | `#ECECEC` | `border-light` | Borders — cards, inputs, dividers, filter boxes               |

### Color Usage Rules

| Color                | Allowed On                                                                      | Forbidden On                                                            |
| -------------------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `brand` (orange)     | CTA buttons, active tabs/pills, price text, link hovers, button backgrounds     | Heading text, non-interactive icons, static labels, decorative elements |
| `foreground` (black) | All headings, body paragraphs, card titles                                      | Never mix with orange in the same heading                               |
| `muted` (grey)       | Subtitles, descriptions, MapPin/calendar icons, placeholder text, filter labels | Primary CTAs, main headings                                             |
| `border-light`       | Card borders, input borders, dividers, filter box outlines                      | Active/selected state borders (use `brand` instead)                     |
| `brand-light`        | Tag backgrounds, badge fills, decorative card accent areas                      | Text color (insufficient contrast on white)                             |

### Orange Accent Limitation (Strict)

The brand orange (`#E05423` / `--brand`) is **only for interactive, action-oriented elements**.

**Allowed:**

- Solid CTA button backgrounds (`bg-brand`)
- Active segmented tab/pill/filter backgrounds
- Price numbers (`text-brand`)
- Link/button hover state text (`hover:text-brand`)
- Active page indicators in pagination
- "View Details" button hover backgrounds

**Forbidden:**

- Coloring individual words inside headings orange
- Non-interactive icons (MapPin, Calendar, Clock, Chevron) — use `text-neutral-400` or `text-muted`
- Static labels, badges, or tags (use `bg-brand-light` for backgrounds, never orange text)
- Decorative underlines, dividers, or background accents
- Any element that is not clickable/interactive

**Litmus test**: When adding new UI, ask: "Is this element clickable?" If no, it must not use `text-brand` or `bg-brand`.

---

## Border Radius Strategy

The codebase uses **highly rounded, organic shapes** to prevent a boxy feel. The hierarchy is strict:

| Radius    | Tailwind Class     | Applies To                                                                                |
| --------- | ------------------ | ----------------------------------------------------------------------------------------- |
| Full pill | `rounded-full`     | Navbar, inputs, dropdowns, segmented tabs, pagination, CTA buttons, partner airline cards |
| 40px      | `rounded-[2.5rem]` | Primary destination cards, testimonial cards, gallery wrappers                            |
| 32px      | `rounded-[2rem]`   | Secondary cards, popovers, filter panels                                                  |
| 24px      | `rounded-[1.5rem]` | Nested images inside cards                                                                |
| 10px      | `rounded-[10px]`   | Small badges, tags, chips                                                                 |

**Rule**: The radius of a nested element must be ≤ its parent's radius. A `rounded-[2rem]` card should contain `rounded-[1.5rem]` images, not `rounded-[2.5rem]`.

---

## Shadows & Elevation

- **Shadow tokens** (both map to `0 8px 30px rgba(0, 0, 0, 0.04)`):
  - `shadow-premium` — floating overlays, dropdown panels, popovers, the Hero search panel
  - `shadow-card` — card hover states
- **Cards at rest**: No shadow. Shadow only appears on `:hover` using the `hover:shadow-card` or `hover:shadow-premium` pattern.
- **Borders**: Use `border border-border-light` (1px `#ECECEC`) for all card outlines, input fields, and section dividers.
- **Accent Borders**: Do not use colored accent borders (such as `border-l-[3px]` or custom left-accent lines) on notification banner cards, system health monitors, or status widgets. This reduces visual noise and keeps the dashboard minimal. Use standard subtle borders and soft background colors instead.
- **Forbidden**: `shadow-lg`, `shadow-xl`, custom dark box-shadows, heavy borders.

---

## Spacing & Layout

- **Section vertical padding**: All major landing-page sections use `py-24` (96px top and bottom). Do not deviate.
- **Layout container**: Always use the `layout-container` utility class (defined in `globals.css`) for full-width section wrappers:
  - `max-width: 1800px` + horizontal auto-margins
  - Responsive padding: `px-6` (default) → `px-12` (md: 768px) → `px-[4.5rem]` (lg: 1024px) → `px-24` (xl: 1280px) → `px-28` (2xl: 1536px)
- **Never** write manual `max-w-[1440px] mx-auto px-4 md:px-8` — use `layout-container`.
- **Navbar offset**: All scroll-target `<section>` elements use `scroll-mt-24`.

---

## Logo Presentation & Scrollbar Styling

- **Logo Presentation**: Brand logo images (Navbar and Footer) must **never** have a surrounding frame, background box, border, or shadow.
- **Scrollbar Default** (`html, body`): 6px thin, `#E5E5E5` thumb, transparent track, hover → `#D4D4D4`
- **Dropdown Scrollbar** (`.dropdown-scrollbar`): 5px thin, same color scheme — apply to scrollable dropdown menus
- **Hidden Scrollbar** (`.no-scrollbar`): Hides scrollbar entirely while preserving scroll — use on horizontal mobile card rows
