-- AlterTable
ALTER TABLE "BookingInquiry" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();

-- AlterTable
ALTER TABLE "ContactSubmission" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();

-- AlterTable
ALTER TABLE "NewsletterSubscriber" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();
