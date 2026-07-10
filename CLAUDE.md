# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> **For all design system rules, component patterns, coding conventions, and UI/UX constraints, see [AGENTS.md](./AGENTS.md).** This file covers only project structure, commands, tech stack, data layer architecture, and tooling. AGENTS.md is the single source of truth for _how_ to write code in this repo.

## Version warning

This project uses Next.js 16 with breaking changes from earlier versions. Read `node_modules/next/dist/docs/` before writing framework-specific code.

## Commands

```bash
npm run dev         # Development server (Turbopack)
npm run build       # Production build (runs prisma generate → migrate deploy → next build)
npm run build:static# Static export (see AGENTS.md → Static Export Rules)
npm run start       # Start production server
npm run lint        # ESLint (Next.js core-web-vitals + typescript configs)
npm run lint:fix    # ESLint with auto-fix
npm run format      # Prettier write
npm run format:check# Prettier check (CI)
npm run db:reset    # Wipe and recreate the database using migrations (dev only)
```

## Tech stack

- **Next.js 16** (App Router) with React 19, Turbopack enabled
- **Tailwind CSS v4** (`@tailwindcss/postcss` plugin)
- **Prisma v7** with PostgreSQL — ORM for Supabase-hosted database
- **framer-motion** for all animations
- **lucide-react** for icons
- All UI components are **client components** (`"use client"`); `page.tsx` files are **async server components** that fetch data and pass as props

## Architecture

This is a **single-page landing site** for a tour & travel agency plus a **packages listing page**. The homepage renders on `src/app/page.tsx` (async server component) with sections in order: Navbar → Hero → WhyChooseUs → TripCards → PopularDestinations → Gallery → TravelerMoments → PartnerAirlines → RegionsGrid → FAQ → Footer. The packages page (`src/app/packages/page.tsx`) follows a **server + client split**: the server component fetches data, the client component (`PackagesClient.tsx`) renders the interactive UI.

## Data Layer (Prisma + PostgreSQL on Supabase)

The site is **data-driven** — content is stored in a remote Supabase PostgreSQL database accessed through Prisma. The database schema is managed through Prisma migrations.

**Database setup:**

- Database is hosted on Supabase (PostgreSQL)
- Prisma client is generated to `src/generated/prisma/` (non-standard output path)
- `.env` must have `DATABASE_URL` set to the Supabase PostgreSQL connection string
- Migrations are applied via `npx prisma migrate deploy` (production) or `npx prisma migrate dev` (development)

**Schema** (`prisma/schema.prisma` — 14 models):

| Model                                       | Purpose                                                                            |
| ------------------------------------------- | ---------------------------------------------------------------------------------- |
| `Country`, `State`, `Destination`           | Geographic hierarchy with slugs, featured flags, SEO metadata                      |
| `Category`                                  | Trip categories with icons                                                         |
| `Package`, `PackageVariant`, `ItineraryDay` | Tour packages with variants (e.g., 3N/4D, 4N/5D) and day-by-day itineraries        |
| `HeroSlide`                                 | Hero carousel slides (image, tag, title, description)                              |
| `FAQ`, `FAQTagline`                         | FAQ items with sort order + singleton tagline                                      |
| `Company`                                   | Singleton: phones, email, address, schedule, social media, WhatsApp, analytics IDs |
| `Testimonial`                               | Customer reviews with ratings                                                      |
| `BlogPost`                                  | Blog posts with slug, tags, destinations                                           |
| `SiteConfig`                                | Singleton: navigation, URL structure, SEO rules, cross-linking logic               |

**Repository layer** (`src/lib/db/repositories/` — 11 files):

Each model has a dedicated repository exporting async query functions. JSON fields (arrays/objects stored as strings in PostgreSQL) are parsed in the repository before returning — consumers receive typed objects, never raw DB rows. Every repository uses a `safeParse()` helper that wraps `JSON.parse` with a fallback to `[]`.

## Images

- `next.config.mjs` allows remote images from `images.unsplash.com` and `img.freepik.com`, plus all local images via `localPatterns`
- `fill` images **must** have a `sizes` prop (Next.js 16 requirement enforced at build time)
- Use `priority` on the first 1–2 visible cards/images for LCP optimization
- Local images live in `/public/images/`; the logo is `/public/logo.png`

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:

- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).
