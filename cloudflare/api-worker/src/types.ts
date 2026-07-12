export interface Env {
  // Public vars (wrangler.toml [vars])
  ALLOWED_ORIGIN: string;

  // Secrets
  SUPABASE_URL: string;
  SUPABASE_SERVICE_KEY: string;
  CLOUDINARY_CLOUD: string;
  CLOUDINARY_KEY: string;
  CLOUDINARY_SECRET: string;
  BOOKING_SMTP_USER: string;
  BOOKING_SMTP_PASS: string;
  NOTIFY_SMTP_USER: string;
  NOTIFY_SMTP_PASS: string;
  SMTP_HOST: string;
  SMTP_PORT: string;
}
