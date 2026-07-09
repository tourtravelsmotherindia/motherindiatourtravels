# Database Schema Improvements Proposal (Packages)

This document outlines the proposed changes to the SQLite database schema (`prisma/schema.prisma`) to support rich, multi-media content for tour packages. Currently, the detail pages use local lookup tables and placeholder image pools because the database lacks native support for multiple images, geolocation coordinates, and detailed package metadata.

---

## 1. Proposed Schema Updates

### A. Dynamic Package Image Gallery
**Problem**: The `Package` table currently has only a single `heroImage` column. This makes it impossible to define a custom image gallery for each package.
**Solution**: Add an `images` field to the `Package` model. In SQLite/Prisma, this is best implemented as a stringified JSON array of URLs, or by creating a new `PackageImage` relation model.

### B. Route Geolocation Coordinates
**Problem**: Map routing coordinates are currently hardcoded in a static dictionary in `PackageMap.tsx`. If a new destination is added in the admin/JSON seeding files, the map won't display it without code modifications.
**Solution**: Add coordinates fields to the `Destination` model.

### C. Day-Specific Itinerary Images
**Problem**: The day-by-day itinerary accordions currently load random placeholder images. Each day should ideally show photos specific to that day's activities.
**Solution**: Add an `images` JSON array column to the `ItineraryDay` model.

### D. Package Metadata
**Problem**: Metrics like "Tour Style" (e.g. Beach, Pilgrimage, Heritage), "Group Size", and "Accommodation Type" are currently hardcoded in components.
**Solution**: Add fields to the `Package` or `PackageVariant` models to allow customizing these attributes per tour.

### E. Split Overview Text (Marketing Pitch vs. Detailed Overview)
**Problem**: The page renders a short **Hero Description** (marketing pitch) directly under the package title, followed by a separate **Trip Overview** (detailed explanation) further down. Currently, the single `overview` field in the database is split in code by paragraph splits.
**Solution**: Create two separate columns: `marketingPitch` (for the short introductory text) and `overview` (for the full day-by-day or detailed explanation).

---

## 2. Updated Prisma Models

Here is how the modified Prisma models would look:

```prisma
// Modified Package Model
model Package {
  id                 String            @id
  slug               String            @unique
  name               String
  isPopular          Boolean           @default(false)
  isDomestic         Boolean           @default(true)
  destinations       String            // JSON array of display names
  destinationIds     String            // JSON array of destination slugs
  primaryDestination String
  categoryIds        String            // JSON array of category slugs
  stateId            String?
  countryId          String
  minNights          Int
  maxNights          Int
  minDays            Int
  maxDays            Int
  durationRange      String
  variantCount       Int               @default(1)
  heroImage          String            @default("")
  tags               String            // JSON array of strings

  // ==========================================
  // NEW FIELDS
  // ==========================================
  galleryImages      String            @default("[]") // JSON array of image URLs
  tourStyle          String            @default("Classic") // e.g. Heritage, Beach, Wildlife, Pilgrimage
  groupSizeMax       Int               @default(12)
  groupSizeAvg       Int               @default(10)
  stayType           String            @default("Premium Hotels")
  marketingPitch     String            @default("") // Short marketing intro
  
  overview           String            @default("")
  highlights         String            @default("[]")
  inclusions         String            @default("[]")
  exclusions         String            @default("[]")
  notes              String            @default("[]")
  seoTitle           String            @default("")
  seoDescription     String            @default("")
  seoKeywords        String            @default("[]")

  country            Country           @relation(fields: [countryId], references: [id])
  state              State?            @relation(fields: [stateId], references: [id])
  variants           PackageVariant[]

  @@index([slug])
  @@index([isPopular])
  @@index([isDomestic])
  @@index([countryId])
  @@index([stateId])
}

// Modified Destination Model
model Destination {
  id                 String  @id
  name               String
  slug               String  @unique
  stateId            String?
  countryId          String
  type               String  @default("city")
  isFeatured         Boolean @default(false)
  description        String
  bestTimeToVisit    String
  climate            String  @default("")
  topAttractions     String  // JSON array of strings
  nearbyDestinations String  // JSON array of destination slugs
  seoTitle           String
  seoDescription     String
  image              String  @default("")
  packageCount       Int     @default(0)

  // ==========================================
  // NEW FIELDS
  // ==========================================
  latitude           Float?
  longitude          Float?

  country            Country @relation(fields: [countryId], references: [id])
  state              State?  @relation(fields: [stateId], references: [id])

  @@index([countryId])
  @@index([stateId])
  @@index([slug])
  @@index([isFeatured])
}

// Modified ItineraryDay Model
model ItineraryDay {
  id          String         @id
  variantId   String
  day         Int
  title       String
  description String

  // ==========================================
  // NEW FIELDS
  // ==========================================
  images      String         @default("[]") // JSON array of specific images for this day

  variant     PackageVariant @relation(fields: [variantId], references: [id], onDelete: Cascade)

  @@index([variantId])
}
```

---

## 3. Migration Plan

To safely migrate the database and populate the new columns, follow these steps:

1. **Modify Schema**: Apply the changes listed above to `prisma/schema.prisma`.
2. **Generate Migration**: Run Prisma migration to generate and execute SQLite SQL statements:
   ```bash
   npx prisma migrate dev --name add_package_multimedia_fields
   ```
3. **Regenerate Client**: Ensure the local type definition client is updated:
   ```bash
   npx prisma generate
   ```
4. **Update JSON Seed Data**:
   Add the new attributes to the source JSON files in `data/json/packages/*.json`. For example, inside `goa-tour.json`:
   ```json
   {
     "gallery_images": [
       "/images/packages/goa-beach.jpg",
       "/images/packages/goa-fort.jpg"
     ],
     "difficulty": "Easy",
     "group_size_max": 15,
     "group_size_avg": 10,
     "stay_type": "Beach Resorts",
     "variants": [
       {
         "label": "3N/4D",
         "itinerary": [
           {
             "day": 1,
             "title": "...",
             "images": ["/images/packages/goa-arrival.jpg"]
           }
         ]
       }
     ]
   }
   ```
5. **Update Seed Script**: Update `prisma/seed.ts` to read the new properties from JSON files and load them into database entries when seeding.
6. **Update Repositories**: Update `src/lib/db/repositories/packageRepo.ts` and `destinationRepo.ts` to parse the new JSON arrays so they are returned as strongly-typed lists to Server Components.
