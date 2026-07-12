# Cloudflare Workers & R2 Storage — Deployment Guide

Mother India Tour Travels backend infrastructure.  
Two workers, two subdomains, one private R2 bucket, zero Cloudinary dependencies.

---

## Prerequisites

- Cloudflare account with `motherindiatourtravels.com` domain added
- Cloudflare R2 storage enabled (free tier: 10GB/month)
- Supabase project (already set up)
- SMTP credentials for `mail.motherindiatourtravels.com`

---

## Step 1 — Install Wrangler

Each worker has its own `wrangler` installed locally.

```bash
# api-worker
cd cloudflare/api-worker
npm install

# images-worker
cd ../images-worker
npm install
```

Login to Cloudflare:

```bash
cd cloudflare/api-worker
npx wrangler login
```

---

## Step 2 — Cloudflare R2 Bucket Setup

1. Go to **Cloudflare Dashboard** → **R2** → **Overview**.
2. Click **Create bucket**.
3. Name the bucket: `motherindiatourtravels-assets`.
4. Click **Create bucket** to confirm.
5. Keep public access **Private** (disabled). The `images-worker` acts as the secure caching proxy, keeping your actual bucket URL hidden from the browser.

### CORS Configuration (Optional)

Since our admin panel uploads files by sending them to our worker API (`api.motherindiatourtravels.com/upload`) rather than R2 directly from the browser, R2 CORS is not strictly required. However, if you want to configure CORS:

1. Go to your bucket page → **Settings** tab.
2. Scroll to **CORS Policy** and click **Add CORS policy**.
3. Input this JSON policy:

```json
[
  {
    "AllowedOrigins": ["https://motherindiatourtravels.com", "http://localhost:3000"],
    "AllowedMethods": ["GET", "PUT", "POST", "HEAD"],
    "AllowedHeaders": ["Content-Type", "Authorization"],
    "MaxAgeSeconds": 3600
  }
]
```

4. Save the policy.

---

## Step 3 — Supabase Setup

### 3a. Get your credentials

In your Supabase project:

- **Project URL**: Settings → API Keys → Project URL
- **Secret Key**: Settings → API Keys → Secret Key (`sb_secret_...` format key — bypasses RLS)

> ⚠️ Never expose the secret key in client-side code. It lives only in Worker secrets.

### 3b. Create the admin user

In Supabase dashboard → **Authentication** → **Users** → **Add user**:

```
Email:    admin@motherindiatourtravels.com
Password: [strong password]
```

### 3c. Run RLS policies

In **Supabase SQL Editor**, run these policies:

```sql
-- Allow public reads on content tables
ALTER TABLE "Package" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_packages" ON "Package" FOR SELECT USING (true);

ALTER TABLE "GalleryImage" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_gallery" ON "GalleryImage" FOR SELECT USING (true);

ALTER TABLE "Destination" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_destinations" ON "Destination" FOR SELECT USING (true);

ALTER TABLE "FAQ" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_faqs" ON "FAQ" FOR SELECT USING (true);

ALTER TABLE "BlogPost" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_blogs" ON "BlogPost" FOR SELECT USING (true);

ALTER TABLE "Testimonial" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_testimonials" ON "Testimonial" FOR SELECT USING (true);

ALTER TABLE "SiteSection" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_sections" ON "SiteSection" FOR SELECT USING (true);

ALTER TABLE "Company" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_company" ON "Company" FOR SELECT USING (true);

ALTER TABLE "HeroConfig" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_hero" ON "HeroConfig" FOR SELECT USING (true);

ALTER TABLE "HeroSlide" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_slides" ON "HeroSlide" FOR SELECT USING (true);
```

---

## Step 4 — Configure Worker Secrets (api-worker)

From inside `cloudflare/api-worker/`, run each command and enter the value when prompted:

```bash
# Supabase
npx wrangler secret put SUPABASE_URL
npx wrangler secret put SUPABASE_SECRET_KEY

# SMTP — Booking emails (bookings, contact form notifications)
npx wrangler secret put BOOKING_SMTP_USER
npx wrangler secret put BOOKING_SMTP_PASS

# SMTP — Notification emails (newsletters, general)
npx wrangler secret put NOTIFY_SMTP_USER
npx wrangler secret put NOTIFY_SMTP_PASS

# SMTP Server
npx wrangler secret put SMTP_HOST
npx wrangler secret put SMTP_PORT
```

_Note: No Cloudinary secrets are needed anymore since uploads go directly to the bound R2 bucket._

---

## Step 5 — Deploy Both Workers

```bash
# api-worker
cd cloudflare/api-worker
npx wrangler deploy

# images-worker
cd ../images-worker
npx wrangler deploy
```

After deploying, Wrangler will outputs workers.dev subdomains:

- `motherindiatourtravels-api.YOUR-SUBDOMAIN.workers.dev`
- `motherindiatourtravels-images.YOUR-SUBDOMAIN.workers.dev`

---

## Step 6 — DNS Setup in Cloudflare Dashboard

Go to Cloudflare Dashboard → `motherindiatourtravels.com` → **DNS** → **Records**.

Add two CNAME records:

| Type  | Name   | Target                                                     | Proxy      |
| ----- | ------ | ---------------------------------------------------------- | ---------- |
| CNAME | api    | `motherindiatourtravels-api.YOUR-SUBDOMAIN.workers.dev`    | ✅ Proxied |
| CNAME | images | `motherindiatourtravels-images.YOUR-SUBDOMAIN.workers.dev` | ✅ Proxied |

---

## Step 7 — Worker Routes (Custom Domains)

In Cloudflare Dashboard → **Workers & Pages** → click your worker → **Settings** → **Domains & Routes**:

For **motherindiatourtravels-api**: Add custom domain `api.motherindiatourtravels.com`  
For **motherindiatourtravels-images**: Add custom domain `images.motherindiatourtravels.com`

---

## Step 8 — Update Next.js Environment

Add to your production `.env` file:

```
NEXT_PUBLIC_API_URL=https://api.motherindiatourtravels.com
NEXT_PUBLIC_IMAGES_URL=https://images.motherindiatourtravels.com
```

---

## Step 9 — Verify Everything Works

```bash
# Public endpoints
curl https://api.motherindiatourtravels.com/faqs
curl https://api.motherindiatourtravels.com/gallery

# Newsletter form
curl -X POST https://api.motherindiatourtravels.com/newsletter \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com"}'

# Admin login
curl -X POST https://api.motherindiatourtravels.com/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@motherindiatourtravels.com","password":"YOUR_PASSWORD"}'

# Protected image upload (admin)
TOKEN="your_access_token"
curl -X POST https://api.motherindiatourtravels.com/upload \
  -H "Authorization: Bearer $TOKEN" \
  -F "file=@/path/to/photo.jpg" \
  -F "folder=mother-india/gallery"
# Returns: {"public_id":"mother-india/gallery/172081..._photo.jpg","url":"https://images.motherindiatourtravels.com/mother-india/gallery/172081..._photo.jpg"}

# Image serving check
curl -I "https://images.motherindiatourtravels.com/mother-india/gallery/172081..._photo.jpg"
# Should return HTTP 200 with: Cache-Control: public, max-age=2592000
```

---

## Admin Image Upload Flow

1. Admin submits a file through the admin dashboard via `POST api.motherindiatourtravels.com/upload` using a Supabase JWT.
2. The worker checks credentials, sanitizes the filename, generates a unique prefix, and streams it to the bound `BUCKET` (R2).
3. The response returns the public URL: `https://images.motherindiatourtravels.com/mother-india/gallery/unique_id_filename.jpg`.
4. The admin panel saves this URL directly into the package or gallery image table row.

---

## Local Development

Wrangler uses local simulated R2 buckets for development.

```bash
# Start local API worker
cd cloudflare/api-worker && npx wrangler dev   # → localhost:8787

# Start local images worker
cd cloudflare/images-worker && npx wrangler dev # → localhost:8788
```

In `.env.local`:

```
NEXT_PUBLIC_API_URL=http://localhost:8787
NEXT_PUBLIC_IMAGES_URL=http://localhost:8788
```

---

## Secrets & Config Summary

| Variable              | Location                   | Description                                  |
| --------------------- | -------------------------- | -------------------------------------------- |
| `SUPABASE_URL`        | api-worker                 | Supabase REST URL                            |
| `SUPABASE_SECRET_KEY` | api-worker                 | Supabase secret key (`sb_secret_...` format) |
| `BUCKET`              | api-worker & images-worker | R2 Bucket wrangler binding                   |
| `BOOKING_SMTP_USER`   | api-worker                 | Mail account for booking emails              |
| `BOOKING_SMTP_PASS`   | api-worker                 | Password for booking email account           |
| `NOTIFY_SMTP_USER`    | api-worker                 | Mail account for notifications               |
| `NOTIFY_SMTP_PASS`    | api-worker                 | Password for notification account            |
| `SMTP_HOST`           | api-worker                 | `mail.motherindiatourtravels.com`            |
| `SMTP_PORT`           | api-worker                 | `465` (secure port)                          |
