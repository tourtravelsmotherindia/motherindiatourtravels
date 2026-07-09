/**
 * Verification script: compares data/json/ against the SQLite database.
 * Reports missing rows, missing fields, count mismatches, ID/slug mismatches,
 * duplicate records, and orphaned relations.
 */
import { PrismaBetterSqlite3 } from "@prisma/adapter-better-sqlite3";
import fs from "fs";
import path from "path";

import { PrismaClient } from "../src/generated/prisma/client";

const JSON_DIR = path.resolve(__dirname, "../data/json");
const PACKAGES_DIR = path.join(JSON_DIR, "packages");

const adapter = new PrismaBetterSqlite3({
  url: path.resolve(__dirname, "../data/travel.db"),
});
const prisma = new PrismaClient({ adapter });

function readJson(filename: string): unknown {
  const filePath = path.join(JSON_DIR, filename);
  return JSON.parse(fs.readFileSync(filePath, "utf-8"));
}

function readPackageJson(slug: string): unknown {
  const filePath = path.join(PACKAGES_DIR, `${slug}.json`);
  if (!fs.existsSync(filePath)) return null;
  return JSON.parse(fs.readFileSync(filePath, "utf-8"));
}

interface Failure {
  entity: string;
  type: string;
  detail: string;
}

const failures: Failure[] = [];

function fail(entity: string, type: string, detail: string) {
  failures.push({ entity, type, detail });
}

// ─── Helpers ────────────────────────────────────────────────────────────────────

function normalizeArray(val: unknown): string[] {
  if (Array.isArray(val)) return val as string[];
  if (typeof val === "string") {
    try {
      return JSON.parse(val);
    } catch {
      return [];
    }
  }
  return [];
}

function sorted(arr: string[]): string[] {
  return [...arr].sort();
}

// ─── Verification Functions ─────────────────────────────────────────────────────

async function verifyCountries() {
  const json = readJson("countries.json") as { countries: Record<string, unknown>[]; total: number };
  const db = await prisma.country.findMany();

  if (db.length !== json.total) {
    fail("Country", "count", `JSON has ${json.total}, DB has ${db.length}`);
  }

  const jsonIds = new Set(json.countries.map((c: Record<string, unknown>) => c.id));
  const dbIds = new Set(db.map((c) => c.id));

  for (const c of json.countries) {
    if (!dbIds.has(c.id)) {
      fail("Country", "missing", `Country "${c.id}" not found in DB`);
      continue;
    }
    const dbRow = db.find((r) => r.id === c.id)!;

    // Check key fields
    const checks: [string, unknown, unknown][] = [
      ["name", c.name, dbRow.name],
      ["slug", c.slug, dbRow.slug],
      ["continent", c.continent, dbRow.continent],
      ["capital", c.capital, dbRow.capital],
      ["currency", c.currency, dbRow.currency],
    ];
    for (const [field, jsonVal, dbVal] of checks) {
      if (jsonVal !== dbVal) {
        fail("Country", "mismatch", `${c.id}.${field}: JSON="${jsonVal}" DB="${dbVal}"`);
      }
    }

    // Language array
    const jsonLang = sorted((c.language as string[]) || []);
    const dbLang = sorted(normalizeArray(dbRow.languages));
    if (JSON.stringify(jsonLang) !== JSON.stringify(dbLang)) {
      fail("Country", "mismatch", `${c.id}.language arrays differ`);
    }
  }

  for (const dbId of dbIds) {
    if (!jsonIds.has(dbId)) {
      fail("Country", "extra", `DB has extra country "${dbId}" not in JSON`);
    }
  }
}

async function verifyStates() {
  const json = readJson("states.json") as { states: Record<string, unknown>[]; total: number };
  const db = await prisma.state.findMany();

  if (db.length !== json.total) {
    fail("State", "count", `JSON has ${json.total}, DB has ${db.length}`);
  }

  for (const s of json.states) {
    const dbRow = db.find((r) => r.id === s.id);
    if (!dbRow) {
      fail("State", "missing", `State "${s.id}" not in DB`);
      continue;
    }

    const checks: [string, unknown, unknown][] = [
      ["name", s.name, dbRow.name],
      ["slug", s.slug, dbRow.slug],
      ["country_id", s.country_id, dbRow.countryId],
      ["capital", s.capital, dbRow.capital],
    ];
    for (const [field, jsonVal, dbVal] of checks) {
      if (jsonVal !== dbVal) {
        fail("State", "mismatch", `${s.id}.${field}: JSON="${jsonVal}" DB="${dbVal}"`);
      }
    }
  }
}

async function verifyDestinations() {
  const json = readJson("destinations.json") as { destinations: Record<string, unknown>[]; total: number };
  const db = await prisma.destination.findMany();

  if (db.length !== json.total) {
    fail("Destination", "count", `JSON has ${json.total}, DB has ${db.length}`);
  }

  for (const d of json.destinations) {
    const dbRow = db.find((r) => r.id === d.id);
    if (!dbRow) {
      fail("Destination", "missing", `Destination "${d.id}" not in DB`);
      continue;
    }

    const checks: [string, unknown, unknown][] = [
      ["name", d.name, dbRow.name],
      ["slug", d.slug, dbRow.slug],
      ["country_id", d.country_id, dbRow.countryId],
      ["type", d.type || "city", dbRow.type],
    ];
    for (const [field, jsonVal, dbVal] of checks) {
      if (jsonVal !== dbVal) {
        fail("Destination", "mismatch", `${d.id}.${field}: JSON="${jsonVal}" DB="${dbVal}"`);
      }
    }

    // Check top_attractions
    const jsonAttrs = sorted((d.top_attractions as string[]) || []);
    const dbAttrs = sorted(normalizeArray(dbRow.topAttractions));
    if (JSON.stringify(jsonAttrs) !== JSON.stringify(dbAttrs)) {
      fail("Destination", "mismatch", `${d.id}.top_attractions arrays differ`);
    }
  }
}

async function verifyCategories() {
  const json = readJson("categories.json") as { categories: Record<string, unknown>[]; total: number };
  const db = await prisma.category.findMany();

  if (db.length !== json.total) {
    fail("Category", "count", `JSON has ${json.total}, DB has ${db.length}`);
  }

  for (const cat of json.categories) {
    const dbRow = db.find((r) => r.id === cat.id);
    if (!dbRow) {
      fail("Category", "missing", `Category "${cat.id}" not in DB`);
      continue;
    }

    const checks: [string, unknown, unknown][] = [
      ["name", cat.name, dbRow.name],
      ["slug", cat.slug, dbRow.slug],
    ];
    for (const [field, jsonVal, dbVal] of checks) {
      if (jsonVal !== dbVal) {
        fail("Category", "mismatch", `${cat.id}.${field}: JSON="${jsonVal}" DB="${dbVal}"`);
      }
    }
  }
}

async function verifyPackages() {
  const json = readJson("packages-index.json") as { packages: Record<string, unknown>[]; total: number };
  const db = await prisma.package.findMany();

  if (db.length !== json.total) {
    fail("Package", "count", `JSON index has ${json.total}, DB has ${db.length}`);
  }

  for (const pkg of json.packages) {
    const dbRow = db.find((r) => r.id === pkg.id);
    if (!dbRow) {
      fail("Package", "missing", `Package "${pkg.id}" not in DB`);
      continue;
    }

    // Basic fields
    const checks: [string, unknown, unknown][] = [
      ["slug", pkg.slug, dbRow.slug],
      ["name", pkg.name, dbRow.name],
      ["country_id", pkg.country_id, dbRow.countryId],
      ["duration_range", pkg.duration_range, dbRow.durationRange],
    ];
    for (const [field, jsonVal, dbVal] of checks) {
      if (jsonVal !== dbVal) {
        fail("Package", "mismatch", `${pkg.id}.${field}: JSON="${jsonVal}" DB="${dbVal}"`);
      }
    }

    // Detail file exists?
    const detail = readPackageJson(pkg.slug) as Record<string, unknown> | null;
    if (detail) {
      // Check variants count
      const dbVariants = await prisma.packageVariant.findMany({
        where: { packageId: pkg.id },
      });
      const detailVariants = (detail.variants as unknown[]) || [];
      if (dbVariants.length !== detailVariants.length) {
        fail(
          "Package",
          "mismatch",
          `${pkg.id}: JSON has ${detailVariants.length} variants, DB has ${dbVariants.length}`,
        );
      }

      // Check highlights
      const jsonHighlights = sorted((detail.highlights as string[]) || []);
      const dbHighlights = sorted(normalizeArray(dbRow.highlights));
      if (JSON.stringify(jsonHighlights) !== JSON.stringify(dbHighlights)) {
        fail("Package", "mismatch", `${pkg.id}.highlights arrays differ`);
      }

      // Check inclusions
      const jsonIncl = (detail.inclusions as string[]) || [];
      const dbIncl = normalizeArray(dbRow.inclusions);
      if (jsonIncl.length !== dbIncl.length) {
        fail(
          "Package",
          "mismatch",
          `${pkg.id}: JSON has ${jsonIncl.length} inclusions, DB has ${dbIncl.length}`,
        );
      }

      // Check SEO
      const detailSeo = detail.seo as Record<string, unknown> | undefined;
      if (detailSeo) {
        if (detailSeo.title !== dbRow.seoTitle) {
          fail(
            "Package",
            "mismatch",
            `${pkg.id}.seo.title: JSON="${detailSeo.title}" DB="${dbRow.seoTitle}"`,
          );
        }
      }
    }
  }

  // Check for duplicate slugs
  const slugs = db.map((p) => p.slug);
  const uniqueSlugs = new Set(slugs);
  if (slugs.length !== uniqueSlugs.size) {
    fail("Package", "duplicate", "Duplicate slugs found in DB");
  }
}

async function verifyHeroSlides() {
  const json = readJson("hero.json") as { slides: Record<string, unknown>[] };
  const db = await prisma.heroSlide.findMany({ orderBy: { id: "asc" } });

  if (db.length !== json.slides.length) {
    fail("Hero", "count", `JSON has ${json.slides.length} slides, DB has ${db.length}`);
  }

  for (const slide of json.slides) {
    const dbSlide = db.find((s) => s.id === slide.id);
    if (!dbSlide) {
      fail("Hero", "missing", `Slide ${slide.id} not in DB`);
      continue;
    }
    const checks: [string, unknown, unknown][] = [
      ["image", slide.image, dbSlide.image],
      ["tag", slide.tag, dbSlide.tag],
      ["title", slide.title, dbSlide.title],
    ];
    for (const [field, jsonVal, dbVal] of checks) {
      if (jsonVal !== dbVal) {
        fail("Hero", "mismatch", `Slide ${slide.id}.${field}: JSON="${jsonVal}" DB="${dbVal}"`);
      }
    }
  }
}

async function verifyFAQs() {
  const json = readJson("faq.json") as { tagline: string; faqs: Record<string, unknown>[] };
  const db = await prisma.fAQ.findMany({ orderBy: { sortOrder: "asc" } });

  if (db.length !== json.faqs.length) {
    fail("FAQ", "count", `JSON has ${json.faqs.length} FAQs, DB has ${db.length}`);
  }

  const taglineRecord = await prisma.fAQTagline.findFirst();
  if (taglineRecord?.tagline !== json.tagline) {
    fail("FAQ", "mismatch", `Tagline: JSON="${json.tagline}" DB="${taglineRecord?.tagline}"`);
  }
}

async function verifyTestimonials() {
  const json = readJson("testimonials.json") as { testimonials: Record<string, unknown>[]; total: number };
  const db = await prisma.testimonial.findMany();

  if (db.length !== json.total) {
    fail("Testimonial", "count", `JSON has ${json.total}, DB has ${db.length}`);
  }

  for (const t of json.testimonials) {
    const dbRow = db.find((r) => r.id === t.id);
    if (!dbRow) {
      fail("Testimonial", "missing", `Testimonial ${t.id} not in DB`);
      continue;
    }
    if (t.reviewer !== dbRow.reviewer) {
      fail(
        "Testimonial",
        "mismatch",
        `${t.id}.reviewer: JSON="${t.reviewer}" DB="${dbRow.reviewer}"`,
      );
    }
    if (t.rating !== dbRow.rating) {
      fail("Testimonial", "mismatch", `${t.id}.rating: JSON=${t.rating} DB=${dbRow.rating}`);
    }
  }
}

async function verifyBlogs() {
  const json = readJson("blogs.json") as { blogs: Record<string, unknown>[]; total: number };
  const db = await prisma.blogPost.findMany();

  if (db.length !== json.total) {
    fail("Blog", "count", `JSON has ${json.total}, DB has ${db.length}`);
  }

  for (const b of json.blogs) {
    const dbRow = db.find((r) => r.id === b.id);
    if (!dbRow) {
      fail("Blog", "missing", `Blog "${b.id}" not in DB`);
      continue;
    }
    if (b.slug !== dbRow.slug) {
      fail("Blog", "mismatch", `${b.id}.slug: JSON="${b.slug}" DB="${dbRow.slug}"`);
    }
  }
}

async function verifyCompany() {
  const json = readJson("company.json") as Record<string, unknown>;
  const db = await prisma.company.findFirst();
  if (!db) {
    fail("Company", "missing", "Company record not in DB");
    return;
  }

  if (json.name !== db.name)
    fail("Company", "mismatch", `name: JSON="${json.name}" DB="${db.name}"`);
  if (json.email !== db.email)
    fail("Company", "mismatch", `email: JSON="${json.email}" DB="${db.email}"`);

  const jsonPhones = sorted((json.phone as string[]) || []);
  const dbPhones = sorted(normalizeArray(db.phones));
  if (JSON.stringify(jsonPhones) !== JSON.stringify(dbPhones)) {
    fail("Company", "mismatch", "phone arrays differ");
  }
}

async function verifyOrphanedRelations() {
  // Check packages with non-existent countries
  const packages = await prisma.package.findMany();
  const countryIds = new Set((await prisma.country.findMany()).map((c) => c.id));
  for (const pkg of packages) {
    if (!countryIds.has(pkg.countryId)) {
      fail(
        "Relation",
        "orphan",
        `Package "${pkg.id}" references non-existent country "${pkg.countryId}"`,
      );
    }
  }

  // Check destinations with non-existent countries
  const destinations = await prisma.destination.findMany();
  for (const dest of destinations) {
    if (!countryIds.has(dest.countryId)) {
      fail(
        "Relation",
        "orphan",
        `Destination "${dest.id}" references non-existent country "${dest.countryId}"`,
      );
    }
  }

  // Check variants with non-existent packages
  const variants = await prisma.packageVariant.findMany();
  const packageIds = new Set(packages.map((p) => p.id));
  for (const v of variants) {
    if (!packageIds.has(v.packageId)) {
      fail(
        "Relation",
        "orphan",
        `Variant "${v.id}" references non-existent package "${v.packageId}"`,
      );
    }
  }
}

// ─── Main ───────────────────────────────────────────────────────────────────────

async function main() {
  console.log("🔍 Verifying database against JSON sources...\n");

  await verifyCountries();
  await verifyStates();
  await verifyDestinations();
  await verifyCategories();
  await verifyPackages();
  await verifyHeroSlides();
  await verifyFAQs();
  await verifyTestimonials();
  await verifyBlogs();
  await verifyCompany();
  await verifyOrphanedRelations();

  console.log(`\n${"=".repeat(60)}`);

  if (failures.length === 0) {
    console.log("✅ ALL CHECKS PASSED — Database matches JSON sources exactly.");
  } else {
    console.log(`❌ ${failures.length} FAILURES FOUND:\n`);
    for (const f of failures) {
      console.log(`  [${f.entity}] ${f.type}: ${f.detail}`);
    }
  }

  console.log(`${"=".repeat(60)}\n`);
}

main()
  .then(async () => {
    await prisma.$disconnect();
    process.exit(failures.length > 0 ? 1 : 0);
  })
  .catch(async (e) => {
    console.error("Verification error:", e);
    await prisma.$disconnect();
    process.exit(1);
  });
