-- AlterTable (Destination)
ALTER TABLE "Destination" ADD COLUMN "latitude" REAL;
ALTER TABLE "Destination" ADD COLUMN "longitude" REAL;

-- AlterTable (ItineraryDay)
ALTER TABLE "ItineraryDay" ADD COLUMN "images" TEXT NOT NULL DEFAULT '[]';

-- AlterTable (Package)
ALTER TABLE "Package" ADD COLUMN "galleryImages" TEXT NOT NULL DEFAULT '[]';
ALTER TABLE "Package" ADD COLUMN "tourStyle" TEXT NOT NULL DEFAULT 'Classic';
ALTER TABLE "Package" ADD COLUMN "groupSizeMax" INTEGER NOT NULL DEFAULT 12;
ALTER TABLE "Package" ADD COLUMN "groupSizeAvg" INTEGER NOT NULL DEFAULT 10;
ALTER TABLE "Package" ADD COLUMN "stayType" TEXT NOT NULL DEFAULT 'Premium Hotels';
ALTER TABLE "Package" ADD COLUMN "marketingPitch" TEXT NOT NULL DEFAULT '';
