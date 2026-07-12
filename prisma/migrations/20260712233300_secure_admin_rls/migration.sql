-- Create the auth schema and a stub auth.uid() function if they don't exist (needed for Prisma shadow database validation)
CREATE SCHEMA IF NOT EXISTS auth;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_proc p 
    JOIN pg_namespace n ON p.pronamespace = n.oid 
    WHERE n.nspname = 'auth' AND p.proname = 'uid'
  ) THEN
    CREATE FUNCTION auth.uid() RETURNS uuid AS 'SELECT NULL::uuid;' LANGUAGE sql STABLE;
  END IF;
END $$;

-- 1. Create is_admin helper function to prevent RLS recursion
CREATE OR REPLACE FUNCTION public.is_admin(user_id uuid)
RETURNS boolean
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public."User" WHERE id = user_id::text AND role = 'ADMIN'
  );
END;
$$ LANGUAGE plpgsql;

-- 2. Grant proper privileges to authenticated role at the schema level
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO authenticated;
GRANT ALL ON ALL ROUTINES IN SCHEMA public TO authenticated;

-- Ensure default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;

-- 3. RLS Policies for User profile table
ALTER TABLE "User" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "users_read_own_profile" ON "User";
CREATE POLICY "users_read_own_profile" ON "User" FOR SELECT TO authenticated USING (id = auth.uid()::text);

DROP POLICY IF EXISTS "admins_all_profiles" ON "User";
CREATE POLICY "admins_all_profiles" ON "User" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

-- 4. Admin CRUD Policies for Content Tables
DROP POLICY IF EXISTS "admin_crud_package" ON "Package";
CREATE POLICY "admin_crud_package" ON "Package" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_package_variant" ON "PackageVariant";
CREATE POLICY "admin_crud_package_variant" ON "PackageVariant" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_destination" ON "Destination";
CREATE POLICY "admin_crud_destination" ON "Destination" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_destination_neighbour" ON "DestinationNeighbour";
CREATE POLICY "admin_crud_destination_neighbour" ON "DestinationNeighbour" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_attraction" ON "Attraction";
CREATE POLICY "admin_crud_attraction" ON "Attraction" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_category" ON "Category";
CREATE POLICY "admin_crud_category" ON "Category" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_country" ON "Country";
CREATE POLICY "admin_crud_country" ON "Country" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_state" ON "State";
CREATE POLICY "admin_crud_state" ON "State" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_package_destination" ON "PackageDestination";
CREATE POLICY "admin_crud_package_destination" ON "PackageDestination" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_package_category" ON "PackageCategory";
CREATE POLICY "admin_crud_package_category" ON "PackageCategory" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_package_attraction" ON "PackageAttraction";
CREATE POLICY "admin_crud_package_attraction" ON "PackageAttraction" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_itinerary_day" ON "ItineraryDay";
CREATE POLICY "admin_crud_itinerary_day" ON "ItineraryDay" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_hero_config" ON "HeroConfig";
CREATE POLICY "admin_crud_hero_config" ON "HeroConfig" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_hero_slide" ON "HeroSlide";
CREATE POLICY "admin_crud_hero_slide" ON "HeroSlide" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_site_section" ON "SiteSection";
CREATE POLICY "admin_crud_site_section" ON "SiteSection" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_faq" ON "FAQ";
CREATE POLICY "admin_crud_faq" ON "FAQ" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_gallery_image" ON "GalleryImage";
CREATE POLICY "admin_crud_gallery_image" ON "GalleryImage" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_blog_post_category" ON "BlogPostCategory";
CREATE POLICY "admin_crud_blog_post_category" ON "BlogPostCategory" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_blog_post" ON "BlogPost";
CREATE POLICY "admin_crud_blog_post" ON "BlogPost" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_company" ON "Company";
CREATE POLICY "admin_crud_company" ON "Company" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_testimonial" ON "Testimonial";
CREATE POLICY "admin_crud_testimonial" ON "Testimonial" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

-- 5. Admin CRUD Policies for Submission Tables
DROP POLICY IF EXISTS "admin_crud_booking_inquiry" ON "BookingInquiry";
CREATE POLICY "admin_crud_booking_inquiry" ON "BookingInquiry" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_contact_submission" ON "ContactSubmission";
CREATE POLICY "admin_crud_contact_submission" ON "ContactSubmission" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));

DROP POLICY IF EXISTS "admin_crud_newsletter_subscriber" ON "NewsletterSubscriber";
CREATE POLICY "admin_crud_newsletter_subscriber" ON "NewsletterSubscriber" FOR ALL TO authenticated USING (public.is_admin(auth.uid())) WITH CHECK (public.is_admin(auth.uid()));