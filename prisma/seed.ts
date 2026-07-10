/**
 * Prisma seed script — SQL-based (PostgreSQL).
 *
 * Reads `prisma/seed.sql` and executes each statement inside a transaction.
 * The SQL uses `INSERT ... ON CONFLICT ("id") DO UPDATE` (upsert), so the
 * seed is idempotent — safe to re-run, and dashboard-managed fields not
 * present in the INSERT are left untouched on existing rows.
 *
 * Usage:
 *   npx prisma db seed          (reads prisma.seed from package.json)
 *   npx tsx prisma/seed.ts      (direct)
 */

import { config } from "dotenv";
import { PrismaPg } from "@prisma/adapter-pg";
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

/**
 * Split SQL text into individual INSERT statements.
 *
 * Splits on `;\n` (semicolon + newline) and keeps only segments that
 * contain `INSERT INTO`. Comments and blank lines are naturally discarded
 * because they don't contain INSERT INTO.
 */
function splitSQLStatements(sql: string): string[] {
  const raw = sql.split(/;\s*\n/);
  return raw
    .map((s) => s.trim())
    .filter((s) => s.includes("INSERT INTO"))
    .map((s) => {
      // Strip leading comment lines (e.g. "-- Table: Country")
      // so each statement starts cleanly with INSERT INTO
      const lines = s.split("\n");
      while (lines.length > 0 && lines[0].trimStart().startsWith("--")) {
        lines.shift();
      }
      return lines.join("\n").trim();
    })
    .filter((s) => s.length > 0);
}

async function main() {
  console.log("🌱 Starting seed (PostgreSQL / Supabase via SQL)...\n");

  if (!fs.existsSync(SEED_SQL)) {
    console.error(`❌ Seed SQL file not found: ${SEED_SQL}`);
    console.error(
      "   Run: npx tsx prisma/transform-seed.ts  (converts seed-from-git-history.sql)"
    );
    process.exit(1);
  }

  const sql = fs.readFileSync(SEED_SQL, "utf-8");
  const statements = splitSQLStatements(sql);

  console.log(`   Found ${statements.length} SQL statements in seed.sql\n`);

  // Execute all statements in a single transaction for atomicity
  let executed = 0;
  let failed = 0;

  try {
    await prisma.$executeRawUnsafe("BEGIN");
    console.log("   ▶ BEGIN transaction");

    for (const stmt of statements) {
      try {
        await prisma.$executeRawUnsafe(stmt);
        executed++;
      } catch (err) {
        failed++;
        const preview =
          stmt.length > 120
            ? stmt.substring(0, 120) + "..."
            : stmt;
        console.error(`   ✗ Failed [${preview}]:`, (err as Error).message);

        // Abort transaction on first failure
        throw err;
      }
    }

    await prisma.$executeRawUnsafe("COMMIT");
    console.log(`   ▶ COMMIT transaction`);
  } catch (err) {
    console.error("\n❌ Seed failed, rolling back...");
    try {
      await prisma.$executeRawUnsafe("ROLLBACK");
    } catch {
      // Ignore rollback errors
    }
    console.error(`   Failed after ${executed} successful statements`);
    console.error((err as Error).message);
    throw err;
  }

  // ── Post-seed: sync auto-increment sequences ──
  // FAQ uses @default(autoincrement()) — reset the sequence so new rows
  // inserted via the dashboard don't collide with seeded IDs.
  try {
    await prisma.$executeRawUnsafe(
      `SELECT setval(pg_get_serial_sequence('"FAQ"', 'id'), COALESCE((SELECT MAX(id) FROM "FAQ"), 1))`
    );
    console.log("   ✓ Synced FAQ autoincrement sequence");
  } catch (err) {
    console.warn("   ⚠ Could not sync FAQ sequence:", (err as Error).message);
  }

  console.log(`\n✅ Seed complete! ${executed} statements executed, ${failed} failed.`);
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
