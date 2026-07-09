import { PrismaBetterSqlite3 } from "@prisma/adapter-better-sqlite3";
import fs from "fs";
import path from "path";

// Use the generated Prisma client
import { PrismaClient } from "../src/generated/prisma/client";

const adapter = new PrismaBetterSqlite3({
  url: path.resolve(__dirname, "../data/travel.db"),
});

const prisma = new PrismaClient({ adapter });

const JSON_DIR = path.resolve(__dirname, "../data/json");
const PACKAGES_DIR = path.join(JSON_DIR, "packages");

/** Minimal JSON shapes for seed data — avoids `any` while staying concise. */
interface JsonRecord {
  [key: string]: unknown;
}

interface CountryJson {
  id: string;
  name: string;
  slug: string;
  continent: string;
  is_domestic: boolean;
  is_featured?: boolean;
  capital: string;
  currency: string;
  language?: string[];
  visa_required_for_indians: string;
  visa_on_arrival?: boolean;
  description: string;
  popular_destinations?: string[];
  seo_title: string;
  seo_description: string;
  image?: string;
  package_count?: number;
}

interface StateJson {
  id: string;
  name: string;
  slug: string;
  country_id: string;
  capital: string;
  is_featured?: boolean;
  package_count?: number;
}

interface DestinationJson {
  id: string;
  name: string;
  slug: string;
  state_id?: string;
  country_id: string;
  type?: string;
  is_featured?: boolean;
  description: string;
  best_time_to_visit: string;
  climate?: string;
  top_attractions?: string[];
  nearby_destinations?: string[];
  seo_title: string;
  seo_description: string;
  image?: string;
  package_count?: number;
}

interface CategoryJson {
  id: string;
  name: string;
  slug: string;
  description: string;
  icon: string;
  seo_title: string;
  seo_description: string;
  package_count?: number;
}

interface PackageIndexEntry {
  id: string;
  slug: string;
  name: string;
  is_popular?: boolean;
  is_domestic?: boolean;
  destinations?: string[];
  destination_ids?: string[];
  primary_destination: string;
  category_ids?: string[];
  state_id?: string;
  country_id: string;
  min_nights: number;
  max_nights: number;
  min_days: number;
  max_days: number;
  duration_range: string;
  variant_count?: number;
  hero_image?: string;
  tags?: string[];
}

interface PackageDetailJson {
  overview?: string;
  highlights?: string[];
  inclusions?: string[];
  exclusions?: string[];
  notes?: string[];
  seo?: { title?: string; description?: string; keywords?: string[] };
  variants?: PackageVariantJson[];
}

interface PackageVariantJson {
  label: string;
  nights: number;
  days: number;
  duration_text?: string;
  old_html_file?: string;
  itinerary?: ItineraryDayJson[];
}

interface ItineraryDayJson {
  day: number;
  title?: string;
  description?: string;
}

interface HeroSlideJson {
  id: number;
  image: string;
  tag: string;
  title: string;
  description: string;
}

interface FaqJson {
  question: string;
  answer: string;
}

interface BlogJson {
  id: string;
  slug: string;
  title: string;
  category: string;
  destinations?: string[];
  excerpt: string;
  author: string;
  tags?: string[];
}

interface TestimonialJson {
  id: string;
  reviewer: string;
  review: string;
  rating: number;
  package: string;
  source: string;
}

function readJson(filename: string): unknown {
  const filePath = path.join(JSON_DIR, filename);
  return JSON.parse(fs.readFileSync(filePath, "utf-8"));
}

function readPackageJson(slug: string): unknown {
  const filePath = path.join(PACKAGES_DIR, `${slug}.json`);
  if (!fs.existsSync(filePath)) return null;
  return JSON.parse(fs.readFileSync(filePath, "utf-8"));
}

async function main() {
  console.log("🌱 Starting seed...");

  // ── Configure SQLite for production (WAL mode, foreign keys, optimized sync) ──
  await prisma.$queryRawUnsafe("PRAGMA journal_mode=WAL");
  await prisma.$queryRawUnsafe("PRAGMA foreign_keys=ON");
  await prisma.$queryRawUnsafe("PRAGMA busy_timeout=5000");
  await prisma.$queryRawUnsafe("PRAGMA synchronous=NORMAL");
  console.log("  ✓ SQLite configured (WAL mode, FK enforcement)");

  // ── Clear existing data in correct order (respecting FK constraints) ──
  await prisma.itineraryDay.deleteMany();
  await prisma.packageVariant.deleteMany();
  await prisma.package.deleteMany();
  await prisma.destination.deleteMany();
  await prisma.state.deleteMany();
  await prisma.country.deleteMany();
  await prisma.category.deleteMany();
  await prisma.heroSlide.deleteMany();
  await prisma.fAQ.deleteMany();
  await prisma.fAQTagline.deleteMany();
  await prisma.company.deleteMany();
  await prisma.blogPost.deleteMany();
  await prisma.testimonial.deleteMany();
  await prisma.siteConfig.deleteMany();

  console.log("  ✓ Cleared existing data");

  // ── Seed Countries ──
  const countriesData = readJson("countries.json") as { countries: CountryJson[]; total: number };
  for (const c of countriesData.countries) {
    await prisma.country.create({
      data: {
        id: c.id,
        name: c.name,
        slug: c.slug,
        continent: c.continent,
        isDomestic: c.is_domestic,
        isFeatured: c.is_featured ?? false,
        capital: c.capital,
        currency: c.currency,
        languages: JSON.stringify(c.language || []),
        visaRequiredForIndians: c.visa_required_for_indians,
        visaOnArrival: c.visa_on_arrival ?? false,
        description: c.description,
        popularDestinations: JSON.stringify(c.popular_destinations || []),
        seoTitle: c.seo_title,
        seoDescription: c.seo_description,
        image: c.image || "",
        packageCount: c.package_count ?? 0,
      },
    });
  }
  console.log(`  ✓ Seeded ${countriesData.total} countries`);

  // ── Seed States ──
  const statesData = readJson("states.json") as { states: StateJson[]; total: number };
  for (const s of statesData.states) {
    await prisma.state.create({
      data: {
        id: s.id,
        name: s.name,
        slug: s.slug,
        countryId: s.country_id,
        capital: s.capital,
        isFeatured: s.is_featured ?? false,
        packageCount: s.package_count ?? 0,
      },
    });
  }
  console.log(`  ✓ Seeded ${statesData.total} states`);

  // ── Seed Destinations ──
  const destinationsData = readJson("destinations.json") as {
    destinations: DestinationJson[];
    total: number;
  };
  for (const d of destinationsData.destinations) {
    await prisma.destination.create({
      data: {
        id: d.id,
        name: d.name,
        slug: d.slug,
        stateId: d.state_id || null,
        countryId: d.country_id,
        type: d.type || "city",
        isFeatured: d.is_featured ?? false,
        description: d.description,
        bestTimeToVisit: d.best_time_to_visit,
        climate: d.climate || "",
        topAttractions: JSON.stringify(d.top_attractions || []),
        nearbyDestinations: JSON.stringify(d.nearby_destinations || []),
        seoTitle: d.seo_title,
        seoDescription: d.seo_description,
        image: d.image || "",
        packageCount: d.package_count ?? 0,
      },
    });
  }
  console.log(`  ✓ Seeded ${destinationsData.total} destinations`);

  // ── Seed Categories ──
  const categoriesData = readJson("categories.json") as {
    categories: CategoryJson[];
    total: number;
  };
  for (const cat of categoriesData.categories) {
    await prisma.category.create({
      data: {
        id: cat.id,
        name: cat.name,
        slug: cat.slug,
        description: cat.description,
        icon: cat.icon,
        seoTitle: cat.seo_title,
        seoDescription: cat.seo_description,
        packageCount: cat.package_count ?? 0,
      },
    });
  }
  console.log(`  ✓ Seeded ${categoriesData.total} categories`);

  // ── Seed Packages (from index + individual detail files) ──
  const packagesData = readJson("packages-index.json") as {
    packages: PackageIndexEntry[];
    total: number;
  };
  let packageCount = 0;
  let variantCount = 0;
  let itineraryCount = 0;
  let variantSeq = 0;
  let daySeq = 0;

  for (const pkg of packagesData.packages) {
    // Try to read individual package detail file
    const detail = readPackageJson(pkg.slug) as PackageDetailJson | null;

    const pkgData = {
      id: pkg.id,
      slug: pkg.slug,
      name: pkg.name,
      isPopular: pkg.is_popular ?? false,
      isDomestic: pkg.is_domestic ?? true,
      destinations: JSON.stringify(pkg.destinations || []),
      destinationIds: JSON.stringify(pkg.destination_ids || []),
      primaryDestination: pkg.primary_destination,
      categoryIds: JSON.stringify(pkg.category_ids || []),
      stateId: pkg.state_id || null,
      countryId: pkg.country_id,
      minNights: pkg.min_nights,
      maxNights: pkg.max_nights,
      minDays: pkg.min_days,
      maxDays: pkg.max_days,
      durationRange: pkg.duration_range,
      variantCount: pkg.variant_count ?? 1,
      heroImage: pkg.hero_image || "",
      tags: JSON.stringify(pkg.tags || []),
      overview: "",
      highlights: "[]",
      inclusions: "[]",
      exclusions: "[]",
      notes: "[]",
      seoTitle: "",
      seoDescription: "",
      seoKeywords: "[]",
    };

    // Merge detail fields if available
    if (detail) {
      pkgData.overview = detail.overview || "";
      pkgData.highlights = JSON.stringify(detail.highlights || []);
      pkgData.inclusions = JSON.stringify(detail.inclusions || []);
      pkgData.exclusions = JSON.stringify(detail.exclusions || []);
      pkgData.notes = JSON.stringify(detail.notes || []);
      pkgData.seoTitle = detail.seo?.title || "";
      pkgData.seoDescription = detail.seo?.description || "";
      pkgData.seoKeywords = JSON.stringify(detail.seo?.keywords || []);
    }

    await prisma.package.create({ data: pkgData });
    packageCount++;

    // Seed variants and itinerary from detail file
    if (detail?.variants && Array.isArray(detail.variants)) {
      for (const variant of detail.variants) {
        variantSeq++;
        const variantId = `variant_${variantSeq}`;
        await prisma.packageVariant.create({
          data: {
            id: variantId,
            packageId: pkg.slug,
            label: variant.label,
            nights: variant.nights,
            days: variant.days,
            durationText: variant.duration_text || `${variant.nights}N/${variant.days}D`,
            oldHtmlFile: variant.old_html_file || "",
          },
        });
        variantCount++;

        if (variant.itinerary && Array.isArray(variant.itinerary)) {
          for (const day of variant.itinerary) {
            daySeq++;
            const dayId = `day_${daySeq}`;
            await prisma.itineraryDay.create({
              data: {
                id: dayId,
                variantId: variantId,
                day: day.day,
                title: day.title || "",
                description: day.description || "",
              },
            });
            itineraryCount++;
          }
        }
      }
    }
  }
  console.log(
    `  ✓ Seeded ${packageCount} packages, ${variantCount} variants, ${itineraryCount} itinerary days`,
  );

  // ── Seed Hero Slides ──
  const heroData = readJson("hero.json") as { slides: HeroSlideJson[] };
  for (const slide of heroData.slides) {
    await prisma.heroSlide.create({
      data: {
        id: slide.id,
        image: slide.image,
        tag: slide.tag,
        title: slide.title,
        description: slide.description,
      },
    });
  }
  console.log(`  ✓ Seeded ${heroData.slides.length} hero slides`);

  // ── Seed FAQs ──
  const faqData = readJson("faq.json") as { tagline: string; faqs: FaqJson[] };
  // Seed tagline
  if (faqData.tagline) {
    await prisma.fAQTagline.create({
      data: { id: 1, tagline: faqData.tagline },
    });
  }
  for (let i = 0; i < faqData.faqs.length; i++) {
    const faq = faqData.faqs[i];
    await prisma.fAQ.create({
      data: {
        question: faq.question,
        answer: faq.answer,
        sortOrder: i,
      },
    });
  }
  console.log(`  ✓ Seeded ${faqData.faqs.length} FAQs`);

  // ── Seed Company ──
  const companyData = readJson("company.json") as JsonRecord;
  const wh = companyData.working_hours || {};
  await prisma.company.create({
    data: {
      id: 1,
      name: companyData.name,
      tagline: companyData.tagline,
      website: companyData.website,
      phones: JSON.stringify(companyData.phone || []),
      email: companyData.email,
      address: companyData.address,
      timezone: wh.timezone || "Asia/Kolkata",
      schedule: JSON.stringify(wh.schedule || []),
      exceptions: JSON.stringify(wh.exceptions || []),
      socialMedia: JSON.stringify(companyData.social_media || {}),
      certifications: JSON.stringify(companyData.certifications || []),
      about: companyData.about,
      whatsappNumber: companyData.whatsapp_number || "",
      googleAnalytics: companyData.google_analytics || "",
      googleTagManager: companyData.google_tag_manager || "",
    },
  });
  console.log("  ✓ Seeded company info");

  // ── Seed Blogs ──
  const blogsData = readJson("blogs.json") as { blogs: BlogJson[]; total: number };
  for (const blog of blogsData.blogs) {
    await prisma.blogPost.create({
      data: {
        id: blog.id,
        slug: blog.slug,
        title: blog.title,
        category: blog.category,
        destinations: JSON.stringify(blog.destinations || []),
        excerpt: blog.excerpt,
        author: blog.author,
        tags: JSON.stringify(blog.tags || []),
      },
    });
  }
  console.log(`  ✓ Seeded ${blogsData.total} blog posts`);

  // ── Seed Testimonials ──
  const testimonialsData = readJson("testimonials.json") as {
    testimonials: TestimonialJson[];
    total: number;
  };
  for (const t of testimonialsData.testimonials) {
    await prisma.testimonial.create({
      data: {
        id: t.id,
        reviewer: t.reviewer,
        review: t.review,
        rating: t.rating,
        package: t.package,
        source: t.source,
      },
    });
  }
  console.log(`  ✓ Seeded ${testimonialsData.total} testimonials`);

  // ── Seed SiteConfig ──
  const siteConfigData = readJson("site-config.json") as JsonRecord;
  await prisma.siteConfig.create({
    data: {
      id: 1,
      siteName: siteConfigData.site_name,
      domain: siteConfigData.domain,
      navigation: JSON.stringify(siteConfigData.navigation || {}),
      homeTitle: siteConfigData.seo?.home_title || "",
      homeDescription: siteConfigData.seo?.home_description || "",
      ogImage: siteConfigData.seo?.og_image || "",
      crossLinkingRules: JSON.stringify(siteConfigData.cross_linking_rules || {}),
      urlStructure: JSON.stringify(siteConfigData.url_structure || {}),
      seoPrinciples: JSON.stringify(siteConfigData.seo_principles || []),
    },
  });
  console.log("  ✓ Seeded site config");

  // Consolidate SQLite file (disable WAL for Vercel read-only filesystem support) ──
  console.log("\n🧹 Consolidating database file for production deployment...");
  await prisma.$queryRawUnsafe("PRAGMA journal_mode=DELETE");
  await prisma.$queryRawUnsafe("VACUUM");

  console.log("\n✅ Seed complete!");
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error("❌ Seed failed:", e);
    await prisma.$disconnect();
    process.exit(1);
  });
