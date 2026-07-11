# Mother India Tour Travels Database Schema (v2.0)

This document describes the modern relational database schema v2.0 for the Mother India Tour Travels platform. The schema is defined in [schema.prisma](file://./schema.prisma) and deployed on a PostgreSQL instance hosted by Supabase.

## Overview & Design Decisions

The v2.0 schema shifts from flat arrays, JSON strings, and singleton anti-patterns to a relational structure. This design enables clean queries, referential integrity, dynamic map routing, and granular package configurations.

```mermaid
erDiagram
    Country ||--o{ State : "has"
    Country ||--o{ Destination : "has"
    State ||--o{ Destination : "has"
    Destination ||--o{ Attraction : "has"

    Package ||--|| Country : "belongs to"
    Package ||--o| State : "belongs to"

    Package ||--o{ PackageDestination : "many-to-many"
    Package ||--o{ PackageCategory : "many-to-many"
    Package ||--o{ PackageAttraction : "many-to-many"

    PackageDestination }|--|| Destination : ""
    PackageCategory }|--|| Category : ""
    PackageAttraction }|--|| Attraction : ""

    Package ||--o{ PackageVariant : "has variants"
    PackageVariant ||--o{ ItineraryDay : "has schedule"

    HeroConfig ||--o{ HeroSlide : "controls"
```

---

## 1. Geography Group

### `Country`

Represents target travel countries (e.g. India, Nepal, UAE).

- **Primary Key**: `id` (String CUID)
- **Keys**: `slug` (Unique)
- **Relationships**: Has many `State`, `Destination`, `Package`

### `State`

Represents states/territories under a country (e.g. Delhi, Rajasthan, Kerala).

- **Primary Key**: `id` (String CUID)
- **Keys**: `slug` (Unique)
- **Foreign Keys**: `countryId` -> `Country(id)`
- **Relationships**: Has many `Destination`, `Package`

### `Destination`

Represents cities or key tourist areas (e.g. Agra, Munnar, Dubai).

- **Primary Key**: `id` (String CUID)
- **Keys**: `slug` (Unique)
- **Foreign Keys**: `countryId` -> `Country(id)`, `stateId` -> `State(id)` (Nullable)
- **Relationships**: Has many `Attraction`, `GalleryImage`, `BlogPost`

### `Attraction`

Specific points of interest with exact coordinates (e.g. Taj Mahal, Red Fort). Replaces hardcoded map coordinates.

- **Primary Key**: `id` (String CUID)
- **Keys**: `slug` (Unique)
- **Foreign Keys**: `destinationId` -> `Destination(id)`
- **Fields**: `latitude` (Float), `longitude` (Float), `sortOrder` (Int)

---

## 2. Package Group

### `Package`

The parent tour itinerary metadata.

- **Primary Key**: `id` (String CUID)
- **Keys**: `slug` (Unique)
- **Foreign Keys**: `countryId` -> `Country(id)`, `stateId` -> `State(id)` (Nullable)
- **Relational Joins**:
  - `destinations`: Join table `PackageDestination` (with `sortOrder` for routing)
  - `categories`: Join table `PackageCategory`
  - `attractions`: Join table `PackageAttraction` (drawn on route maps)

### `PackageVariant`

Duration/nights variants for a package (e.g. "3n-4d", "4n-5d"). Slugs are auto-generated.

- **Primary Key**: `id` (String CUID)
- **Keys**: `slug` (Unique)
- **Foreign Keys**: `packageId` -> `Package(id)`
- **Fields**: `nights` (Int), `days` (Int), `basePrice` (Float, Nullable), `discountedPrice` (Float, Nullable), `isDefault` (Boolean)

### `ItineraryDay`

Daily schedules linked to a specific package variant.

- **Primary Key**: `id` (String CUID)
- **Foreign Keys**: `variantId` -> `PackageVariant(id)`
- **Fields**: `day` (Int), `title` (String), `description` (String), `images` (String[])

---

## 3. Content CMS Group

### `HeroConfig` & `HeroSlide`

Singleton configuration (id = 1) enabling Hero toggle between slides list and custom video URL.

- **HeroConfig**: `mode` (Enum: SLIDES | VIDEO), `videoUrl` (String)
- **HeroSlide**: Slides mapping with `image`, `tag`, `title`, `description`, `sortOrder`.

### `SiteSection`

Generic section configuration text (e.g. FAQ, Gallery tags) eliminating individual tagline tables.

- **Fields**: `key` (Unique key like "faq"), `tagline` (String), `subtitle` (String)

---

## 4. Lead Capture & Company Group

All lead capture tables (`BookingInquiry`, `ContactSubmission`, `NewsletterSubscriber`) are fully prepared with status columns, but left un-wired on the front-end for later API-based integration.
