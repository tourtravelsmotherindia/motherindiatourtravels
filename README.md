# Mother India Tour Travels

A premium, data-driven tour package catalog and booking platform for a travel agency specializing in domestic and international trips from India.

**Live website:** [motherindiatourtravels.com](https://motherindiatourtravels.com)

---

## Tech Stack

The platform is built using the following modern tools and technologies:

[![Tech Stack](https://skillicons.dev/icons?i=nextjs,react,ts,tailwind,postgres,prisma,docker,cloudflare,github,git&perline=10)](https://skillicons.dev)

![Next.js](https://img.shields.io/badge/Next.js_16-000000?style=for-the-badge&logo=nextdotjs&logoColor=white)
![React 19](https://img.shields.io/badge/React_19-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![Tailwind CSS v4](https://img.shields.io/badge/Tailwind_CSS_v4-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
![Prisma v7](https://img.shields.io/badge/Prisma_v7-2D3748?style=for-the-badge&logo=prisma&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Cloudflare Workers](https://img.shields.io/badge/Cloudflare_Workers-F38020?style=for-the-badge&logo=cloudflare&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Framer Motion](https://img.shields.io/badge/Framer_Motion-0055FF?style=for-the-badge&logo=framer&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)

---

## System Architecture

The site runs on a modern, decoupled architecture:

1.  **Frontend**: Built with Next.js 16 (using App Router and Turbopack) compiled to a pure static export (`output: "export"`).
2.  **Database**: Hosted PostgreSQL on Supabase, managed and queried via Prisma ORM.
3.  **Cloudflare Workers**:
    - `api-worker`: Processes booking inquiry submissions, contact requests, and emails.
    - `images-worker`: Serves and caches tour media assets at the edge.

```mermaid
graph TD
    %% User Interactions
    User[Client Browser] -->|Fetches Static Pages| Host[Web Host: cPanel/Cloudflare/Netlify/Vercel/Docker]
    User -->|Loads Map Data| MapTiler[MapTiler API]

    %% Dynamic Data Flow
    User -->|Submit Bookings / Inquiries| CFWorker[Cloudflare API Worker]
    User -->|Requests Optimized Images| CFImageWorker[Cloudflare Images Worker]

    %% Backend Services
    CFWorker -->|Stores Leads| Supabase[Supabase PostgreSQL]
    CFWorker -->|Sends Confirmation Emails| SMTP[SMTP Mail Server]

    %% Next.js Build Time
    BuildTime[Next.js Build Process] -.->|Queries Tour Data| Supabase
    BuildTime -.->|Generates Static HTML/CSS| Host
```

---

## Getting Started

### Prerequisites

- Node.js ≥ 22.0.0
- npm ≥ 10.0.0

### Local Development Setup

1.  **Clone the repository**:

    ```bash
    git clone <repo-url>
    cd mother-india
    ```

2.  **Install dependencies**:

    ```bash
    npm install
    ```

3.  **Configure environment variables**:
    Copy the example template and fill in your Supabase connection strings and API keys:

    ```bash
    cp .env.example .env
    ```

4.  **Synchronize & Seed the Database**:
    Prisma compiles engines locally and populates your Supabase PostgreSQL instance:

    ```bash
    npx prisma generate
    npm run db:seed
    ```

5.  **Run the local Next.js dev server**:
    ```bash
    npm run dev
    ```
    Open [http://localhost:3000](http://localhost:3000) to view the application.

---

## Cloudflare Workers

The platform utilizes Cloudflare Workers to handle serverless operations efficiently:

- **`cloudflare/api-worker`**: Handles CORS, processes contact submissions, newsletter signups, and booking forms, and stores inquiries into PostgreSQL before sending transactional confirmation emails.
- **`cloudflare/images-worker`**: Serves as a custom edge image proxy, fetching raw assets from Cloudflare R2 and caching them at the edge.

### Worker Setup & Local Development

To run both workers locally in dev mode:

```bash
npm run workers
```

For deep configuration instructions, secrets setup, and deployment commands, refer to the [Cloudflare Worker Deployment Guide](./cloudflare/DEPLOYMENT.md).

---

## Database Schema

The database is built on PostgreSQL (hosted by Supabase) and is managed via Prisma ORM.

It utilizes an evergreen, modular design divided into:

1.  **Geography**: Countries, States, Destinations, Attractions, and Neighbours.
2.  **Packages**: Tour packages, night/day variants, categorizations, and detailed daily itineraries.
3.  **CMS**: Hero slide carousels, customizable site sections, FAQs, and Markdown blog posts.
4.  **Leads & Company**: Inquiries, contacts, reviews, newsletter subscribers, and business profiles.

- To explore the logical entity relations, view the [Database Schema Documentation](./prisma/SCHEMA.md).
- To check the schema definition directly, view [schema.prisma](./prisma/schema.prisma).

---

## Deployment & Multi-Hosting Support

This project is built using Next.js static HTML export (`output: "export"`), compiling the entire website into the `./out` directory. This allows it to run on virtually any web hosting provider.

Ready-made configuration files are provided for popular hosting environments:

- **cPanel Hosting**: Configured via GitHub Actions using FTP.
- **Cloudflare Pages**: Configured via [wrangler.jsonc](./wrangler.jsonc) (points assets to `./out`).
- **Netlify**: Configured via [netlify.toml](./netlify.toml) (specifies publish folder, redirect fallbacks, and security headers).
- **Vercel**: Configured via [vercel.json](./vercel.json) (enables trailing slash mapping and clean URL routing).
- **Firebase Hosting**: Configured via [firebase.json](./firebase.json) and [.firebaserc](./.firebaserc).
- **Self-Hosted / VPS Docker**: Configured via a multi-stage [Dockerfile](./Dockerfile) and [nginx.conf](./nginx.conf). It builds the static files and serves them via Nginx running as a secure, non-root user on port `8080`.

---

## CI/CD GitHub Actions Workflow

The repository includes an automated pipeline in [.github/workflows/deploy-cpanel.yml](./.github/workflows/deploy-cpanel.yml) that builds and deploys the static files to cPanel whenever code is pushed to the `deploy` branch.

### How the workflow works:

1.  **Checkout & Cache**: Pulls the code and restores the Next.js compilation cache to maximize build speeds.
2.  **Install dependencies**: Runs `npm ci` (a clean, locked, and fast installation).
3.  **Build**: Connects to Supabase, runs migrations, generates the Prisma client, and exports the static HTML to `/out`.
4.  **Sync FTP State**: Pulls and stores deployment state file `.ftp-deploy-sync-state.json` via GitHub Actions caching.
5.  **Deploy via FTP**: Uploads only modified or new files to the cPanel target directory using `SamKirkland/FTP-Deploy-Action` (while preserving remote system files like `.htaccess`).

### Secrets Required in GitHub Actions:

| Secret Name                | Description                                                                  |
| :------------------------- | :--------------------------------------------------------------------------- |
| `DATABASE_URL`             | Transaction pooled PostgreSQL database connection string                     |
| `DIRECT_URL`               | Direct database connection string (used for schema migrations)               |
| `NEXT_PUBLIC_MAPTILER_KEY` | MapTiler API Key for vector routing maps                                     |
| `FTP_HOST`                 | Host address of the cPanel FTP server                                        |
| `FTP_USERNAME`             | cPanel FTP user account                                                      |
| `FTP_PASSWORD`             | cPanel FTP account password                                                  |
| `FTP_SERVER_DIR`           | Target server directory (e.g., `/public_html` or `/public_html/motherindia`) |

---

## Admin Manual

For step-by-step instructions on managing the website (adding tour packages, blog posts, managing hero slides, FAQs, company details, and knowing when to deploy), refer to the **[Admin & Data Management Manual](./MANAGE.md)**.

---

## Environment Variables Reference

Create a `.env` file at the project root for local development.

```env
# Database connection pooler (used by the application)
DATABASE_URL="postgresql://postgres.xxxx:password@aws-1-ap-south-1.pooler.supabase.com:5432/postgres?pgbouncer=true"

# Direct database connection (used for migrations and seeding)
DIRECT_URL="postgresql://postgres.xxxx:password@aws-1-ap-south-1.pooler.supabase.com:5432/postgres"

# MapTiler API key
NEXT_PUBLIC_MAPTILER_KEY="your_maptiler_key_here"

# Cloudflare API Worker URL
NEXT_PUBLIC_API_URL="https://your-api-worker.workers.dev"

# Cloudflare Images Worker URL
NEXT_PUBLIC_IMAGES_URL="https://your-images-worker.workers.dev"
```

---

## Scripts Reference

All scripts are defined in `package.json` and executed using `npm run <script-name>`:

| Script Name    | Exact Command                                                                                                                                                                         | Action / Description                                                                 |
| :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------- |
| `dev`          | `next dev`                                                                                                                                                                            | Starts the Next.js development server with Turbopack                                 |
| `workers`      | `concurrently "npm --prefix cloudflare/api-worker run dev -- --port 8787 --inspector-port 9229" "npm --prefix cloudflare/images-worker run dev -- --port 7878 --inspector-port 9230"` | Runs both Cloudflare Workers (API and Images) concurrently in local development mode |
| `build`        | `npx prisma generate && npx prisma migrate deploy && next build`                                                                                                                      | Generates the Prisma client, deploys migrations, and builds Next.js production code  |
| `build:static` | `npx prisma generate && npx prisma migrate deploy && next build`                                                                                                                      | Build step designed for the static site compilation in the CI/CD pipeline            |
| `start`        | `next start`                                                                                                                                                                          | Runs the production-built Next.js server                                             |
| `lint`         | `eslint .`                                                                                                                                                                            | Runs ESLint static code analysis checks                                              |
| `lint:fix`     | `eslint . --fix`                                                                                                                                                                      | Runs ESLint and automatically fixes fixable style and syntax issues                  |
| `format`       | `prettier --write .`                                                                                                                                                                  | Formats all workspace files via Prettier                                             |
| `format:check` | `prettier --check .`                                                                                                                                                                  | Checks code formatting rules without modifying files                                 |
| `db:reset`     | `npx prisma migrate reset`                                                                                                                                                            | Wipes PostgreSQL tables, re-runs database migrations, and prepares a fresh state     |
| `db:seed`      | `npx prisma db seed`                                                                                                                                                                  | Seeds PostgreSQL tables with tour data from `data/json/` source files                |
