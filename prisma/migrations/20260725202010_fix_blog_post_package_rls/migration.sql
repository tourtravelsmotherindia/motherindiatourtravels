-- Enable Row-Level Security
ALTER TABLE "BlogPostPackage" ENABLE ROW LEVEL SECURITY;

-- Grant SELECT privileges to anon and authenticated roles
GRANT SELECT ON "BlogPostPackage" TO anon, authenticated;
GRANT ALL ON "BlogPostPackage" TO service_role;

-- Add Public Read Policy
DROP POLICY IF EXISTS "public_read_blog_post_packages" ON "BlogPostPackage";
CREATE POLICY "public_read_blog_post_packages" ON "BlogPostPackage" FOR SELECT TO anon, authenticated USING (true);

-- Add Admin CRUD Policy
DROP POLICY IF EXISTS "admin_crud_blog_post_package" ON "BlogPostPackage";
CREATE POLICY "admin_crud_blog_post_package" ON "BlogPostPackage" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));
