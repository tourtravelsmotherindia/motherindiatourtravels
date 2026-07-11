// Lead capture domain types — v2.0
// Note: These types define the shape for future API routes.
// Forms in the UI do NOT save to DB directly — API routes will be wired later.

export type InquiryStatus = "NEW" | "READ" | "CONTACTED" | "CLOSED";
export type InquirySource = "BOOKING_FORM" | "POPUP" | "WHATSAPP" | "PHONE";
export type ContactStatus = "NEW" | "READ" | "REPLIED";

export interface BookingInquiry {
  id: string;
  packageId: string | null;
  variantId: string | null;
  name: string;
  email: string;
  phone: string;
  travelDate: Date | null;
  numberOfPeople: number;
  message: string;
  status: InquiryStatus;
  source: InquirySource;
  createdAt: Date;
  updatedAt: Date;
}

export interface CreateBookingInquiryInput {
  packageId?: string;
  variantId?: string;
  name: string;
  email: string;
  phone: string;
  travelDate?: string; // ISO date string from form
  numberOfPeople: number;
  message?: string;
  source?: InquirySource;
}

export interface ContactSubmission {
  id: string;
  name: string;
  email: string;
  phone: string;
  subject: string;
  message: string;
  status: ContactStatus;
  createdAt: Date;
}

export interface CreateContactSubmissionInput {
  name: string;
  email: string;
  phone?: string;
  subject?: string;
  message: string;
}

export interface NewsletterSubscriber {
  id: string;
  email: string;
  name: string;
  isVerified: boolean;
  subscribedAt: Date;
  unsubscribedAt: Date | null;
}

export interface CreateNewsletterSubscriberInput {
  email: string;
  name?: string;
}
