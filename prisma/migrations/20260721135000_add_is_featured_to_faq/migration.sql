-- AlterTable
ALTER TABLE "FAQ" ADD COLUMN "isFeatured" BOOLEAN NOT NULL DEFAULT false;

-- CreateIndex
CREATE INDEX "FAQ_isFeatured_idx" ON "FAQ"("isFeatured");
