# Structure & Types Guidelines

This file outlines the codebase folder layout, database models, and TypeScript types.

---

## Directory Structure

All components are organized under `src/components/` by domain layer:

- **`src/components/home/`** — Homepage-specific section components (e.g. `Hero`, `WhyChooseUs`, `FAQ`, `RegionsGrid`, `Gallery`, `TravelerMoments`, `PartnerAirlines`).
- **`src/components/layout/`** — Global site containers and navigation shell wrappers (e.g. `Navbar`, `Footer`, `PopupModal`, `PageShell`, `Breadcrumbs`).
- **`src/components/ui/`** — Low-level, generic presentational primitives (e.g. `Dropdown`, `FavoriteButton`, `FormField`, `AccordionItem`, `PrevNextNav`, `DotIndicator`, `SeeAllLink`).
- **`src/components/shared/`** — Composite, domain-specific components shared across multiple pages (e.g. `PackageCard`, `SectionHeader`, `Pagination`).
- **`src/components/contact/`** — Contact page components (e.g. `ContactMap`).
- **`src/components/packages/`** — Packages page components (e.g. `PackageMap`).
- **`src/types/`** — Consolidated types for all entities.

---

## Database Models & Schema

The PostgreSQL schema (`prisma/schema.prisma`) represents 14 primary models:

| Model | Purpose |
| --- | --- |
| `Country` | Sovereign countries with flags, slugs, and travel metadata. |
| `State` | Regional states within countries to structure packages. |
| `Destination` | Specific travel destinations with attractions, best times, coordinates, and images. |
| `Category` | Trip categories with styling rules and icons. |
| `Package` | High-level tour package listing data, pricing indicators, style, and duration. |
| `PackageVariant` | Multi-duration configurations for packages (e.g., 3N/4D vs 4N/5D). |
| `ItineraryDay` | Detailed day-by-day sightseeing and lodging descriptions for package variants. |
| `HeroSlide` | Slides for the homepage hero carousel banner. |
| `FAQ` | Frequently asked questions with customized answer parsing. |
| `FAQTagline` | The section header tagline rendered above FAQs. |
| `Company` | Singleton record containing phones, address, support hours, WhatsApp, and social media. |
| `Testimonial` | Customer reviews with star ratings and comments. |
| `BlogPost` | Articles with tags, slugs, and linked destinations. |
| `SiteConfig` | Configuration settings for global navigation links and menus. |

---

## Domain Types (`src/types/`)

Consolidated interface models live in the `src/types/` folder. Standard models:
- [company.ts](file:///home/sandipansingh/Projects/clients/mother-india/src/types/company.ts) — contains `CompanyData`, `WorkingHours`, `WorkingHoursSchedule`, `AboutData`.
- [package.ts](file:///home/sandipansingh/Projects/clients/mother-india/src/types/package.ts) — contains `PackageItem`, `PackageDetailItem`, `PackageVariant`, `ItineraryDay`.
- [destination.ts](file:///home/sandipansingh/Projects/clients/mother-india/src/types/destination.ts) — contains `DestinationItem`, `DestinationDisplay`, `DestinationsData`.
- [faq.ts](file:///home/sandipansingh/Projects/clients/mother-india/src/types/faq.ts) — contains `FAQItem`, `FAQData`.
- [hero.ts](file:///home/sandipansingh/Projects/clients/mother-india/src/types/hero.ts) — contains `Slide`, `HeroData`.
- [review.ts](file:///home/sandipansingh/Projects/clients/mother-india/src/types/review.ts) — contains `Review`.
