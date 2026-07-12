export interface Env {
  // Public vars (wrangler.toml [vars])
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
}
