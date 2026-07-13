import {
  contactCompanyTemplate,
  type ContactEmailData,
  contactGuestTemplate,
} from "../lib/email-templates";
import { sendEmail } from "../lib/smtp";
import { createSupabaseClient } from "../lib/supabase";
import type { Env } from "../types";

/** POST /contact — handles contact page form and popup modal */
export async function handleContact(
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

  const name = ((body.name as string) || "").trim();
  const email = ((body.email as string) || "").trim().toLowerCase();
  const phone = ((body.phone as string) || "").trim();
  const message = ((body.message as string) || "").trim();
  const subject = ((body.subject as string) || "").trim();
  const source = ((body.source as string) || "contact_page").trim();

  if (!name || !email || !message) {
    return Response.json({ error: "name, email, and message are required" }, { status: 400 });
  }

  const db = createSupabaseClient(env.SUPABASE_URL, env.SUPABASE_SECRET_KEY);

  let submission: Record<string, unknown>;
  try {
    submission = await db.from("ContactSubmission").insert({
      name,
      email,
      phone,
      subject,
      message,
      status: "NEW",
    });
  } catch (err) {
    console.error("Contact insert failed:", err);
    return Response.json({ error: "Failed to save contact submission" }, { status: 500 });
  }

  // Fetch company email
  let companyEmail = "info@motherindiatourtravels.com";
  try {
    const company = await db.from("Company").select("email").getOne<{ email: string }>();
    if (company?.email) companyEmail = company.email;
  } catch {
    /* non-fatal */
  }

  const emailData: ContactEmailData = {
    name,
    email,
    phone,
    subject,
    message,
    source,
    companyEmail,
  };

  const smtpConfig = {
    host: env.SMTP_HOST,
    port: Number(env.SMTP_PORT),
    user: env.BOOKING_SMTP_USER,
    pass: env.BOOKING_SMTP_PASS,
  };

  ctx.waitUntil(
    Promise.allSettled([
      sendEmail(smtpConfig, {
        from: env.BOOKING_SMTP_USER,
        fromName: "Mother India Tour Travels",
        to: [email],
        subject: `We've received your message — Mother India Tour Travels`,
        html: contactGuestTemplate(emailData),
      }),
      sendEmail(smtpConfig, {
        from: env.BOOKING_SMTP_USER,
        fromName: "Mother India — Contact Alert",
        to: [companyEmail],
        subject: `[CONTACT] ${name} via ${source}`,
        html: contactCompanyTemplate(emailData),
      }),
    ]).then((results) => {
      results.forEach((r, i) => {
        if (r.status === "rejected") console.error(`Contact email ${i} failed:`, r.reason);
      });
    }),
  );

  return Response.json({ success: true, id: submission.id });
}
