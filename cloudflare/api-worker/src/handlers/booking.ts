import {
  bookingCompanyTemplate,
  type BookingEmailData,
  bookingGuestTemplate,
} from "../lib/email-templates";
import { sendEmail } from "../lib/smtp";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";
import companyJson from "../company.json";

/** POST /booking — saves inquiry to Supabase and sends dual emails */
export async function handleBooking(
  request: Request,
  env: Env,
  ctx: ExecutionContext,
): Promise<Response> {
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

  const dateMode = (body.dateMode as string) || "calendar";

  // Build the record to insert
  const record = {
    packageId: packageId || null,
    variantId: variantId || null,
    packageInterest: (packageInterest as string) || "",
    name: (name as string).trim(),
    email: (email as string).trim().toLowerCase(),
    phone: (phone as string).trim(),
    travelDate: dateMode === "flexible" ? null : body.travelDate ? String(body.travelDate) : null,
    travelDateEnd:
      dateMode === "flexible" ? null : body.travelDateEnd ? String(body.travelDateEnd) : null,
    dateMode,
    flexibleMonth: (body.flexibleMonth as string) || "",
    flexibleDays: body.flexibleDays ? Number(body.flexibleDays) : null,
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
    updatedAt: new Date().toISOString(),
  };

  let inquiry: Record<string, unknown>;
  try {
    inquiry = await db.from("BookingInquiry").insert(record);
  } catch (err) {
    console.error("Booking insert failed:", err);
    return Response.json({ error: "Failed to save booking inquiry" }, { status: 500 });
  }

  // Map company details from JSON
  const companyInfo = {
    name: companyJson.name,
    email: companyJson.email,
    address: companyJson.address,
    phone: companyJson.phone,
    whatsapp: companyJson.whatsapp,
    website: companyJson.website,
    socials: companyJson.socials,
  };

  // Fetch package/variant names and slugs for emails
  let packageName = (packageInterest as string) || "Tour Package";
  let variantLabel = "";
  let variantSlug = "";
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
        .select("label,slug")
        .eq("id", variantId)
        .getOne<{ label: string; slug: string }>();
      if (variant?.label) variantLabel = variant.label;
      if (variant?.slug) variantSlug = variant.slug;
    } catch {
      /* non-fatal */
    }
  }

  // Format travel dates (only if not flexible)
  const travelDateStr =
    record.dateMode !== "flexible" && body.travelDate
      ? new Date(body.travelDate as string).toLocaleDateString("en-IN", {
          day: "numeric",
          month: "long",
          year: "numeric",
        })
      : "";
  const travelDateEndStr =
    record.dateMode !== "flexible" && body.travelDateEnd
      ? new Date(body.travelDateEnd as string).toLocaleDateString("en-IN", {
          day: "numeric",
          month: "long",
          year: "numeric",
        })
      : "";

  // Format flexible month nicely: e.g. "2026-09" to "September 2026"
  let flexibleMonthStr = record.flexibleMonth;
  if (record.flexibleMonth && /^\d{4}-\d{2}$/.test(record.flexibleMonth)) {
    const [year, month] = record.flexibleMonth.split("-");
    const date = new Date(Number(year), Number(month) - 1, 1);
    flexibleMonthStr = date.toLocaleDateString("en-US", { month: "long", year: "numeric" });
  }

  const emailData: BookingEmailData = {
    guestName: record.name,
    guestEmail: record.email,
    guestPhone: record.phone,
    packageName,
    variantLabel,
    packageSlug: packageId || "",
    variantSlug,
    travelDate: travelDateStr,
    travelDateEnd: travelDateEndStr,
    dateMode: record.dateMode as string,
    flexibleMonth: flexibleMonthStr,
    flexibleDays: record.flexibleDays,
    adults: record.adults,
    children: record.children,
    infants: record.infants,
    rooms: record.rooms,
    hotelCategory: record.hotelCategory,
    pickupLocation: record.pickupLocation,
    dropLocation: record.dropLocation,
    message: record.message,
    source: record.source,
    company: companyInfo,
  };

  const smtpConfig = {
    host: env.SMTP_HOST,
    port: Number(env.SMTP_PORT),
    user: env.BOOKING_SMTP_USER,
    pass: env.BOOKING_SMTP_PASS,
  };

  // Send both emails concurrently — don't block response on email failure
  ctx.waitUntil(
    Promise.allSettled([
      sendEmail(smtpConfig, {
        from: env.BOOKING_SMTP_USER,
        fromName: "Mother India Tour Travels",
        to: [record.email],
        replyTo: companyInfo.email,
        subject: `Your Booking Inquiry for ${packageName} — Mother India Tour Travels`,
        html: bookingGuestTemplate(emailData),
      }),
      sendEmail(smtpConfig, {
        from: env.BOOKING_SMTP_USER,
        fromName: "Mother India Tour Travels",
        to: [companyInfo.email],
        replyTo: record.email,
        subject: `New Booking Inquiry: ${packageName} — ${record.name}`,
        html: bookingCompanyTemplate(emailData),
      }),
    ]).then((results) => {
      results.forEach((r, i) => {
        if (r.status === "rejected") {
          console.error(`Booking email ${i} failed:`, r.reason);
        }
      });
    }),
  );

  return Response.json({ success: true, id: inquiry.id });
}
