/**
 * Prisma seed script — SQL-based (PostgreSQL / Supabase).
 *
 * Reads `prisma/seed.sql` and executes it as a single raw SQL block
 * inside a transaction. The SQL uses `ON CONFLICT ... DO UPDATE` (upsert),
 * so the seed is idempotent — safe to re-run.
 *
 * The SQL uses DO $$ ... $$ PL/pgSQL blocks for FK-aware inserts.
 *
 * Usage:
 *   npx prisma db seed          (reads prisma.seed from package.json)
 *   npx tsx prisma/seed.ts      (direct)
 */

import { PrismaPg } from "@prisma/adapter-pg";
import { config } from "dotenv";
import fs from "fs";
import path from "path";

import { PrismaClient } from "../src/generated/prisma/client";

// Load .env so DATABASE_URL is available outside of Next.js
config({ path: path.resolve(__dirname, "../.env") });

const adapter = new PrismaPg({
  connectionString: process.env.DATABASE_URL!,
});

const prisma = new PrismaClient({ adapter });

const SEED_SQL = path.resolve(__dirname, "seed.sql");

async function main() {
  console.log("🌱 Starting seed (PostgreSQL / Supabase via SQL)...\n");

  if (!fs.existsSync(SEED_SQL)) {
    console.error(`❌ Seed SQL file not found: ${SEED_SQL}`);
    process.exit(1);
  }

  const sql = fs.readFileSync(SEED_SQL, "utf-8");

  console.log(`   Read ${sql.length} bytes from seed.sql\n`);

  try {
    // Execute the entire seed as one raw SQL execution
    // PostgreSQL handles the full block natively including DO $$ ... $$ blocks
    await prisma.$executeRawUnsafe(sql);
    console.log("✅ Seed complete! All statements executed successfully.");
  } catch (err) {
    console.error("\n❌ Seed failed:");
    console.error((err as Error).message);
    throw err;
  }
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
