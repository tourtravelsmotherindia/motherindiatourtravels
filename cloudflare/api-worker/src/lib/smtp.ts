import { connect } from "cloudflare:sockets";

export interface SmtpConfig {
  host: string;
  port: number;
  user: string;
  pass: string;
}

export interface EmailMessage {
  from: string;
  fromName: string;
  to: string[];
  subject: string;
  html: string;
  text?: string;
}

/**
 * Minimal SMTP client for Cloudflare Workers via cloudflare:sockets.
 * Supports SMTPS (port 465, immediate TLS) with AUTH LOGIN.
 */
export async function sendEmail(config: SmtpConfig, message: EmailMessage): Promise<void> {
  const socket = connect(`${config.host}:${config.port}`, {
    secureTransport: "on",
    allowHalfOpen: false,
  });

  const writer = socket.writable.getWriter();
  const reader = socket.readable.getReader();
  const decoder = new TextDecoder();
  const encoder = new TextEncoder();
  let buf = "";

  /** Read buffered SMTP response lines (handles multi-line 250-... responses) */
  async function readResponse(): Promise<{ code: number; lines: string[] }> {
    const collectedLines: string[] = [];

    while (true) {
      // Drain buffer into lines
      while (true) {
        const idx = buf.indexOf("\r\n");
        if (idx === -1) break;
        const line = buf.slice(0, idx);
        buf = buf.slice(idx + 2);
        collectedLines.push(line);
        // position 3 is ' ' (final line) or '-' (continuation)
        if (line.length >= 4 && line[3] === " ") {
          const code = parseInt(line.slice(0, 3), 10);
          return { code, lines: collectedLines };
        }
      }
      // Need more data
      const { value, done } = await reader.read();
      if (done) throw new Error("SMTP connection closed unexpectedly");
      buf += decoder.decode(value);
    }
  }

  /** Write an SMTP command terminated with CRLF */
  async function cmd(text: string): Promise<{ code: number; lines: string[] }> {
    await writer.write(encoder.encode(text + "\r\n"));
    return readResponse();
  }

  try {
    // 1. Server greeting
    const greeting = await readResponse();
    if (greeting.code !== 220) {
      throw new Error(`SMTP greeting failed: ${greeting.code}`);
    }

    // 2. EHLO
    const ehlo = await cmd("EHLO cloudflare-worker");
    if (ehlo.code !== 250) throw new Error(`EHLO failed: ${ehlo.code}`);

    // 3. AUTH LOGIN
    const authPrompt = await cmd("AUTH LOGIN");
    if (authPrompt.code !== 334) throw new Error(`AUTH LOGIN failed: ${authPrompt.code}`);

    // 4. Username
    const userPrompt = await cmd(btoa(config.user));
    if (userPrompt.code !== 334) throw new Error(`AUTH username rejected: ${userPrompt.code}`);

    // 5. Password
    const authResult = await cmd(btoa(config.pass));
    if (authResult.code !== 235) throw new Error(`AUTH failed: ${authResult.code}`);

    // 6. MAIL FROM
    const mailFrom = await cmd(`MAIL FROM:<${message.from}>`);
    if (mailFrom.code !== 250) throw new Error(`MAIL FROM rejected: ${mailFrom.code}`);

    // 7. RCPT TO (for each recipient)
    for (const recipient of message.to) {
      const rcpt = await cmd(`RCPT TO:<${recipient}>`);
      if (rcpt.code !== 250) throw new Error(`RCPT TO rejected for ${recipient}: ${rcpt.code}`);
    }

    // 8. DATA
    const data = await cmd("DATA");
    if (data.code !== 354) throw new Error(`DATA rejected: ${data.code}`);

    // 9. Build and send the email body
    const textBody = message.text ?? "Please view this email in an HTML-capable client.";
    const boundary = `boundary_${Date.now()}`;
    const toHeader = message.to.join(", ");
    const dateHeader = new Date().toUTCString();

    const emailBody = [
      `From: ${message.fromName} <${message.from}>`,
      `To: ${toHeader}`,
      `Subject: ${message.subject}`,
      `Date: ${dateHeader}`,
      `MIME-Version: 1.0`,
      `Content-Type: multipart/alternative; boundary="${boundary}"`,
      "",
      `--${boundary}`,
      "Content-Type: text/plain; charset=utf-8",
      "Content-Transfer-Encoding: 7bit",
      "",
      textBody,
      "",
      `--${boundary}`,
      "Content-Type: text/html; charset=utf-8",
      "Content-Transfer-Encoding: 7bit",
      "",
      message.html,
      "",
      `--${boundary}--`,
      ".",
    ].join("\r\n");

    await writer.write(encoder.encode(emailBody + "\r\n"));
    const sent = await readResponse();
    if (sent.code !== 250) throw new Error(`DATA body rejected: ${sent.code}`);

    // 10. QUIT
    await cmd("QUIT");
  } finally {
    try {
      writer.releaseLock();
      reader.releaseLock();
      await socket.close();
    } catch {
      // Ignore close errors
    }
  }
}
