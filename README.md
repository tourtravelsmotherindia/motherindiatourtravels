# Mother India Tour Travels

A modern, data-driven landing site and tour package catalog for a travel agency specializing in domestic and international trips from India.

**Live site:** [motherindiatourtravels.com](https://motherindiatourtravels.com)

## Tech Stack

| Layer      | Technology                            |
| ---------- | ------------------------------------- |
| Framework  | Next.js 16 (App Router, Turbopack)    |
| UI Library | React 19                              |
| Styling    | Tailwind CSS v4                       |
| Database   | SQLite via Prisma v7 + better-sqlite3 |
| Animations | framer-motion                         |
| Icons      | lucide-react                          |
| Fonts      | Trip Sans (headings), Poppins (body)  |

## Getting Started

### Prerequisites

- Node.js ≥ 18
- npm ≥ 9

### Setup

```bash
# 1. Clone and install
git clone <repo-url>
cd mother-india
npm install

# 2. Configure environment
cp .env.example .env
# .env should contain: DATABASE_URL="file:./data/travel.db"

# 3. Seed the database
npm run db:seed

# 4. Start developing
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to see the site.

> **Note:** The database file (`data/travel.db`) is not checked into git. You must run `npm run db:seed` after cloning to populate it from the JSON source files in `data/json/`.

## Project Structure

```
mother-india/
├── src/
│   ├── app/
│   │   ├── layout.tsx              # Root layout (fonts, metadata, providers)
│   │   ├── page.tsx                # Homepage (async server component)
│   │   ├── globals.css             # Design tokens, Tailwind theme, utilities
│   │   └── packages/
│   │       ├── page.tsx            # Packages listing (server component)
│   │       └── PackagesClient.tsx  # Packages UI (client component)
│   ├── components/
│   │   ├── Navbar.tsx              # Fixed, scroll-aware navigation
│   │   ├── Hero.tsx                # Hero slider + search panel
│   │   ├── WhyChooseUs.tsx         # Value proposition cards
│   │   ├── TripCards.tsx           # Package cards grid
│   │   ├── PopularDestinations.tsx  # Destination showcase with pagination
│   │   ├── Gallery.tsx             # Photo gallery
│   │   ├── TravelerMoments.tsx     # Testimonials carousel
│   │   ├── PartnerAirlines.tsx     # Airline partner logos
│   │   ├── RegionsGrid.tsx         # Geographic regions browser
│   │   ├── FAQ.tsx                 # Accordion FAQ
│   │   ├── Footer.tsx              # Site footer + newsletter
│   │   ├── PopupModal.tsx          # Trip inquiry form modal
│   │   └── Dropdown.tsx            # Reusable dropdown component
│   ├── context/
│   │   └── ToastContext.tsx        # Toast notification system
│   ├── lib/
│   │   └── db/
│   │       ├── prisma.ts           # Prisma client singleton
│   │       └── repositories/       # Data access layer (11 files)
│   │           ├── blogRepo.ts
│   │           ├── categoryRepo.ts
│   │           ├── companyRepo.ts
│   │           ├── countryRepo.ts
│   │           ├── destinationRepo.ts
│   │           ├── faqRepo.ts
│   │           ├── heroRepo.ts
│   │           ├── packageRepo.ts
│   │           ├── siteConfigRepo.ts
│   │           ├── stateRepo.ts
│   │           └── testimonialRepo.ts
│   └── generated/
│       └── prisma/                 # Generated Prisma client
├── prisma/
│   ├── schema.prisma               # Database schema (14 models)
│   ├── seed.ts                     # Seeds SQLite from data/json/
│   ├── verify.ts                   # Validates DB matches JSON sources
│   └── migrations/                 # Prisma migration history
├── data/
│   ├── travel.db                   # SQLite database (WAL mode)
│   └── json/                       # JSON source files (54+ files)
├── public/
│   ├── images/                     # Local images (destinations, banners, etc.)
│   ├── fonts/                      # Trip Sans WOFF2 font files
│   ├── logo.png                    # Brand logo
│   └── favicon.*                   # Favicon assets
├── AGENTS.md                       # Design system & coding conventions
├── CLAUDE.md                       # Project reference for AI assistants
└── package.json
```

## Available Scripts

| Command                | Description                                                      |
| ---------------------- | ---------------------------------------------------------------- |
| `npm run dev`          | Start development server with Turbopack                          |
| `npm run build`        | Production build (Prisma generate → migrate → seed → Next build) |
| `npm run start`        | Start production server                                          |
| `npm run lint`         | Run ESLint                                                       |
| `npm run lint:fix`     | Run ESLint with auto-fix                                         |
| `npm run format`       | Format code with Prettier                                        |
| `npm run format:check` | Check formatting (CI)                                            |
| `npm run db:seed`      | Seed the database from `data/json/`                              |
| `npm run db:verify`    | Verify database content matches JSON sources                     |
| `npm run db:reset`     | Wipe and recreate database from scratch                          |

## Data Layer

The site is fully **data-driven** — all content lives in a SQLite database, not hardcoded in components. The original source of truth is 54+ JSON files in `data/json/`, which are ingested into the database by the Prisma seed script.

### How it works

1. **Schema** (`prisma/schema.prisma`): 14 models covering geographic hierarchy (Country → State → Destination), tour packages with variants and day-by-day itineraries, hero slides, FAQs, testimonials, blog posts, and singleton config records (Company, SiteConfig).

2. **Repository layer** (`src/lib/db/repositories/`): Each model has a dedicated repository exporting typed async query functions. JSON fields stored as strings in SQLite are parsed before returning to consumers.

3. **Server components**: `page.tsx` files fetch data via repositories and pass it as props to client components. Client components never import database code directly.

### Modifying content

- Edit the JSON files in `data/json/`, then run `npm run db:seed` to re-ingest
- Or modify the database directly via Prisma Studio: `npx prisma studio`
- After schema changes, regenerate the client: `npx prisma generate`

## Design System

The project follows a strict design system documented in [AGENTS.md](./AGENTS.md). Key highlights:

- **Two-font system**: Trip Sans for headings, Poppins for body
- **Color palette**: Brand orange (`#E05423`) reserved for interactive elements only; 8 CSS variables mapped to Tailwind tokens
- **Border radius**: Organic pill-to-40px hierarchy — no sharp corners
- **Shadows**: Single ultra-subtle token (`0 8px 30px rgba(0,0,0,0.04)`) for floating elements and card hovers
- **Layout**: `layout-container` utility (max-width 1800px, responsive padding) for all section wrappers
- **Spacing**: `py-24` (96px) standard section rhythm

See [AGENTS.md](./AGENTS.md) for the complete specification including font weights, color usage rules, orange accent limitations, and component patterns.

## Deployment

The production build command (`npm run build`) handles Prisma client generation, database migrations, and seeding automatically.

```bash
npm run build
npm run start
```

The site runs on port 3000 by default. Set `PORT` environment variable to change.

## For AI Assistants

This repository includes two files for AI coding tools:

- **[CLAUDE.md](./CLAUDE.md)** — Project structure, commands, tech stack, data architecture, and tooling
- **[AGENTS.md](./AGENTS.md)** — Design system rules, coding conventions, component patterns, and UI/UX constraints

Both files are kept current with the codebase and should be consulted before making changes.
