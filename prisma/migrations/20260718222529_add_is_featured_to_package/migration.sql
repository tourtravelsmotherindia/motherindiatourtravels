-- AlterTable
ALTER TABLE "Package" ADD COLUMN     "isFeatured" BOOLEAN NOT NULL DEFAULT false;

-- CreateIndex
CREATE INDEX "Package_isFeatured_idx" ON "Package"("isFeatured");
