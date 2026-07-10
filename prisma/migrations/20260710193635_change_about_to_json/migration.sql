
-- AlterTable
ALTER TABLE "Company" DROP COLUMN "about",
ADD COLUMN     "about" JSONB NOT NULL;
