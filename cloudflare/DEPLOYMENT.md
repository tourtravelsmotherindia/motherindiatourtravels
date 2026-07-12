# Cloudflare Workers — Deployment Guide

Mother India Tour Travels backend infrastructure.  
Two workers, two subdomains, zero Cloudinary URLs in the browser.

---

## Prerequisites

- Cloudflare account with `motherindiatourtravels.com` domain added
- Cloudinary account (free tier is fine to start)
- Supabase project (already set up)
- SMTP credentials for `mail.motherindiatourtravels.com`

---

## Step 1 — Install Wrangler (project-scoped, no global)

Each worker has its own `wrangler` installed locally.

```bash
# api-worker
cd cloudflare/api-worker
npm install

# images-worker
cd ../images-worker
npm install
```

Login to Cloudflare (this is OAuth, happens once per machine):

```bash
cd cloudflare/api-worker
npx wrangler login
```

---

## Step 2 — Cloudinary Setup

1. Go to [cloudinary.com](https://cloudinary.com) → Sign up / Log in
2. Go to **Settings → Access Keys**
3. Note down:
   - `Cloud Name` (e.g. `my-cloud`)
   - `API Key`
   - `API Secret`

No special configuration needed — uploads are signed by the Worker.

---

## Step 3 — Supabase Setup

### 3a. Get your credentials

In your Supabase project:

- **Project URL**: Settings → API → Project URL
- **Service Role Key**: Settings → API → `service_role` (secret key — bypasses RLS)

> ⚠️ Never expose the service role key in client-side code. It lives only in Worker secrets.

### 3b. Create the admin user

In Supabase dashboard → **Authentication → Users → Add user**:

```
Email:    admin@motherindiatourtravels.com  (or any email you choose)
Password: [strong password]
```

This is the only account that can authenticate to the admin API.

### 3c. Run RLS policies

In **Supabase SQL Editor**, run these policies (copy + paste + run):

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

-- Admin write access (service_role bypasses RLS automatically)
-- No additional policies needed for write — Worker uses service_role key
```

---

## Step 4 — Configure Worker Secrets (api-worker)

From inside `cloudflare/api-worker/`, run each command and enter the value when prompted:

```bash
# Supabase
npx wrangler secret put SUPABASE_URL
npx wrangler secret put SUPABASE_SERVICE_KEY

# Cloudinary
npx wrangler secret put CLOUDINARY_CLOUD
npx wrangler secret put CLOUDINARY_KEY
npx wrangler secret put CLOUDINARY_SECRET

# SMTP — Booking emails (bookings, contact form notifications)
npx wrangler secret put BOOKING_SMTP_USER
# → e.g. booking@motherindiatourtravels.com
npx wrangler secret put BOOKING_SMTP_PASS

# SMTP — Notification emails (newsletters, general)
npx wrangler secret put NOTIFY_SMTP_USER
# → e.g. notifications@motherindiatourtravels.com
npx wrangler secret put NOTIFY_SMTP_PASS

# SMTP Server
npx wrangler secret put SMTP_HOST
# → mail.motherindiatourtravels.com
npx wrangler secret put SMTP_PORT
# → 465
```

---

## Step 5 — Configure Worker Secrets (images-worker)

From inside `cloudflare/images-worker/`:

```bash
npx wrangler secret put CLOUDINARY_CLOUD
# → same cloud name as above
```

---

## Step 6 — Deploy Both Workers

```bash
# api-worker
cd cloudflare/api-worker
npx wrangler deploy

# images-worker
cd ../images-worker
npx wrangler deploy
```

After deploy, Cloudflare gives you workers.dev URLs:

- `mother-india-api.YOUR-SUBDOMAIN.workers.dev`
- `mother-india-images.YOUR-SUBDOMAIN.workers.dev`

Test before DNS:

```bash
curl https://mother-india-api.YOUR-SUBDOMAIN.workers.dev/faqs
```

---

## Step 7 — DNS Setup in Cloudflare Dashboard

Go to Cloudflare Dashboard → `motherindiatourtravels.com` → **DNS → Records**.

Add two CNAME records:

| Type  | Name   | Target                                           | Proxy      |
| ----- | ------ | ------------------------------------------------ | ---------- |
| CNAME | api    | `mother-india-api.YOUR-SUBDOMAIN.workers.dev`    | ✅ Proxied |
| CNAME | images | `mother-india-images.YOUR-SUBDOMAIN.workers.dev` | ✅ Proxied |

---

## Step 8 — Worker Routes (Custom Domains)

In Cloudflare Dashboard → **Workers & Pages → your worker → Settings → Domains & Routes**:

For **mother-india-api**: Add route `api.motherindiatourtravels.com/*`  
For **mother-india-images**: Add route `images.motherindiatourtravels.com/*`

(Or use the **Custom Domains** tab — just enter the subdomain directly.)

---

## Step 9 — Update Next.js Environment

Add to your production `.env`:

```
NEXT_PUBLIC_API_URL=https://api.motherindiatourtravels.com
NEXT_PUBLIC_IMAGES_URL=https://images.motherindiatourtravels.com
```

---

## Step 10 — Verify Everything Works

```bash
# Public endpoints
curl https://api.motherindiatourtravels.com/faqs
curl https://api.motherindiatourtravels.com/gallery
curl https://api.motherindiatourtravels.com/company

# Newsletter form
curl -X POST https://api.motherindiatourtravels.com/newsletter \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com"}'

# Image serving + cache header check
curl -I "https://images.motherindiatourtravels.com/f_auto,q_auto,w_800/mother-india/hero.jpg"
# Should see: Cache-Control: public, max-age=2592000

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
# Returns: {"public_id":"...","url":"https://images.motherindiatourtravels.com/..."}
```

---

## Admin Image Upload Flow

1. Admin sends `POST /upload` with JWT + file
2. Worker signs request → POSTs to Cloudinary (URL never exposed to browser)
3. Response: `{ public_id, url: "https://images.motherindiatourtravels.com/..." }`
4. Admin saves the `url` to DB (e.g. package `heroImage`, `GalleryImage.image`)

**Display in Next.js:**

```tsx
import { buildImageUrl } from "@/lib/api";

const url = buildImageUrl("mother-india/gallery/kerala", "f_auto,q_auto,w_800");
// → https://images.motherindiatourtravels.com/f_auto,q_auto,w_800/mother-india/gallery/kerala
```

---

## Cloudinary Transform Reference

| Transform            | Effect                  |
| -------------------- | ----------------------- |
| `f_auto`             | Auto format (WebP/AVIF) |
| `q_auto`             | Auto quality            |
| `w_800`              | 800px wide              |
| `w_400,h_300,c_fill` | Crop + fill             |
| `w_1200,q_auto:eco`  | 1200px, eco quality     |

---

## Local Development

```bash
cd cloudflare/api-worker && npx wrangler dev   # → localhost:8787
cd cloudflare/images-worker && npx wrangler dev # → localhost:8788
```

In `.env.local`:

```
NEXT_PUBLIC_API_URL=http://localhost:8787
NEXT_PUBLIC_IMAGES_URL=http://localhost:8788
```

---

## Full API Reference

### Public (no auth required)

| Method | Path                  | Description            |
| ------ | --------------------- | ---------------------- |
| POST   | `/booking`            | Submit booking inquiry |
| POST   | `/contact`            | Contact/popup form     |
| POST   | `/newsletter`         | Subscribe email        |
| GET    | `/tours`              | List packages          |
| GET    | `/tours/:id`          | Get package            |
| GET    | `/gallery`            | List gallery images    |
| GET    | `/destinations`       | List destinations      |
| GET    | `/faqs`               | List FAQs              |
| GET    | `/blogs`              | List blog posts        |
| GET    | `/testimonials`       | List testimonials      |
| GET    | `/site-sections/:key` | Get section by key     |
| GET    | `/hero`               | Hero config + slides   |
| GET    | `/company`            | Company info           |

### Admin (Bearer token required)

| Method            | Path                         | Description              |
| ----------------- | ---------------------------- | ------------------------ |
| POST              | `/auth/login`                | Admin login → JWT        |
| POST              | `/upload`                    | Upload to Cloudinary     |
| POST/PATCH/DELETE | `/tours`                     | CRUD packages            |
| POST/PATCH/DELETE | `/gallery`                   | CRUD gallery             |
| POST/PATCH/DELETE | `/destinations`              | CRUD destinations        |
| POST/PATCH/DELETE | `/faqs`                      | CRUD FAQs                |
| POST/PATCH/DELETE | `/blogs`                     | CRUD blogs               |
| POST/PATCH/DELETE | `/testimonials`              | CRUD testimonials        |
| PATCH             | `/site-sections/:key`        | Update section           |
| PATCH             | `/hero`                      | Update hero config       |
| PATCH             | `/company`                   | Update company info      |
| GET               | `/admin/bookings`            | List booking inquiries   |
| PATCH             | `/admin/bookings/:id/status` | Update booking status    |
| GET               | `/admin/contacts`            | List contact submissions |
| PATCH             | `/admin/contacts/:id/status` | Update contact status    |

---

## Secrets Summary

| Variable               | Worker       | Description                       |
| ---------------------- | ------------ | --------------------------------- |
| `SUPABASE_URL`         | api          | Project URL                       |
| `SUPABASE_SERVICE_KEY` | api          | service_role key                  |
| `CLOUDINARY_CLOUD`     | api + images | Cloud name                        |
| `CLOUDINARY_KEY`       | api          | API key                           |
| `CLOUDINARY_SECRET`    | api          | API secret                        |
| `BOOKING_SMTP_USER`    | api          | Email for booking/contact mails   |
| `BOOKING_SMTP_PASS`    | api          | Password for booking mailbox      |
| `NOTIFY_SMTP_USER`     | api          | Email for general notifications   |
| `NOTIFY_SMTP_PASS`     | api          | Password for notification mailbox |
| `SMTP_HOST`            | api          | `mail.motherindiatourtravels.com` |
| `SMTP_PORT`            | api          | `465`                             |
