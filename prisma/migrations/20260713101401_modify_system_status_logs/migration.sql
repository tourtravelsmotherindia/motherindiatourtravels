/*
  Warnings:

  - You are about to drop the column `updatedAt` on the `SystemStatus` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "SystemStatus" DROP COLUMN "updatedAt",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "id" SET DEFAULT gen_random_uuid();

-- Enable Row Level Security
ALTER TABLE "SystemStatus" ENABLE ROW LEVEL SECURITY;

-- Create policy for Admin CRUD
DROP POLICY IF EXISTS "admin_crud_system_status" ON "SystemStatus";
CREATE POLICY "admin_crud_system_status" ON "SystemStatus" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));
