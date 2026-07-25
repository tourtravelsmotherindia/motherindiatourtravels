-- AlterTable
ALTER TABLE "BlogPost" ADD COLUMN     "countryId" TEXT,
ADD COLUMN     "images" TEXT[],
ADD COLUMN     "seoDescription" TEXT NOT NULL DEFAULT '',
ADD COLUMN     "seoKeywords" TEXT[],
ADD COLUMN     "seoTitle" TEXT NOT NULL DEFAULT '',
ADD COLUMN     "stateId" TEXT;

-- AlterTable
ALTER TABLE "BlogPostCategory" ADD COLUMN     "sortOrder" INTEGER NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "BlogPostPackage" (
    "blogPostId" TEXT NOT NULL,
    "packageId" TEXT NOT NULL,

    CONSTRAINT "BlogPostPackage_pkey" PRIMARY KEY ("blogPostId","packageId")
);

-- CreateIndex
CREATE INDEX "BlogPostPackage_blogPostId_idx" ON "BlogPostPackage"("blogPostId");

-- CreateIndex
CREATE INDEX "BlogPostPackage_packageId_idx" ON "BlogPostPackage"("packageId");

-- CreateIndex
CREATE INDEX "BlogPost_stateId_idx" ON "BlogPost"("stateId");

-- CreateIndex
CREATE INDEX "BlogPost_countryId_idx" ON "BlogPost"("countryId");

-- AddForeignKey
ALTER TABLE "BlogPost" ADD CONSTRAINT "BlogPost_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "State"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlogPost" ADD CONSTRAINT "BlogPost_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlogPostPackage" ADD CONSTRAINT "BlogPostPackage_blogPostId_fkey" FOREIGN KEY ("blogPostId") REFERENCES "BlogPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlogPostPackage" ADD CONSTRAINT "BlogPostPackage_packageId_fkey" FOREIGN KEY ("packageId") REFERENCES "Package"("id") ON DELETE CASCADE ON UPDATE CASCADE;
