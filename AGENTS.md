<!-- BEGIN:nextjs-agent-rules -->

# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

# AGENTS.md

This is the **single source of truth** for how to write code in this repository. It covers the design system, coding conventions, component patterns, UI/UX rules, and code quality standards. For project structure, commands, tech stack, data layer architecture, and tooling, see [CLAUDE.md](./CLAUDE.md).

---

## Design System (`src/app/globals.css`)

All design tokens are defined as CSS variables in `:root` and mapped to Tailwind v4 `@theme` tokens. **Never use hardcoded hex values in components.** Always use the token classes (`bg-brand`, `text-muted`, `border-border-light`, etc.).

### Typography

This project uses a **two-font system** loaded in `src/app/layout.tsx`:

| Role                   | Font      | Source                            | CSS Variable       | Tailwind Token   | Weights Loaded               |
| ---------------------- | --------- | --------------------------------- | ------------------ | ---------------- | ---------------------------- |
| **Headings / Display** | Trip Sans | Local WOFF2 (`public/fonts/`)     | `--font-trip-sans` | `--font-display` | 400, 500, 700 + VF (100–900) |
| **Body / UI**          | Poppins   | Google Fonts (`next/font/google`) | `--font-poppins`   | `--font-sans`    | 300, 400, 500, 600, 700      |

#### Font Application Rules

- **Headings**: All `h1`–`h6` elements automatically receive Trip Sans via the CSS rule in `globals.css` that binds `font-family: var(--font-display)` to heading tags.
- **Display utility**: Use the `.font-display` class on any non-heading element that should render in Trip Sans — logo text, branding labels, decorative callouts.
- **Body default**: The `<body>` element inherits Poppins via `--font-sans`. All paragraphs, buttons, form inputs, navigation links, calendar pickers, and general UI use this font automatically.
- **Never mix**: Do not apply `font-display` to body text or `font-sans` to headings.

#### Font Weight Hierarchy

| Element                                              | Weight | Tailwind Class  | Rationale                                           |
| ---------------------------------------------------- | ------ | --------------- | --------------------------------------------------- |
| Section headings (`h1`–`h3`)                         | 700    | `font-bold`     | Strong visual anchors for content hierarchy         |
| Card titles, package names (`h4`–`h6`)               | 700    | `font-bold`     | Consistent with heading scale                       |
| Body text, paragraphs, descriptions                  | 400    | `font-normal`   | Maximum readability for running text                |
| CTA buttons, "View Details", "Find Packages"         | 600    | `font-semibold` | Prominent but not shouting — signals interactivity  |
| Secondary UI (nav links, dates, filter labels, tags) | 500    | `font-medium`   | Subtle emphasis without competing with headings     |
| Fine print, footnotes, placeholders                  | 400    | `font-normal`   | Same as body but typically paired with `text-muted` |

### Color Palette

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

#### Color Usage Rules

| Color                | Allowed On                                                                      | Forbidden On                                                            |
| -------------------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `brand` (orange)     | CTA buttons, active tabs/pills, price text, link hovers, button backgrounds     | Heading text, non-interactive icons, static labels, decorative elements |
| `foreground` (black) | All headings, body paragraphs, card titles                                      | Never mix with orange in the same heading                               |
| `muted` (grey)       | Subtitles, descriptions, MapPin/calendar icons, placeholder text, filter labels | Primary CTAs, main headings                                             |
| `border-light`       | Card borders, input borders, dividers, filter box outlines                      | Active/selected state borders (use `brand` instead)                     |
| `brand-light`        | Tag backgrounds, badge fills, decorative card accent areas                      | Text color (insufficient contrast on white)                             |

### Border Radius Strategy

The codebase uses **highly rounded, organic shapes** to prevent a boxy feel. The hierarchy is strict:

| Radius    | Tailwind Class     | Applies To                                                                                |
| --------- | ------------------ | ----------------------------------------------------------------------------------------- |
| Full pill | `rounded-full`     | Navbar, inputs, dropdowns, segmented tabs, pagination, CTA buttons, partner airline cards |
| 40px      | `rounded-[2.5rem]` | Primary destination cards, testimonial cards, gallery wrappers                            |
| 32px      | `rounded-[2rem]`   | Secondary cards, popovers, filter panels                                                  |
| 24px      | `rounded-[1.5rem]` | Nested images inside cards                                                                |
| 10px      | `rounded-[10px]`   | Small badges, tags, chips                                                                 |

**Rule**: The radius of a nested element must be ≤ its parent's radius. A `rounded-[2rem]` card should contain `rounded-[1.5rem]` images, not `rounded-[2.5rem]`.

### Shadows & Elevation

- **Shadow tokens** (both map to `0 8px 30px rgba(0, 0, 0, 0.04)`):
  - `shadow-premium` — floating overlays, dropdown panels, popovers, the Hero search panel
  - `shadow-card` — card hover states
- **Cards at rest**: No shadow. Shadow only appears on `:hover` using the `hover:shadow-card` or `hover:shadow-premium` pattern.
- **Borders**: Use `border border-border-light` (1px `#ECECEC`) for all card outlines, input fields, and section dividers.
- **Forbidden**: `shadow-lg`, `shadow-xl`, custom dark box-shadows, heavy borders.

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

### Section Spacing & Layout Container

- **Section vertical padding**: All major landing-page sections use `py-24` (96px top and bottom). Do not deviate.
- **Layout container**: Always use the `layout-container` utility class (defined in `globals.css`) for full-width section wrappers:
  - `max-width: 1800px` + horizontal auto-margins
  - Responsive padding: `px-6` (default) → `px-12` (md: 768px) → `px-[4.5rem]` (lg: 1024px) → `px-24` (xl: 1280px) → `px-28` (2xl: 1536px)
- **Never** write manual `max-w-[1440px] mx-auto px-4 md:px-8` — use `layout-container`.
- **Navbar offset**: All scroll-target `<section>` elements use `scroll-mt-24`.

### Logo Presentation

Brand logo images (Navbar and Footer) must **never** have a surrounding frame, background box, border, or shadow.

### Scrollbar Styling

- **Default** (`html, body`): 6px thin, `#E5E5E5` thumb, transparent track, hover → `#D4D4D4`
- **Dropdown** (`.dropdown-scrollbar`): 5px thin, same color scheme — apply to scrollable dropdown menus
- **Hidden** (`.no-scrollbar`): Hides scrollbar entirely while preserving scroll — use on horizontal mobile card rows

---

## Component Patterns

### Server/Client Split

- `page.tsx` files are **async server components** — they import repository functions and fetch data
- All UI components in `src/components/` are **client components** (`"use client"`) — they receive data via props, never by calling repositories directly
- Canonical example: `src/app/packages/page.tsx` (server, fetches data) → `PackagesClient.tsx` (client, renders UI)

### Data Fetching Pattern

- Import repository functions from `@/lib/db/repositories/<name>Repo`
- Repository functions are async and return typed objects (JSON fields already parsed)
- Server components call repositories and pass resolved data as props to client components
- Never import `prisma` directly in a component — always go through the repository layer
- Use `safeParse()` (defined in each repository) for parsing JSON string fields — never call `JSON.parse` directly on DB fields

### Animation Conventions

- All animations use **framer-motion** (`AnimatePresence`, `motion.div`)
- Never use CSS `@keyframes` or `transition` for component animations — framer-motion is the sole animation library

### Card Component Pattern

- Card components rendered inside `.map()` must be **defined at module scope** (outside the parent component), not created inline during render
- This prevents React "component is being created during render" warnings and re-mount bugs
- Reference: `DestinationCard`, `TestimonialCard`, and package cards in `PackagesClient.tsx`

### Individual Component Descriptions

- **Navbar**: Fixed, scroll-aware (shrinks/background-blur after 20px scroll), mobile hamburger with framer-motion overlay. Logo has no frame/border. Uses `rounded-full` container.
- **Hero**: Server-fetched slides from `heroRepo.getHeroSlides()` with crossfade `AnimatePresence`, 5s auto-rotation, pause on hover, floating search panel (destination/check-in/check-out/guests) with `shadow-premium` and `rounded-[2rem]`.
- **PopularDestinations** / **TravelerMoments**: Desktop asymmetric grid (`grid-cols-[5.8fr_4.2fr]` alternating rows) with `AnimatePresence` pagination, mobile horizontal scroll with dot indicators.
- **FAQ**: Accordion with `AnimatePresence` height animation, resolves `{phone}` / `{email}` placeholders in answers from `companyData` at component level.
- **Footer**: Dynamic working hours formatter that collapses same-time schedules (e.g., "Mon–Fri: 9am–6pm"), social icon SVGs from `companyData`, newsletter form with success toast.
- **PackagesClient**: Client component for `/packages` — receives pre-fetched data via props, handles pagination and filtering client-side.
- **PopupModal**: Global trip inquiry form with country picker (uses `countries-list` package), rendered in `layout.tsx`.
- **ToastContext**: Toast notification system via React Context (`src/context/ToastContext.tsx`), positioned bottom-right with slide-up animation.

---

## Important Conventions

- `@/*` path alias maps to `src/*` (configured in `tsconfig.json`)
- `suppressHydrationWarning` is set on `<body>` in `layout.tsx` (prevents browser extension hydration mismatches)
- Section IDs (`#home`, `#about`, `#packages`, `#faq`, `#gallery`, `#contact`) must match between Navbar links and Footer quick links
- Currency is always `₹` (Indian Rupee), never `$`
- Prisma client must be regenerated after schema changes: `npx prisma generate`
- The `prisma/` directory is excluded from TypeScript compilation — do not import from it directly; use `@/generated/prisma/client` and `@/lib/db/repositories/*`
- The `data/` directory at project root contains the live database and JSON source files; never delete or modify database files manually

## Image Rules

- `fill` images **must** have a `sizes` prop (Next.js 16 requirement enforced at build time)
- Use `priority` on the first 1–2 visible cards/images for LCP optimization
- Local images live in `/public/images/`; the logo is `/public/logo.png`
- Remote images allowed from `images.unsplash.com` and `img.freepik.com`
