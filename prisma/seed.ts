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

    // Seed admin user using credentials from environment variables
    const adminEmail = process.env.ADMIN_EMAIL;
    const adminPassword = process.env.ADMIN_PASSWORD;

    if (adminEmail && adminPassword) {
      console.log(`Seeding admin user (${adminEmail})...`);
      const seedAdminSql = `
        DO $$
        DECLARE
          new_user_id UUID := gen_random_uuid();
          admin_email TEXT := '${adminEmail.replace(/'/g, "''")}';
          admin_password TEXT := '${adminPassword.replace(/'/g, "''")}';
        BEGIN
          -- 1. Insert into auth.users if not exists
          IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = admin_email) THEN
            INSERT INTO auth.users (
              instance_id,
              id,
              email,
              encrypted_password,
              email_confirmed_at,
              raw_app_meta_data,
              raw_user_meta_data,
              is_super_admin,
              created_at,
              updated_at,
              last_sign_in_at,
              role,
              aud
            )
            VALUES (
              '00000000-0000-0000-0000-000000000000',
              new_user_id,
              admin_email,
              crypt(admin_password, gen_salt('bf')),
              now(),
              '{"provider": "email", "providers": ["email"]}'::jsonb,
              '{}'::jsonb,
              false,
              now(),
              now(),
              now(),
              'authenticated',
              'authenticated'
            );

            -- 2. Insert into auth.identities
            INSERT INTO auth.identities (
              id,
              user_id,
              identity_data,
              provider,
              last_sign_in_at,
              created_at,
              updated_at,
              provider_id
            )
            VALUES (
              new_user_id,
              new_user_id,
              json_build_object('sub', new_user_id::text, 'email', admin_email)::jsonb,
              'email',
              now(),
              now(),
              now(),
              new_user_id::text
            );
          ELSE
            -- Retrieve existing user ID to sync with public User table
            SELECT id INTO new_user_id FROM auth.users WHERE email = admin_email;
          END IF;

          -- 3. Insert/update the public User table
          INSERT INTO public."User" (id, email, role, "createdAt", "updatedAt")
          VALUES (
            new_user_id,
            admin_email,
            'ADMIN',
            now(),
            now()
          )
          ON CONFLICT (email) DO UPDATE
          SET role = 'ADMIN';
        END $$;
      `;

      await prisma.$executeRawUnsafe(seedAdminSql);
      console.log("✅ Admin user seeded and public profile updated successfully.");
    } else {
      console.log("⚠️ ADMIN_EMAIL or ADMIN_PASSWORD not set in .env. Skipping admin seeding.");
    }
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
