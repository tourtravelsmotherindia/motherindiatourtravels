import "dotenv/config";

import crypto from "crypto";
import fs from "fs";
import path from "path";
import pg from "pg";

async function main() {
  const connectionString = process.env.DIRECT_URL || process.env.DATABASE_URL;
  if (!connectionString) {
    console.error("❌ Error: Neither DIRECT_URL nor DATABASE_URL is set in environment!");
    process.exit(1);
  }

  console.log("Fallback Database Reset & Seed Script Started...");
  console.log("Connecting to PostgreSQL direct pooler socket...");

  const client = new pg.Client({ connectionString });
  try {
    await client.connect();
    console.log("Database connection established.");

    // Step 1: Wipe and recreate public schema cleanly
    console.log("Resetting public schema...");
    await client.query("DROP SCHEMA IF EXISTS public CASCADE;");
    await client.query("CREATE SCHEMA public;");
    await client.query("GRANT ALL ON SCHEMA public TO postgres;");
    await client.query("GRANT ALL ON SCHEMA public TO public;");
    console.log("Public schema reset complete.");

    // Step 2: Apply all migrations from prisma/migrations/ in order
    const migrationsDir = path.join(process.cwd(), "prisma/migrations");
    if (fs.existsSync(migrationsDir)) {
      console.log("Applying Prisma migrations from prisma/migrations/ ...");
      const migrationFolders = fs
        .readdirSync(migrationsDir)
        .filter((file) => {
          const fullPath = path.join(migrationsDir, file);
          return fs.statSync(fullPath).isDirectory();
        })
        .sort();

      for (const folder of migrationFolders) {
        const sqlPath = path.join(migrationsDir, folder, "migration.sql");
        if (fs.existsSync(sqlPath)) {
          console.log(`  └─ Executing migration: ${folder}...`);
          const sqlContent = fs.readFileSync(sqlPath, "utf8");

          await client.query("BEGIN");
          await client.query(sqlContent);

          // Compute checksum and record migration in _prisma_migrations
          const checksum = crypto.createHash("sha256").update(sqlContent).digest("hex");
          const migrationId = crypto.randomUUID();

          // Ensure _prisma_migrations table exists (created by migration or baseline)
          await client.query(`
            CREATE TABLE IF NOT EXISTS "_prisma_migrations" (
              id VARCHAR(36) PRIMARY KEY NOT NULL,
              checksum VARCHAR(64) NOT NULL,
              finished_at TIMESTAMPTZ,
              migration_name VARCHAR(255) NOT NULL UNIQUE,
              logs TEXT,
              rolled_back_at TIMESTAMPTZ,
              started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
              applied_steps_count INT NOT NULL DEFAULT 0
            );
          `);

          await client.query(
            `
            INSERT INTO "_prisma_migrations" (
              id, checksum, finished_at, migration_name, started_at, applied_steps_count
            )
            VALUES ($1, $2, NOW(), $3, NOW(), 1)
            ON CONFLICT (migration_name) DO NOTHING;
            `,
            [migrationId, checksum, folder],
          );

          await client.query("COMMIT");
        }
      }
      console.log("All migrations applied and recorded.");
    }

    // Step 3: Seed database using prisma/seed.sql
    const seedSqlPath = path.join(process.cwd(), "prisma/seed.sql");
    if (fs.existsSync(seedSqlPath)) {
      console.log("Executing seed data from prisma/seed.sql ...");
      const seedSql = fs.readFileSync(seedSqlPath, "utf8");

      // Execute seed statements
      await client.query(seedSql);
      console.log("Database seeded successfully.");
    } else {
      console.warn("Warning: prisma/seed.sql file not found.");
    }

    console.log("Database reset & seed completed cleanly!");
  } catch (err) {
    console.error("Error during database reset and seed:", err);
    try {
      await client.query("ROLLBACK");
    } catch {
      // Ignore rollback errors if transaction was not active
    }
    process.exit(1);
  } finally {
    await client.end();
  }
}

main();
