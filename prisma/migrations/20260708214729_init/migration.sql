-- CreateTable
CREATE TABLE "Country" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "continent" TEXT NOT NULL,
    "isDomestic" BOOLEAN NOT NULL,
    "isFeatured" BOOLEAN NOT NULL DEFAULT false,
    "capital" TEXT NOT NULL,
    "currency" TEXT NOT NULL,
    "languages" TEXT NOT NULL,
    "visaRequiredForIndians" BOOLEAN NOT NULL,
    "visaOnArrival" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT NOT NULL,
    "popularDestinations" TEXT NOT NULL,
    "seoTitle" TEXT NOT NULL,
    "seoDescription" TEXT NOT NULL,
    "image" TEXT NOT NULL DEFAULT '',
    "packageCount" INTEGER NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "State" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "countryId" TEXT NOT NULL,
    "capital" TEXT NOT NULL,
    "isFeatured" BOOLEAN NOT NULL DEFAULT false,
    "packageCount" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "State_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Destination" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "stateId" TEXT,
    "countryId" TEXT NOT NULL,
    "type" TEXT NOT NULL DEFAULT 'city',
    "isFeatured" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT NOT NULL,
    "bestTimeToVisit" TEXT NOT NULL,
    "climate" TEXT NOT NULL DEFAULT '',
    "topAttractions" TEXT NOT NULL,
    "nearbyDestinations" TEXT NOT NULL,
    "seoTitle" TEXT NOT NULL,
    "seoDescription" TEXT NOT NULL,
    "image" TEXT NOT NULL DEFAULT '',
    "packageCount" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "Destination_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Destination_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "State" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "seoTitle" TEXT NOT NULL,
    "seoDescription" TEXT NOT NULL,
    "packageCount" INTEGER NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "Package" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "slug" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "isPopular" BOOLEAN NOT NULL DEFAULT false,
    "isDomestic" BOOLEAN NOT NULL DEFAULT true,
    "destinations" TEXT NOT NULL,
    "destinationIds" TEXT NOT NULL,
    "primaryDestination" TEXT NOT NULL,
    "categoryIds" TEXT NOT NULL,
    "stateId" TEXT,
    "countryId" TEXT NOT NULL,
    "minNights" INTEGER NOT NULL,
    "maxNights" INTEGER NOT NULL,
    "minDays" INTEGER NOT NULL,
    "maxDays" INTEGER NOT NULL,
    "durationRange" TEXT NOT NULL,
    "variantCount" INTEGER NOT NULL DEFAULT 1,
    "heroImage" TEXT NOT NULL DEFAULT '',
    "tags" TEXT NOT NULL,
    "overview" TEXT NOT NULL DEFAULT '',
    "highlights" TEXT NOT NULL DEFAULT '[]',
    "inclusions" TEXT NOT NULL DEFAULT '[]',
    "exclusions" TEXT NOT NULL DEFAULT '[]',
    "notes" TEXT NOT NULL DEFAULT '[]',
    "seoTitle" TEXT NOT NULL DEFAULT '',
    "seoDescription" TEXT NOT NULL DEFAULT '',
    "seoKeywords" TEXT NOT NULL DEFAULT '[]',
    CONSTRAINT "Package_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Package_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "State" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PackageVariant" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "packageId" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "nights" INTEGER NOT NULL,
    "days" INTEGER NOT NULL,
    "durationText" TEXT NOT NULL,
    "oldHtmlFile" TEXT NOT NULL DEFAULT '',
    CONSTRAINT "PackageVariant_packageId_fkey" FOREIGN KEY ("packageId") REFERENCES "Package" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ItineraryDay" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "variantId" TEXT NOT NULL,
    "day" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    CONSTRAINT "ItineraryDay_variantId_fkey" FOREIGN KEY ("variantId") REFERENCES "PackageVariant" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "HeroSlide" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "image" TEXT NOT NULL,
    "tag" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "FAQ" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "question" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    "sortOrder" INTEGER NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "FAQTagline" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT DEFAULT 1,
    "tagline" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Company" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT DEFAULT 1,
    "name" TEXT NOT NULL,
    "tagline" TEXT NOT NULL,
    "website" TEXT NOT NULL,
    "phones" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "timezone" TEXT NOT NULL,
    "schedule" TEXT NOT NULL,
    "exceptions" TEXT NOT NULL DEFAULT '[]',
    "socialMedia" TEXT NOT NULL,
    "certifications" TEXT NOT NULL,
    "about" TEXT NOT NULL,
    "whatsappNumber" TEXT NOT NULL,
    "googleAnalytics" TEXT NOT NULL DEFAULT '',
    "googleTagManager" TEXT NOT NULL DEFAULT ''
);

-- CreateTable
CREATE TABLE "BlogPost" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "slug" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "destinations" TEXT NOT NULL,
    "excerpt" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "tags" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Testimonial" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "reviewer" TEXT NOT NULL,
    "review" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "package" TEXT NOT NULL,
    "source" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "SiteConfig" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT DEFAULT 1,
    "siteName" TEXT NOT NULL,
    "domain" TEXT NOT NULL,
    "navigation" TEXT NOT NULL,
    "homeTitle" TEXT NOT NULL,
    "homeDescription" TEXT NOT NULL,
    "ogImage" TEXT NOT NULL,
    "crossLinkingRules" TEXT NOT NULL,
    "urlStructure" TEXT NOT NULL,
    "seoPrinciples" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Country_slug_key" ON "Country"("slug");

-- CreateIndex
CREATE INDEX "Country_slug_idx" ON "Country"("slug");

-- CreateIndex
CREATE INDEX "Country_isFeatured_idx" ON "Country"("isFeatured");

-- CreateIndex
CREATE UNIQUE INDEX "State_slug_key" ON "State"("slug");

-- CreateIndex
CREATE INDEX "State_countryId_idx" ON "State"("countryId");

-- CreateIndex
CREATE INDEX "State_slug_idx" ON "State"("slug");

-- CreateIndex
CREATE INDEX "State_isFeatured_idx" ON "State"("isFeatured");

-- CreateIndex
CREATE UNIQUE INDEX "Destination_slug_key" ON "Destination"("slug");

-- CreateIndex
CREATE INDEX "Destination_countryId_idx" ON "Destination"("countryId");

-- CreateIndex
CREATE INDEX "Destination_stateId_idx" ON "Destination"("stateId");

-- CreateIndex
CREATE INDEX "Destination_slug_idx" ON "Destination"("slug");

-- CreateIndex
CREATE INDEX "Destination_isFeatured_idx" ON "Destination"("isFeatured");

-- CreateIndex
CREATE UNIQUE INDEX "Category_slug_key" ON "Category"("slug");

-- CreateIndex
CREATE INDEX "Category_slug_idx" ON "Category"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Package_slug_key" ON "Package"("slug");

-- CreateIndex
CREATE INDEX "Package_slug_idx" ON "Package"("slug");

-- CreateIndex
CREATE INDEX "Package_isPopular_idx" ON "Package"("isPopular");

-- CreateIndex
CREATE INDEX "Package_isDomestic_idx" ON "Package"("isDomestic");

-- CreateIndex
CREATE INDEX "Package_countryId_idx" ON "Package"("countryId");

-- CreateIndex
CREATE INDEX "Package_stateId_idx" ON "Package"("stateId");

-- CreateIndex
CREATE INDEX "PackageVariant_packageId_idx" ON "PackageVariant"("packageId");

-- CreateIndex
CREATE INDEX "ItineraryDay_variantId_idx" ON "ItineraryDay"("variantId");

-- CreateIndex
CREATE INDEX "FAQ_sortOrder_idx" ON "FAQ"("sortOrder");

-- CreateIndex
CREATE UNIQUE INDEX "BlogPost_slug_key" ON "BlogPost"("slug");

-- CreateIndex
CREATE INDEX "BlogPost_slug_idx" ON "BlogPost"("slug");
