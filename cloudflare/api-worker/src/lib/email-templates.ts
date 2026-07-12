const BRAND = "#e05423";
const BRAND_DARK = "#111111";

function baseTemplate(content: string, previewText: string): string {
  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>Mother India Tour Travels</title>
  <!--[if mso]><style>td, th { font-family: Arial, sans-serif !important; }</style><![endif]-->
</head>
<body style="margin:0;padding:0;background:#f5f4f2;font-family:Arial,Helvetica,sans-serif;">
  <!-- Preview text -->
  <div style="display:none;max-height:0;overflow:hidden;">${previewText}&zwnj;&nbsp;&zwnj;</div>

  <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background:#f5f4f2;">
    <tr><td align="center" style="padding:32px 16px;">
      <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="max-width:600px;">

        <!-- Header -->
        <tr><td style="background:${BRAND_DARK};border-radius:16px 16px 0 0;padding:28px 32px;text-align:center;">
          <p style="margin:0;font-size:22px;font-weight:bold;color:#ffffff;letter-spacing:-0.5px;">Mother India Tour Travels</p>
          <p style="margin:6px 0 0;font-size:12px;color:rgba(255,255,255,0.55);letter-spacing:2px;text-transform:uppercase;">Premium Travel Experiences</p>
        </td></tr>

        <!-- Accent bar -->
        <tr><td style="background:${BRAND};height:4px;"></td></tr>

        <!-- Body -->
        <tr><td style="background:#ffffff;padding:36px 32px;border-radius:0 0 16px 16px;">
          ${content}
        </td></tr>

        <!-- Footer -->
        <tr><td style="padding:24px 32px;text-align:center;">
          <p style="margin:0;font-size:12px;color:#999999;line-height:1.6;">Mother India Tour Travels · India<br>This is an automated message. Please do not reply directly to this email.</p>
        </td></tr>

      </table>
    </td></tr>
  </table>
</body>
</html>`;
}

function infoRow(label: string, value: string): string {
  return `<tr>
    <td style="padding:8px 0;font-size:13px;color:#666666;font-weight:600;width:40%;">${label}</td>
    <td style="padding:8px 0;font-size:13px;color:#111111;font-weight:500;">${value || "—"}</td>
  </tr>`;
}

// BOOKING TEMPLATES

export interface BookingEmailData {
  guestName: string;
  guestEmail: string;
  guestPhone: string;
  packageName: string;
  variantLabel: string;
  travelDate: string;
  travelDateEnd: string;
  dateMode: string;
  flexibleMonth: string;
  adults: number;
  children: number;
  infants: number;
  rooms: number;
  hotelCategory: string;
  pickupLocation: string;
  dropLocation: string;
  message: string;
  source: string;
  companyEmail: string;
}

/** Email sent to the guest confirming their booking inquiry */
export function bookingGuestTemplate(data: BookingEmailData): string {
  const content = `
    <h1 style="margin:0 0 8px;font-size:26px;font-weight:bold;color:${BRAND_DARK};">Booking Request Received! 🎉</h1>
    <p style="margin:0 0 24px;font-size:15px;color:#555555;line-height:1.6;">Hi ${data.guestName}, thank you for choosing Mother India Tour Travels. We've received your booking inquiry and our travel specialists will be in touch within 24 hours to discuss your customised itinerary.</p>

    <div style="background:#fff8f5;border-left:4px solid ${BRAND};border-radius:8px;padding:20px 24px;margin-bottom:28px;">
      <p style="margin:0 0 4px;font-size:11px;font-weight:bold;color:${BRAND};text-transform:uppercase;letter-spacing:1.5px;">Tour Package</p>
      <p style="margin:0;font-size:18px;font-weight:bold;color:${BRAND_DARK};">${data.packageName}</p>
      ${data.variantLabel ? `<p style="margin:4px 0 0;font-size:13px;color:#666666;">${data.variantLabel}</p>` : ""}
    </div>

    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom:28px;">
      ${data.travelDate ? infoRow("Travel Date", data.travelDate) : ""}
      ${data.travelDateEnd ? infoRow("Return Date", data.travelDateEnd) : ""}
      ${data.dateMode === "flexible" ? infoRow("Flexible Month", data.flexibleMonth) : ""}
      ${infoRow("Travellers", `${data.adults} Adult${data.adults !== 1 ? "s" : ""}${data.children > 0 ? `, ${data.children} Child${data.children !== 1 ? "ren" : ""}` : ""}${data.infants > 0 ? `, ${data.infants} Infant${data.infants !== 1 ? "s" : ""}` : ""}`)}
      ${infoRow("Rooms", `${data.rooms} Room${data.rooms !== 1 ? "s" : ""}`)}
      ${infoRow("Hotel Category", data.hotelCategory === "3star" ? "3 Star (Standard)" : data.hotelCategory === "5star" ? "5 Star (Luxury)" : "4 Star (Premium)")}
      ${data.pickupLocation ? infoRow("Pickup", data.pickupLocation) : ""}
      ${data.dropLocation ? infoRow("Drop", data.dropLocation) : ""}
    </table>

    ${data.message ? `<div style="background:#f9f9f9;border-radius:8px;padding:16px 20px;margin-bottom:28px;"><p style="margin:0 0 6px;font-size:11px;font-weight:bold;color:#999999;text-transform:uppercase;letter-spacing:1px;">Your Message</p><p style="margin:0;font-size:14px;color:#444444;line-height:1.6;">${data.message}</p></div>` : ""}

    <p style="margin:0 0 24px;font-size:14px;color:#555555;line-height:1.6;">If you have any urgent queries, feel free to reach out to us at <a href="mailto:${data.companyEmail}" style="color:${BRAND};text-decoration:none;font-weight:600;">${data.companyEmail}</a> and we'll be happy to assist you.</p>

    <p style="margin:0;font-size:14px;color:#555555;">Warm regards,<br><strong style="color:${BRAND_DARK};">Mother India Tour Travels Team</strong></p>
  `;

  return baseTemplate(
    content,
    `Booking received for ${data.packageName} — we'll be in touch soon!`,
  );
}

/** Notification email sent to the company with full booking details */
export function bookingCompanyTemplate(data: BookingEmailData): string {
  const hotelLabel =
    data.hotelCategory === "3star"
      ? "3 Star (Standard)"
      : data.hotelCategory === "5star"
        ? "5 Star (Luxury)"
        : "4 Star (Premium)";

  const content = `
    <div style="background:${BRAND};border-radius:8px;padding:12px 20px;margin-bottom:24px;display:inline-block;">
      <p style="margin:0;font-size:11px;font-weight:bold;color:#ffffff;text-transform:uppercase;letter-spacing:2px;">🔔 New Booking Inquiry</p>
    </div>

    <h1 style="margin:0 0 20px;font-size:22px;font-weight:bold;color:${BRAND_DARK};">${data.packageName}</h1>

    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom:24px;">
      <thead><tr><td colspan="2" style="padding:8px 0 4px;font-size:11px;font-weight:bold;color:${BRAND};text-transform:uppercase;letter-spacing:1.5px;">Guest Details</td></tr></thead>
      ${infoRow("Name", data.guestName)}
      ${infoRow("Email", `<a href="mailto:${data.guestEmail}" style="color:${BRAND};text-decoration:none;">${data.guestEmail}</a>`)}
      ${infoRow("Phone", data.guestPhone)}
      ${infoRow("Source", data.source)}
    </table>

    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom:24px;">
      <thead><tr><td colspan="2" style="padding:8px 0 4px;font-size:11px;font-weight:bold;color:${BRAND};text-transform:uppercase;letter-spacing:1.5px;">Tour Details</td></tr></thead>
      ${infoRow("Package", data.packageName)}
      ${data.variantLabel ? infoRow("Variant", data.variantLabel) : ""}
      ${data.travelDate ? infoRow("Travel Date", data.travelDate) : ""}
      ${data.travelDateEnd ? infoRow("Return Date", data.travelDateEnd) : ""}
      ${data.dateMode === "flexible" ? infoRow("Flexible Month", data.flexibleMonth) : ""}
      ${infoRow("Adults", String(data.adults))}
      ${infoRow("Children", String(data.children))}
      ${infoRow("Infants", String(data.infants))}
      ${infoRow("Rooms", String(data.rooms))}
      ${infoRow("Hotel Category", hotelLabel)}
      ${data.pickupLocation ? infoRow("Pickup", data.pickupLocation) : ""}
      ${data.dropLocation ? infoRow("Drop", data.dropLocation) : ""}
    </table>

    ${
      data.message
        ? `<table role="presentation" cellpadding="0" cellspacing="0" width="100%"><thead><tr><td style="padding:8px 0 4px;font-size:11px;font-weight:bold;color:${BRAND};text-transform:uppercase;letter-spacing:1.5px;">Customer Message</td></tr></thead><tr><td style="background:#f9f9f9;border-radius:8px;padding:16px;font-size:14px;color:#444444;line-height:1.6;">${data.message}</td></tr></table>`
        : ""
    }
  `;

  return baseTemplate(content, `NEW BOOKING: ${data.guestName} — ${data.packageName}`);
}

// CONTACT TEMPLATES

export interface ContactEmailData {
  name: string;
  email: string;
  phone: string;
  subject: string;
  message: string;
  source: string;
  companyEmail: string;
}

/** Confirmation email sent to the person who submitted the contact form */
export function contactGuestTemplate(data: ContactEmailData): string {
  const content = `
    <h1 style="margin:0 0 8px;font-size:26px;font-weight:bold;color:${BRAND_DARK};">We've received your message ✉️</h1>
    <p style="margin:0 0 24px;font-size:15px;color:#555555;line-height:1.6;">Hi ${data.name}, thank you for reaching out to Mother India Tour Travels. Our team will review your message and get back to you within 24–48 hours.</p>

    <div style="background:#f9f9f9;border-radius:8px;padding:20px;margin-bottom:28px;">
      <p style="margin:0 0 6px;font-size:11px;font-weight:bold;color:#999999;text-transform:uppercase;letter-spacing:1px;">Your Message</p>
      <p style="margin:0;font-size:14px;color:#444444;line-height:1.6;">${data.message}</p>
    </div>

    <p style="margin:0 0 24px;font-size:14px;color:#555555;line-height:1.6;">For urgent travel queries, you can also reach us at <a href="mailto:${data.companyEmail}" style="color:${BRAND};font-weight:600;text-decoration:none;">${data.companyEmail}</a>.</p>

    <p style="margin:0;font-size:14px;color:#555555;">Warm regards,<br><strong style="color:${BRAND_DARK};">Mother India Tour Travels Team</strong></p>
  `;

  return baseTemplate(content, "We have received your message and will be in touch soon");
}

/** Notification sent to the company about a new contact/popup submission */
export function contactCompanyTemplate(data: ContactEmailData): string {
  const content = `
    <div style="background:${BRAND_DARK};border-radius:8px;padding:12px 20px;margin-bottom:24px;display:inline-block;">
      <p style="margin:0;font-size:11px;font-weight:bold;color:#ffffff;text-transform:uppercase;letter-spacing:2px;">📩 New Contact Submission</p>
    </div>

    <h1 style="margin:0 0 20px;font-size:22px;font-weight:bold;color:${BRAND_DARK};">From: ${data.name}</h1>

    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom:24px;">
      ${infoRow("Name", data.name)}
      ${infoRow("Email", `<a href="mailto:${data.email}" style="color:${BRAND};text-decoration:none;">${data.email}</a>`)}
      ${infoRow("Phone", data.phone || "—")}
      ${data.subject ? infoRow("Subject", data.subject) : ""}
      ${infoRow("Source", data.source)}
    </table>

    <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
      <tr><td style="padding:8px 0 4px;font-size:11px;font-weight:bold;color:${BRAND};text-transform:uppercase;letter-spacing:1.5px;">Message</td></tr>
      <tr><td style="background:#f9f9f9;border-radius:8px;padding:16px;font-size:14px;color:#444444;line-height:1.6;">${data.message}</td></tr>
    </table>
  `;

  return baseTemplate(content, `CONTACT: ${data.name} via ${data.source}`);
}
