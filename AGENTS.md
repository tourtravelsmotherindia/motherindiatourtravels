# AGENTS.md

This is the **single source of truth** for how to write code in this repository. It covers the stack, commands, architecture, and coding conventions.

> [!NOTE]
> Detailed guidelines are organized into specific topic files under `.claude/rules/`:
>
> - [Design System](file://./.claude/rules/design_system.md) — typography, colors, spacing, radius, shadows, logo rules.
> - [Component Patterns](file://./.claude/rules/components.md) — server/client split, data fetching, animations, card patterns, component descriptions.
> - [Build, Image & SEO Rules](file://./.claude/rules/build_seo.md) — static export, image rules, SEO constraints.
> - [Structure & Types](file://./.claude/rules/structure_types.md) — folder structure, database schema, type definitions.

---

## Version Warning

This project uses Next.js 16 with breaking changes from earlier versions. Read the relevant guide in `node_modules/next/dist/docs/` before writing framework-specific code.

## Tech Stack

- **Next.js 16** (App Router) with React 19, Turbopack enabled
- **Tailwind CSS v4** (`@tailwindcss/postcss` plugin)
- **Prisma v7** with PostgreSQL — ORM for Supabase-hosted database
- **framer-motion** for all animations
- **lucide-react** for icons

## Verified Commands

All commands are run using `npm`:

- `npm run dev` — Start the development server (with Turbopack)
- `npm run build` — Build project (runs prisma generate → migrate deploy → next build)
- `npm run start` — Start production server
- `npm run lint` — Run ESLint check
- `npm run lint:fix` — Automatically fix lint errors
- `npm run format` — Run Prettier format write
- `npm run format:check` — Check Prettier formatting
- `npm run db:reset` — Reset database using migrations
- `npm run db:seed` — Seed the database (runs `npx tsx prisma/seed.ts`)

### Post-Write Quality Gate

After writing or modifying any code, you **must** run the following commands (in this order) before marking any task as complete or creating a commit:

1. `npm run lint:fix` — Auto-fix ESLint errors
2. `npm run format` — Format all files with Prettier
3. `npm run build` — Verify the project still compiles cleanly

This ensures no lint errors, consistent formatting, and no broken builds.

## Core Conventions & Architecture

- **Landing Page + Listings**: Single-page landing site (`src/app/page.tsx`) and package listings (`src/app/packages/page.tsx`).
- **Path Aliases**: Always use `@/*` to map to `src/*` (e.g., `@/components/...`).
- **Currency & Localization**: Currency is always `₹` (Indian Rupee).
- **Client/Server Boundary**: Server pages pass fetched data to client components (`"use client"`) in `src/components/`.

## Do Not (Strict Invariants)

- **No local interface declarations**: All domain-wide database model types must be declared in `src/types/` and imported (never duplicated).
- **No root components**: React components must reside in their respective subdirectories inside `src/components/` (never directly in the root of `src/components/`).
- **No `lib/types/`**: All domain-wide types must live in `src/types/` (never `src/lib/types/` or `src/lib/db/`).
- **No hardcoded Hex values**: Always use `@theme` Tailwind CSS v4 variables from `globals.css`.
- **No frames/backgrounds on Logo**: Brand logo images must never have a surrounding frame, background box, border, or shadow.
- **No server-only APIs in pages**: Since Next.js static export is used, do not use `headers()`, `cookies()`, `noStore()`, or dynamic runtime options.
- **Clean Code Skill**: Always use the `clean-code` skill when writing or modifying any code in this repository.
