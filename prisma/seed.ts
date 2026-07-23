/**
 * Prisma seed script — SQL-based (PostgreSQL / Supabase).
 *
 * Uses the raw `pg` client to execute seed.sql, which supports
 * multi-statement SQL and DO $$ ... $$ PL/pgSQL blocks natively.
 * The SQL uses `ON CONFLICT ... DO UPDATE` (upsert), so the seed
 * is idempotent — safe to re-run.
 *
 * Usage:
 *   npx prisma db seed          (reads prisma.seed from package.json)
 *   npx tsx prisma/seed.ts      (direct)
 */

import { config } from "dotenv";
import fs from "fs";
import path from "path";
import { Client } from "pg";

// Load .env so DATABASE_URL is available outside of Next.js
config({ path: path.resolve(__dirname, "../.env") });

const SEED_SQL = path.resolve(__dirname, "seed.sql");

async function main() {
  console.log("[Seed] Starting seed (PostgreSQL / Supabase via SQL)...\n");

  if (!fs.existsSync(SEED_SQL)) {
    console.error(`[Seed] Seed SQL file not found: ${SEED_SQL}`);
    process.exit(1);
  }

  const sql = fs.readFileSync(SEED_SQL, "utf-8");
  console.log(`[Seed] Read ${sql.length} bytes from seed.sql\n`);

  const client = new Client({ connectionString: process.env.DATABASE_URL });
  await client.connect();

  try {
    // pg's query() supports the full SQL script including DO $$ blocks
    await client.query(sql);
    console.log("[Seed] Seed complete! All statements executed successfully.");
  } catch (err) {
    console.error("\n[Seed] Seed failed:");
    console.error((err as Error).message);
    throw err;
  } finally {
    await client.end();
  }
}

main().catch((e) => {
  console.error("[Seed] Seed failed:", e);
  process.exit(1);
});
