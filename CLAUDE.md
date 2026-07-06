# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Version warning

This project uses Next.js 16 with breaking changes from earlier versions. Read `node_modules/next/dist/docs/` before writing framework-specific code.

## Commands

```bash
npm run dev      # Development server (Turbopack)
npm run build    # Production build
npm run start    # Start production server
npm run lint     # ESLint (Next.js core-web-vitals + typescript configs)
```

## Tech stack

- **Next.js 16** (App Router) with React 19, Turbopack enabled
- **Tailwind CSS v4** (`@tailwindcss/postcss` plugin)
- **framer-motion** for all animations
- **lucide-react** for icons
- All components are **client components** (`"use client"`) — there are no server components in this project

## Architecture

This is a **single-page landing site** for a tour & travel agency. All sections render on `src/app/page.tsx` in order: Navbar → Hero → WhyChooseUs → TripCards → PopularDestinations → Gallery → TestimonialsSection → PartnerAirlines → RegionsGrid → FAQ → Footer.

### Design system (`src/app/globals.css`)

Brand color is `#E05423` (`--brand`), mapped to Tailwind tokens via `@theme`. Two Google Fonts: **Plus Jakarta Sans** (`--font-sans`) for body and **Playfair Display** (`--font-serif`) for decorative headings. Standard section wrapper: `max-w-[1440px] mx-auto px-4 md:px-8`.

### Data layer (`src/data/`)

The site is **data-driven** — content lives in JSON files, not hardcoded in components:

| File                  | Purpose                                                                                                          |
| --------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `company.json`        | Central source: phone numbers, email, address, working hours, social links, about text                           |
| `hero.json`           | Hero slider slides (image, tag, title, description)                                                              |
| `faq.json`            | FAQ items with `{phone}` / `{email}` placeholders resolved at render time from `company.json`                    |
| `site-config.json`    | Planned URL structure, navigation tree, SEO rules, cross-linking logic (not yet fully implemented in components) |
| `packages-index.json` | Registry of 50+ tour packages (destinations, categories, durations, tags)                                        |
| `packages/*.json`     | Individual package detail files (one per package)                                                                |

### Component patterns

- **Navbar**: Fixed, scroll-aware (shrinks/background-blur after 20px scroll), mobile hamburger with framer-motion overlay
- **Hero**: Data-driven slider from `hero.json` with crossfade `AnimatePresence`, 5s auto-rotation, pause on hover, floating search panel with destination/check-in/check-out/guests
- **PopularDestinations** / **TestimonialsSection**: Both use the same pattern — desktop asymmetric grid (`grid-cols-[5.8fr_4.2fr]` alternating rows) with `AnimatePresence` pagination, mobile horizontal scroll with dot indicators. The `DestinationCard` and review cards are hoisted out of the main component to avoid render-time component creation errors
- **FAQ**: Accordion with `AnimatePresence` height animation, resolves `company.json` placeholders at component level
- **Footer**: Dynamic working hours formatter that collapses same-time schedules across days, social icon SVGs from `company.json`, newsletter form with success toast

### Images

- `next.config.mjs` allows remote images from `images.unsplash.com` and all local images via `localPatterns`
- `fill` images **must** have a `sizes` prop (Next.js 16 requirement enforced at build time)
- Use `priority` on the first 1–2 visible cards/images for LCP optimization
- Local images live in `/public/images/`; the logo is `/public/logo.png`

### Important conventions

- `@/*` path alias maps to `src/*` (configured in `tsconfig.json`)
- `suppressHydrationWarning` is set on `<body>` in `layout.tsx` (prevents browser extension hydration mismatches)
- Section IDs (`#home`, `#about`, `#packages`, `#faq`, `#gallery`, `#contact`) anchor both the Navbar links and Footer quick links
- All `<section>` elements that serve as scroll targets use `scroll-mt-24` for the fixed navbar offset
- Currency is `₹` (Indian Rupee), not `$`

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:

- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
