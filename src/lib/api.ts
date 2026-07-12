/**
 * Centralised API client for the Mother India Tour Travels Cloudflare Worker.
 * All forms and data fetches go through these typed helpers.
 *
 * Worker base URL: api.motherindiatourtravels.com
 */

const API_BASE = process.env.NEXT_PUBLIC_API_URL ?? "https://api.motherindiatourtravels.com";

// TYPES

export interface ApiError {
  error: string;
}

export interface BookingPayload {
  // Guest info
  name: string;
  email: string;
  phone: string;

  // Package context (optional for popup)
  packageId?: string;
  variantId?: string;
  packageInterest?: string; // loose package name for popup

  // Travel dates
  travelDate?: string | null; // ISO string
  travelDateEnd?: string | null;
  dateMode?: "calendar" | "flexible";
  flexibleMonth?: string; // e.g. "2025-03"
  flexibleDays?: number;

  // Travellers
  adults?: number;
  children?: number;
  infants?: number;
  rooms?: number;
  hotelCategory?: "3star" | "4star" | "5star";

  // Logistics
  pickupLocation?: string;
  dropLocation?: string;

  message?: string;
  source?: "BOOKING_FORM" | "POPUP" | "WHATSAPP" | "PHONE";
}

export interface ContactPayload {
  name: string;
  email: string;
  phone?: string;
  subject?: string;
  message: string;
  source?: "contact_page" | "popup";
}

export interface NewsletterPayload {
  email: string;
  name?: string;
}

export interface BookingResponse {
  success: boolean;
  id: string;
}

export interface ContactResponse {
  success: boolean;
  id: string;
}

export interface NewsletterResponse {
  success: boolean;
}

// HELPERS

async function post<TResponse>(path: string, body: unknown): Promise<TResponse> {
  const res = await fetch(`${API_BASE}${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });

  const data = (await res.json()) as TResponse | ApiError;

  if (!res.ok) {
    throw new Error((data as ApiError).error ?? `API error ${res.status}`);
  }

  return data as TResponse;
}

// PUBLIC API FUNCTIONS

/**
 * Submit a booking inquiry (from the /book page or popup modal).
 * Saves to Supabase BookingInquiry and sends confirmation emails.
 */
export async function submitBooking(payload: BookingPayload): Promise<BookingResponse> {
  return post<BookingResponse>("/booking", payload);
}

/**
 * Submit a contact form message (from /contact page or popup).
 * Saves to Supabase ContactSubmission and sends notification emails.
 */
export async function submitContact(payload: ContactPayload): Promise<ContactResponse> {
  return post<ContactResponse>("/contact", payload);
}

/**
 * Subscribe an email address to the newsletter.
 * Saves to Supabase NewsletterSubscriber (upserts on duplicate).
 */
export async function subscribeNewsletter(payload: NewsletterPayload): Promise<NewsletterResponse> {
  return post<NewsletterResponse>("/newsletter", payload);
}

/**
 * Build a public image URL served via the images worker from R2 storage.
 *
 * @param publicId   - R2 object key (e.g. "mother-india/gallery/photo.jpg")
 * @param _transforms - Unused, kept for backwards compatibility with call signatures
 */
export function buildImageUrl(publicId: string): string {
  const imagesBase =
    process.env.NEXT_PUBLIC_IMAGES_URL ?? "https://images.motherindiatourtravels.com";
  return `${imagesBase}/${publicId}`;
}
