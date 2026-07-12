import {
  bookingCompanyTemplate,
  type BookingEmailData,
  bookingGuestTemplate,
} from "../lib/email-templates";
import { sendEmail } from "../lib/smtp";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** POST /booking — saves inquiry to Supabase and sends dual emails */
export async function handleBooking(request: Request, env: Env): Promise<Response> {
  let body: Record<string, unknown>;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "Invalid JSON body" }, { status: 400 });
  }

  const {
    name,
    email,
    phone,
    packageId,
    variantId,
    packageInterest,
    source = "BOOKING_FORM",
  } = body as Record<string, string>;

  if (!name?.trim() || !email?.trim() || !phone?.trim()) {
    return Response.json({ error: "name, email, and phone are required" }, { status: 400 });
  }

  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);

  // Build the record to insert
  const record = {
    packageId: packageId || null,
    variantId: variantId || null,
    packageInterest: (packageInterest as string) || "",
    name: (name as string).trim(),
    email: (email as string).trim().toLowerCase(),
    phone: (phone as string).trim(),
    travelDate: body.travelDate ?? null,
    travelDateEnd: body.travelDateEnd ?? null,
    dateMode: body.dateMode ?? "calendar",
    flexibleMonth: body.flexibleMonth ?? "",
    flexibleDays: body.flexibleDays ?? null,
    adults: Number(body.adults ?? 1),
    children: Number(body.children ?? 0),
    infants: Number(body.infants ?? 0),
    numberOfPeople:
      Number(body.adults ?? 1) + Number(body.children ?? 0) + Number(body.infants ?? 0),
    rooms: Number(body.rooms ?? 1),
    hotelCategory: (body.hotelCategory as string) || "4star",
    pickupLocation: (body.pickupLocation as string) || "",
    dropLocation: (body.dropLocation as string) || "",
    message: (body.message as string) || "",
    status: "NEW",
    source: source as string,
  };

  let inquiry: Record<string, unknown>;
  try {
    inquiry = await db.from("BookingInquiry").insert(record);
  } catch (err) {
    console.error("Booking insert failed:", err);
    return Response.json({ error: "Failed to save booking inquiry" }, { status: 500 });
  }

  // Fetch company email for notifications
  let companyEmail = "info@motherindiatourtravels.com";
  try {
    const company = await db.from("Company").select("email").getOne<{ email: string }>();
    if (company?.email) companyEmail = company.email;
  } catch {
    // non-fatal, use default
  }

  // Fetch package/variant names for emails
  let packageName = (packageInterest as string) || "Tour Package";
  let variantLabel = "";
  if (packageId) {
    try {
      const pkg = await db
        .from("Package")
        .select("name")
        .eq("id", packageId)
        .getOne<{ name: string }>();
      if (pkg?.name) packageName = pkg.name;
    } catch {
      /* non-fatal */
    }
  }
  if (variantId) {
    try {
      const variant = await db
        .from("PackageVariant")
        .select("label")
        .eq("id", variantId)
        .getOne<{ label: string }>();
      if (variant?.label) variantLabel = variant.label;
    } catch {
      /* non-fatal */
    }
  }

  const travelDateStr = body.travelDate
    ? new Date(body.travelDate as string).toLocaleDateString("en-IN", {
        day: "numeric",
        month: "long",
        year: "numeric",
      })
    : "";
  const travelDateEndStr = body.travelDateEnd
    ? new Date(body.travelDateEnd as string).toLocaleDateString("en-IN", {
        day: "numeric",
        month: "long",
        year: "numeric",
      })
    : "";

  const emailData: BookingEmailData = {
    guestName: record.name,
    guestEmail: record.email,
    guestPhone: record.phone,
    packageName,
    variantLabel,
    travelDate: travelDateStr,
    travelDateEnd: travelDateEndStr,
    dateMode: record.dateMode as string,
    flexibleMonth: record.flexibleMonth as string,
    adults: record.adults,
    children: record.children,
    infants: record.infants,
    rooms: record.rooms,
    hotelCategory: record.hotelCategory,
    pickupLocation: record.pickupLocation,
    dropLocation: record.dropLocation,
    message: record.message,
    source: record.source,
    companyEmail,
  };

  const smtpConfig = {
    host: env.SMTP_HOST,
    port: Number(env.SMTP_PORT),
    user: env.BOOKING_SMTP_USER,
    pass: env.BOOKING_SMTP_PASS,
  };

  // Send both emails concurrently — don't block response on email failure
  Promise.allSettled([
    sendEmail(smtpConfig, {
      from: env.BOOKING_SMTP_USER,
      fromName: "Mother India Tour Travels",
      to: [record.email],
      subject: `Your Booking Request — ${packageName}`,
      html: bookingGuestTemplate(emailData),
    }),
    sendEmail(smtpConfig, {
      from: env.BOOKING_SMTP_USER,
      fromName: "Mother India — Booking Alert",
      to: [companyEmail],
      subject: `[NEW BOOKING] ${packageName} — ${record.name}`,
      html: bookingCompanyTemplate(emailData),
    }),
  ]).then((results) => {
    results.forEach((r, i) => {
      if (r.status === "rejected") {
        console.error(`Booking email ${i} failed:`, r.reason);
      }
    });
  });

  return Response.json({ success: true, id: inquiry.id });
}
