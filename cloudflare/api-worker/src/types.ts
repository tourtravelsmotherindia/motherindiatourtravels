export interface Env {
  // Public vars (wrangler.jsonc [vars])
  ALLOWED_ORIGIN: string;
  ENVIRONMENT: string;

  // Bindings
  BUCKET: R2Bucket;

  // Secrets
  SUPABASE_URL: string;
  SUPABASE_SECRET_KEY: string;
  BOOKING_SMTP_USER: string;
  BOOKING_SMTP_PASS: string;
  NOTIFY_SMTP_USER: string;
  NOTIFY_SMTP_PASS: string;
  SMTP_HOST: string;
  SMTP_PORT: string;

  // GitHub Deployment Settings
  GITHUB_TOKEN: string;
  GITHUB_OWNER: string;
  GITHUB_REPO: string;
  GITHUB_WORKFLOW?: string;
  GITHUB_REF?: string;

  // Cloudflare Pages Deployment Settings
  CLOUDFLARE_PAGES_DEPLOY_HOOK?: string;
  CLOUDFLARE_ACCOUNT_ID?: string;
  CLOUDFLARE_PROJECT_NAME?: string;
  CLOUDFLARE_API_TOKEN?: string;
}
