export interface CompanyInfo {
  name: string;
  email: string;
  address: string;
  phone: string;
  whatsapp: string;
  website: string;
  socials: {
    facebook?: string;
    instagram?: string;
    twitter?: string;
    linkedin?: string;
    pinterest?: string;
  };
}

export interface BookingEmailData {
  guestName: string;
  guestEmail: string;
  guestPhone: string;
  packageName: string;
  variantLabel: string;
  packageSlug: string;
  variantSlug: string;
  travelDate: string;
  travelDateEnd: string;
  dateMode: string;
  flexibleMonth: string;
  flexibleDays: number | null;
  adults: number;
  children: number;
  infants: number;
  rooms: number;
  hotelCategory: string;
  pickupLocation: string;
  dropLocation: string;
  message: string;
  source: string;
  company: CompanyInfo;
}

export interface ContactEmailData {
  name: string;
  email: string;
  phone: string;
  subject: string;
  message: string;
  source: string;
  company: CompanyInfo;
}

function baseTemplate(content: string, previewText: string, company: CompanyInfo): string {
  const cleanPhone = company.phone ? company.phone.trim() : "";
  const cleanWhatsapp = company.whatsapp ? company.whatsapp.trim() : "";

  return `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>${company.name}</title>
  <!--[if !mso]><!-->
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@500;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet" />
  <!--<![endif]-->
  <style>
    body {
      margin: 0;
      padding: 0;
      background-color: #f7f6f4;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      -webkit-font-smoothing: antialiased;
    }
    table {
      border-collapse: collapse;
      mso-table-lspace: 0pt;
      mso-table-rspace: 0pt;
    }
    td {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    }
    .heading {
      font-family: 'Outfit', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    }
    @media only screen and (max-width: 600px) {
      .container {
        padding: 16px 8px !important;
      }
      .content-card {
        padding: 24px 16px !important;
      }
      .grid-cell {
        display: block !important;
        width: 100% !important;
        box-sizing: border-box !important;
        margin-bottom: 16px !important;
      }
    }
  </style>
</head>
<body style="margin: 0; padding: 0; background-color: #f7f6f4;">
  <div style="display:none;max-height:0;overflow:hidden;">${previewText}&zwnj;&nbsp;&zwnj;</div>
  
  <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background-color: #f7f6f4;">
    <tr>
      <td align="center" style="padding: 40px 16px;" class="container">
        <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
          
          <!-- Main White Card -->
          <tr>
            <td style="background-color: #ffffff; border-radius: 12px; border: 1px solid #e8e6e2; box-shadow: 0 4px 12px rgba(0,0,0,0.015); padding: 40px;" class="content-card">
              
              <!-- Logo (Centered inside the card) -->
              <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="border-bottom: 1px solid #e8e6e2; padding-bottom: 24px; margin-bottom: 28px;">
                <tr>
                  <td align="center">
                    <img src="https://images.motherindiatourtravels.com/logo.png" alt="${company.name}" style="height: 72px; max-width: 280px; width: auto; border: 0; display: block;" />
                  </td>
                </tr>
              </table>

              <!-- Content Body -->
              ${content}
              
              <!-- Need Help (Inside the card at the bottom) -->
              <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="border-top: 1px solid #e8e6e2; margin-top: 40px;">
                <tr>
                  <td style="padding-top: 32px;">
                    <h3 style="margin: 0 0 12px; font-family: 'Outfit', sans-serif; font-size: 16px; font-weight: 600; color: #111111;">Need Help?</h3>
                    <p style="margin: 0 0 16px; font-size: 14px; color: #555555; line-height: 1.5;">
                      Our customer support team is available to assist you:
                    </p>
                    
                    <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
                      <!-- Email -->
                      <tr>
                        <td style="padding: 6px 0; font-size: 13px; color: #555555; vertical-align: middle;">
                          <img src="https://img.icons8.com/material-outlined/32/777777/mail.png" width="16" height="16" style="vertical-align: middle; margin-right: 8px; display: inline-block;" />
                          <a href="mailto:${company.email}" style="color: #555555; text-decoration: none; font-weight: 500;">${company.email}</a>
                        </td>
                      </tr>
                      <!-- Phone -->
                      ${
                        cleanPhone
                          ? `
                      <tr>
                        <td style="padding: 6px 0; font-size: 13px; color: #555555; vertical-align: middle;">
                          <img src="https://img.icons8.com/material-outlined/32/777777/phone.png" width="16" height="16" style="vertical-align: middle; margin-right: 8px; display: inline-block;" />
                          <a href="tel:${cleanPhone}" style="color: #555555; text-decoration: none; font-weight: 500;">${cleanPhone}</a>
                        </td>
                      </tr>
                      `
                          : ""
                      }
                      <!-- WhatsApp -->
                      ${
                        cleanWhatsapp
                          ? `
                      <tr>
                        <td style="padding: 6px 0; font-size: 13px; color: #555555; vertical-align: middle;">
                          <img src="https://img.icons8.com/material-outlined/32/777777/whatsapp.png" width="16" height="16" style="vertical-align: middle; margin-right: 8px; display: inline-block;" />
                          <a href="https://wa.me/${cleanWhatsapp.replace(/[^0-9]/g, "")}" style="color: #555555; text-decoration: none; font-weight: 500;">${cleanWhatsapp}</a>
                        </td>
                      </tr>
                      `
                          : ""
                      }
                    </table>
                  </td>
                </tr>
              </table>

            </td>
          </tr>
          
          <!-- Footer (Outside the card) -->
          <tr>
            <td style="padding: 32px 24px 0; text-align: center;">
              
              <!-- Social Icons -->
              <table role="presentation" cellpadding="0" cellspacing="0" align="center" style="margin-bottom: 20px;">
                <tr>
                  ${
                    company.socials.facebook
                      ? `
                  <td style="padding: 0 8px;">
                    <a href="${company.socials.facebook}" target="_blank" style="text-decoration: none;">
                      <img src="https://img.icons8.com/material-outlined/32/999999/facebook.png" width="18" height="18" style="display: block; border: 0;" />
                    </a>
                  </td>`
                      : ""
                  }
                  ${
                    company.socials.instagram
                      ? `
                  <td style="padding: 0 8px;">
                    <a href="${company.socials.instagram}" target="_blank" style="text-decoration: none;">
                      <img src="https://img.icons8.com/material-outlined/32/999999/instagram.png" width="18" height="18" style="display: block; border: 0;" />
                    </a>
                  </td>`
                      : ""
                  }
                  ${
                    company.socials.twitter
                      ? `
                  <td style="padding: 0 8px;">
                    <a href="${company.socials.twitter}" target="_blank" style="text-decoration: none;">
                      <img src="https://img.icons8.com/material-outlined/32/999999/twitter.png" width="18" height="18" style="display: block; border: 0;" />
                    </a>
                  </td>`
                      : ""
                  }
                  ${
                    company.socials.linkedin
                      ? `
                  <td style="padding: 0 8px;">
                    <a href="${company.socials.linkedin}" target="_blank" style="text-decoration: none;">
                      <img src="https://img.icons8.com/material-outlined/32/999999/linkedin.png" width="18" height="18" style="display: block; border: 0;" />
                    </a>
                  </td>`
                      : ""
                  }
                  ${
                    company.socials.pinterest
                      ? `
                  <td style="padding: 0 8px;">
                    <a href="${company.socials.pinterest}" target="_blank" style="text-decoration: none;">
                      <img src="https://img.icons8.com/material-outlined/32/999999/pinterest.png" width="18" height="18" style="display: block; border: 0;" />
                    </a>
                  </td>`
                      : ""
                  }
                </tr>
              </table>
              
              <!-- Company Info & Copyright -->
              <p style="margin: 0 0 6px; font-size: 12px; color: #999999; line-height: 1.6; font-weight: 500;">
                © 2026 ${company.name}. All rights reserved.
              </p>
              <p style="margin: 0 0 16px; font-size: 11px; color: #aaaaaa; line-height: 1.6;">
                ${company.address}
              </p>
              
              <!-- Legal Utility Links -->
              <p style="margin: 0; font-size: 11px; color: #aaaaaa;">
                <a href="${company.website}" style="color: #999999; text-decoration: none; margin: 0 6px;">Website</a> | 
                <a href="${company.website}/privacy" style="color: #999999; text-decoration: none; margin: 0 6px;">Privacy Policy</a> | 
                <a href="${company.website}/terms" style="color: #999999; text-decoration: none; margin: 0 6px;">Terms of Service</a>
              </p>
              
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

function detailsBoxHeader(title: string, subtitle?: string): string {
  return `<table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="border-bottom: 1px solid #e8e6e2; padding-bottom: 16px; margin-bottom: 16px;">
    <tr>
      <td>
        <span style="font-family: 'Outfit', sans-serif; font-size: 18px; font-weight: 700; color: #111111; display: block;">${title}</span>
        ${subtitle ? `<span style="font-size: 13px; color: #666666; display: block; margin-top: 4px;">${subtitle}</span>` : ""}
      </td>
    </tr>
  </table>`;
}

function detailsGridRow(
  leftTitle: string,
  leftVal: string,
  rightTitle?: string,
  rightVal?: string,
): string {
  return `<tr>
    <td valign="top" width="${rightTitle ? "50%" : "100%"}" class="grid-cell" style="padding-bottom: 16px; font-size: 13px; color: #666666; line-height: 1.5;">
      <strong style="font-family: 'Outfit', sans-serif; color: #111111; display: block; margin-bottom: 4px; text-transform: uppercase; font-size: 11px; letter-spacing: 0.5px;">${leftTitle}</strong>
      <span style="color: #444444; font-weight: 500;">${leftVal}</span>
    </td>
    ${
      rightTitle
        ? `
    <td valign="top" width="50%" class="grid-cell" style="padding-bottom: 16px; font-size: 13px; color: #666666; line-height: 1.5;">
      <strong style="font-family: 'Outfit', sans-serif; color: #111111; display: block; margin-bottom: 4px; text-transform: uppercase; font-size: 11px; letter-spacing: 0.5px;">${rightTitle}</strong>
      <span style="color: #444444; font-weight: 500;">${rightVal}</span>
    </td>
    `
        : ""
    }
  </tr>`;
}

/** Email sent to the guest confirming their booking inquiry */
export function bookingGuestTemplate(data: BookingEmailData): string {
  const hotelLabel =
    data.hotelCategory === "3star"
      ? "3 Star (Standard)"
      : data.hotelCategory === "5star"
        ? "5 Star (Luxury)"
        : "4 Star (Premium)";

  const packageUrl = `https://www.motherindiatourtravels.com/packages/${data.packageSlug}${data.variantSlug ? "/" + data.variantSlug : ""}`;

  const travellersText = `${data.adults} Adult${data.adults !== 1 ? "s" : ""}${data.children > 0 ? `, ${data.children} Child${data.children !== 1 ? "ren" : ""}` : ""}${data.infants > 0 ? `, ${data.infants} Infant${data.infants !== 1 ? "s" : ""}` : ""}`;

  const content = `
    <h2 class="heading" style="margin: 0 0 12px; font-size: 24px; font-weight: 700; color: #111111; letter-spacing: -0.5px;">Booking Inquiry Received</h2>
    <p style="margin: 0 0 24px; font-size: 15px; color: #444444; line-height: 1.6;">Hi ${data.guestName}, thank you for choosing Mother India Tour Travels. We have received your booking inquiry and our travel specialists will contact you within 24 hours to discuss your customized itinerary.</p>

    <!-- Details Card -->
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 8px; margin: 28px 0; overflow: hidden;">
      <tr>
        <td style="padding: 24px;">
          ${detailsBoxHeader(data.packageName, data.variantLabel)}
          
          <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
            ${detailsGridRow(
              data.dateMode === "flexible" ? "Flexible Month" : "Travel Date",
              data.dateMode === "flexible" ? data.flexibleMonth : data.travelDate,
              data.dateMode === "flexible" ? "Duration" : "Return Date",
              data.dateMode === "flexible" ? `${data.flexibleDays} Days` : data.travelDateEnd,
            )}
            ${detailsGridRow(
              "Travellers & Rooms",
              `${travellersText}<br>Rooms: ${data.rooms}`,
              "Hotel Standard",
              hotelLabel,
            )}
            ${
              data.pickupLocation || data.dropLocation
                ? detailsGridRow(
                    "Pickup Location",
                    data.pickupLocation || "—",
                    "Drop Location",
                    data.dropLocation || "—",
                  )
                : ""
            }
          </table>
        </td>
      </tr>
    </table>

    ${
      data.message
        ? `
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 28px;">
      <tr>
        <td style="font-size: 13px; color: #666666; line-height: 1.5;">
          <strong style="font-family: 'Outfit', sans-serif; color: #111111; display: block; margin-bottom: 6px; text-transform: uppercase; font-size: 11px; letter-spacing: 0.5px;">Your Message</strong>
          <div style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 6px; padding: 16px; font-size: 14px; color: #444444; line-height: 1.6;">
            ${data.message}
          </div>
        </td>
      </tr>
    </table>
    `
        : ""
    }

    <!-- CTA Button -->
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin: 32px 0 16px;">
      <tr>
        <td align="left">
          <a href="${packageUrl}" target="_blank" style="display: inline-block; background-color: #e05423; color: #ffffff; font-family: 'Outfit', sans-serif; font-size: 14px; font-weight: 600; text-decoration: none; padding: 12px 24px; border-radius: 6px; box-shadow: 0 4px 10px rgba(224, 84, 35, 0.15);">
            View Package Details
          </a>
        </td>
      </tr>
    </table>

    <p style="margin: 24px 0 0; font-size: 14px; color: #555555; line-height: 1.6;">
      Warm regards,<br>
      <strong style="color: #111111;">Mother India Tour Travels Team</strong>
    </p>
  `;

  return baseTemplate(
    content,
    `Booking received for ${data.packageName} — we will be in touch soon`,
    data.company,
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

  const packageUrl = `https://www.motherindiatourtravels.com/packages/${data.packageSlug}${data.variantSlug ? "/" + data.variantSlug : ""}`;

  const travellersText = `${data.adults} Adult${data.adults !== 1 ? "s" : ""}${data.children > 0 ? `, ${data.children} Child${data.children !== 1 ? "ren" : ""}` : ""}${data.infants > 0 ? `, ${data.infants} Infant${data.infants !== 1 ? "s" : ""}` : ""}`;

  const content = `
    <span style="font-size: 11px; font-weight: 600; color: #e05423; text-transform: uppercase; letter-spacing: 1.5px; display: block; margin-bottom: 8px;">New Booking Inquiry</span>
    <h2 class="heading" style="margin: 0 0 20px; font-size: 24px; font-weight: 700; color: #111111; letter-spacing: -0.5px;">${data.packageName}</h2>

    <!-- Guest Details -->
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 8px; margin-bottom: 20px;">
      <tr>
        <td style="padding: 20px 24px;">
          <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
            ${detailsGridRow(
              "Guest Name",
              data.guestName,
              "Email Address",
              `<a href="mailto:${data.guestEmail}" style="color: #e05423; text-decoration: none;">${data.guestEmail}</a>`,
            )}
            ${detailsGridRow("Phone Number", data.guestPhone, "Submission Source", data.source)}
          </table>
        </td>
      </tr>
    </table>

    <!-- Tour Details -->
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 8px; margin-bottom: 24px;">
      <tr>
        <td style="padding: 20px 24px;">
          <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
            ${detailsGridRow(
              "Selected Package",
              data.packageName,
              "Selected Variant",
              data.variantLabel || "Standard",
            )}
            ${detailsGridRow(
              data.dateMode === "flexible" ? "Flexible Month" : "Travel Date",
              data.dateMode === "flexible" ? data.flexibleMonth : data.travelDate,
              data.dateMode === "flexible" ? "Duration" : "Return Date",
              data.dateMode === "flexible" ? `${data.flexibleDays} Days` : data.travelDateEnd,
            )}
            ${detailsGridRow(
              "Travellers & Rooms",
              `${travellersText}<br>Rooms: ${data.rooms}`,
              "Hotel Category",
              hotelLabel,
            )}
            ${
              data.pickupLocation || data.dropLocation
                ? detailsGridRow(
                    "Pickup Location",
                    data.pickupLocation || "—",
                    "Drop Location",
                    data.dropLocation || "—",
                  )
                : ""
            }
          </table>
        </td>
      </tr>
    </table>

    ${
      data.message
        ? `
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 28px;">
      <tr>
        <td style="font-size: 13px; color: #666666; line-height: 1.5;">
          <strong style="font-family: 'Outfit', sans-serif; color: #111111; display: block; margin-bottom: 6px; text-transform: uppercase; font-size: 11px; letter-spacing: 0.5px;">Customer Message</strong>
          <div style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 6px; padding: 16px; font-size: 14px; color: #444444; line-height: 1.6;">
            ${data.message}
          </div>
        </td>
      </tr>
    </table>
    `
        : ""
    }

    <!-- CTA Button -->
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-top: 24px;">
      <tr>
        <td align="left">
          <a href="${packageUrl}" target="_blank" style="display: inline-block; background-color: #e05423; color: #ffffff; font-family: 'Outfit', sans-serif; font-size: 14px; font-weight: 600; text-decoration: none; padding: 12px 24px; border-radius: 6px; box-shadow: 0 4px 10px rgba(224, 84, 35, 0.15);">
            Open Package Page
          </a>
        </td>
      </tr>
    </table>
  `;

  return baseTemplate(
    content,
    `NEW BOOKING: ${data.guestName} — ${data.packageName}`,
    data.company,
  );
}

/** Confirmation email sent to the person who submitted the contact form */
export function contactGuestTemplate(data: ContactEmailData): string {
  const content = `
    <h2 class="heading" style="margin: 0 0 12px; font-size: 24px; font-weight: 700; color: #111111; letter-spacing: -0.5px;">Message Received</h2>
    <p style="margin: 0 0 24px; font-size: 15px; color: #444444; line-height: 1.6;">Hi ${data.name}, thank you for reaching out to Mother India Tour Travels. We have received your message and our team will get back to you within 24 hours.</p>

    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 28px;">
      <tr>
        <td style="font-size: 13px; color: #666666; line-height: 1.5;">
          <strong style="font-family: 'Outfit', sans-serif; color: #111111; display: block; margin-bottom: 6px; text-transform: uppercase; font-size: 11px; letter-spacing: 0.5px;">Your Message</strong>
          <div style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 6px; padding: 16px; font-size: 14px; color: #444444; line-height: 1.6;">
            ${data.message}
          </div>
        </td>
      </tr>
    </table>

    <p style="margin: 0; font-size: 14px; color: #555555; line-height: 1.6;">
      Warm regards,<br>
      <strong style="color: #111111;">Mother India Tour Travels Team</strong>
    </p>
  `;

  return baseTemplate(
    content,
    "We have received your message and will be in touch soon",
    data.company,
  );
}

/** Notification sent to the company about a new contact/popup submission */
export function contactCompanyTemplate(data: ContactEmailData): string {
  const content = `
    <span style="font-size: 11px; font-weight: 600; color: #e05423; text-transform: uppercase; letter-spacing: 1.5px; display: block; margin-bottom: 8px;">New Contact Message</span>
    <h2 class="heading" style="margin: 0 0 20px; font-size: 24px; font-weight: 700; color: #111111; letter-spacing: -0.5px;">From: ${data.name}</h2>

    <!-- Contact Info -->
    <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 8px; margin-bottom: 24px;">
      <tr>
        <td style="padding: 20px 24px;">
          <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
            ${detailsGridRow(
              "Contact Name",
              data.name,
              "Email Address",
              `<a href="mailto:${data.email}" style="color: #e05423; text-decoration: none;">${data.email}</a>`,
            )}
            ${detailsGridRow(
              "Phone Number",
              data.phone || "—",
              "Subject / Topic",
              data.subject || "—",
            )}
            ${detailsGridRow("Submission Source", data.source, "", "")}
          </table>
        </td>
      </tr>
    </table>

    <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td style="font-size: 13px; color: #666666; line-height: 1.5;">
          <strong style="font-family: 'Outfit', sans-serif; color: #111111; display: block; margin-bottom: 6px; text-transform: uppercase; font-size: 11px; letter-spacing: 0.5px;">Message Details</strong>
          <div style="background-color: #fbfbfa; border: 1px solid #e8e6e2; border-radius: 6px; padding: 16px; font-size: 14px; color: #444444; line-height: 1.6;">
            ${data.message}
          </div>
        </td>
      </tr>
    </table>
  `;

  return baseTemplate(content, `CONTACT: ${data.name} via ${data.source}`, data.company);
}
