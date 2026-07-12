-- Enable RLS and add public read policies on content tables
ALTER TABLE "Package" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_packages" ON "Package";
CREATE POLICY "public_read_packages" ON "Package" FOR SELECT USING (true);

ALTER TABLE "GalleryImage" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_gallery" ON "GalleryImage";
CREATE POLICY "public_read_gallery" ON "GalleryImage" FOR SELECT USING (true);

ALTER TABLE "Destination" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_destinations" ON "Destination";
CREATE POLICY "public_read_destinations" ON "Destination" FOR SELECT USING (true);

ALTER TABLE "FAQ" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_faqs" ON "FAQ";
CREATE POLICY "public_read_faqs" ON "FAQ" FOR SELECT USING (true);

ALTER TABLE "BlogPost" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_blogs" ON "BlogPost";
CREATE POLICY "public_read_blogs" ON "BlogPost" FOR SELECT USING (true);

ALTER TABLE "Testimonial" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_testimonials" ON "Testimonial";
CREATE POLICY "public_read_testimonials" ON "Testimonial" FOR SELECT USING (true);

ALTER TABLE "SiteSection" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_sections" ON "SiteSection";
CREATE POLICY "public_read_sections" ON "SiteSection" FOR SELECT USING (true);

ALTER TABLE "Company" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_company" ON "Company";
CREATE POLICY "public_read_company" ON "Company" FOR SELECT USING (true);

ALTER TABLE "HeroConfig" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_hero" ON "HeroConfig";
CREATE POLICY "public_read_hero" ON "HeroConfig" FOR SELECT USING (true);

ALTER TABLE "HeroSlide" ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public_read_slides" ON "HeroSlide";
CREATE POLICY "public_read_slides" ON "HeroSlide" FOR SELECT USING (true);
