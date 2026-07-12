-- 1. Grant usage on the public schema to Supabase API roles
GRANT USAGE ON SCHEMA public TO anon, authenticated, service_role;

-- 2. Grant all privileges on all tables/sequences/routines to service_role (the admin role)
GRANT ALL ON ALL TABLES IN SCHEMA public TO service_role;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO service_role;
GRANT ALL ON ALL ROUTINES IN SCHEMA public TO service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON ROUTINES TO service_role;

-- 3. Content Tables: Grant SELECT only (Read-Only) to anon and authenticated roles
GRANT SELECT ON "Country", "State", "Destination", "DestinationNeighbour", "Attraction", "Category", "Package", "PackageDestination", "PackageCategory", "PackageAttraction", "PackageVariant", "ItineraryDay", "HeroConfig", "HeroSlide", "SiteSection", "FAQ", "GalleryImage", "BlogPostCategory", "BlogPost", "Company", "Testimonial" TO anon, authenticated;

-- 4. Submission Tables: Grant INSERT (and UPDATE for newsletter) only (Write-Only) to anon and authenticated roles
GRANT INSERT ON "BookingInquiry", "ContactSubmission" TO anon, authenticated;
GRANT INSERT, UPDATE ON "NewsletterSubscriber" TO anon, authenticated;

-- 5. Enable Row-Level Security (RLS) on Submission Tables
ALTER TABLE "BookingInquiry" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ContactSubmission" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "NewsletterSubscriber" ENABLE ROW LEVEL SECURITY;

-- 6. Add RLS Policies for Submission Tables (Insert only, no select)
DROP POLICY IF EXISTS "public_insert_booking_inquiry" ON "BookingInquiry";
CREATE POLICY "public_insert_booking_inquiry" ON "BookingInquiry" FOR INSERT TO anon, authenticated WITH CHECK (true);

DROP POLICY IF EXISTS "public_insert_contact_submission" ON "ContactSubmission";
CREATE POLICY "public_insert_contact_submission" ON "ContactSubmission" FOR INSERT TO anon, authenticated WITH CHECK (true);

DROP POLICY IF EXISTS "public_insert_newsletter_subscriber" ON "NewsletterSubscriber";
CREATE POLICY "public_insert_newsletter_subscriber" ON "NewsletterSubscriber" FOR INSERT TO anon, authenticated WITH CHECK (true);

DROP POLICY IF EXISTS "public_update_newsletter_subscriber" ON "NewsletterSubscriber";
CREATE POLICY "public_update_newsletter_subscriber" ON "NewsletterSubscriber" FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);

-- 7. Enable RLS and add public Read policies for remaining content tables
ALTER TABLE "Country" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_countries" ON "Country";
CREATE POLICY "public_read_countries" ON "Country" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "State" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_states" ON "State";
CREATE POLICY "public_read_states" ON "State" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "DestinationNeighbour" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_destination_neighbours" ON "DestinationNeighbour";
CREATE POLICY "public_read_destination_neighbours" ON "DestinationNeighbour" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "Attraction" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_attractions" ON "Attraction";
CREATE POLICY "public_read_attractions" ON "Attraction" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "Category" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_categories" ON "Category";
CREATE POLICY "public_read_categories" ON "Category" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "PackageDestination" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_package_destinations" ON "PackageDestination";
CREATE POLICY "public_read_package_destinations" ON "PackageDestination" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "PackageCategory" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_package_categories" ON "PackageCategory";
CREATE POLICY "public_read_package_categories" ON "PackageCategory" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "PackageAttraction" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_package_attractions" ON "PackageAttraction";
CREATE POLICY "public_read_package_attractions" ON "PackageAttraction" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "PackageVariant" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_package_variants" ON "PackageVariant";
CREATE POLICY "public_read_package_variants" ON "PackageVariant" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "ItineraryDay" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_itinerary_days" ON "ItineraryDay";
CREATE POLICY "public_read_itinerary_days" ON "ItineraryDay" FOR SELECT TO anon, authenticated USING (true);

ALTER TABLE "BlogPostCategory" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_blog_post_categories" ON "BlogPostCategory";
CREATE POLICY "public_read_blog_post_categories" ON "BlogPostCategory" FOR SELECT TO anon, authenticated USING (true);