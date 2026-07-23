/**
 * Production-ready logging utility for application modules.
 * Ensures log messages are clean, formatted, free of emojis,
 * and redacts sensitive data (tokens, passwords, secrets) in production.
 */

const EMOJI_REGEX = /[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F700}-\u{1F77F}\u{1F780}-\u{1F7FF}\u{1F800}-\u{1F8FF}\u{1F900}-\u{1F9FF}\u{1FA00}-\u{1FA6F}\u{1FA70}-\u{1FAFF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}\u{2300}-\u{23FF}]/gu;

const SENSITIVE_KEYS = [
  "password",
  "token",
  "secret",
  "authorization",
  "access_token",
  "refresh_token",
  "apikey",
  "bearer",
];

/**
 * Strips emoji characters from text strings.
 */
function stripEmojis(message: string): string {
  return message.replace(EMOJI_REGEX, "").trim();
}

/**
 * Recursively sanitizes objects to hide sensitive values in production logs.
 */
function sanitizeValue(value: unknown, isProd: boolean): unknown {
  if (!value) return value;

  if (typeof value === "string") {
    let sanitized = stripEmojis(value);
    if (isProd) {
      // Redact bearer tokens or authorization strings if present
      if (/bearer\s+[a-zA-Z0-9._-]+/i.test(sanitized)) {
        sanitized = sanitized.replace(/bearer\s+[a-zA-Z0-9._-]+/gi, "Bearer [Redacted]");
      }
    }
    return sanitized;
  }

  if (value instanceof Error) {
    if (isProd) {
      return {
        name: value.name,
        message: stripEmojis(value.message),
      };
    }
    return {
      name: value.name,
      message: stripEmojis(value.message),
      stack: value.stack ? stripEmojis(value.stack) : undefined,
    };
  }

  if (typeof value === "object") {
    if (Array.isArray(value)) {
      return value.map((item) => sanitizeValue(item, isProd));
    }

    const sanitizedObj: Record<string, unknown> = {};
    for (const [key, val] of Object.entries(value as Record<string, unknown>)) {
      const lowerKey = key.toLowerCase();
      const isSensitive = SENSITIVE_KEYS.some((sensitive) => lowerKey.includes(sensitive));

      if (isProd && isSensitive) {
        sanitizedObj[key] = "[Redacted]";
      } else {
        sanitizedObj[key] = sanitizeValue(val, isProd);
      }
    }
    return sanitizedObj;
  }

  return value;
}

function isProduction(): boolean {
  return process.env.NODE_ENV === "production";
}

function formatTag(tag: string): string {
  const cleanTag = stripEmojis(tag);
  return cleanTag ? `[${cleanTag}]` : "[App]";
}

export const logger = {
  log(tag: string, message: string, ...args: unknown[]) {
    if (isProduction()) return; // Suppress verbose dev logs in production
    const cleanMsg = stripEmojis(message);
    const cleanArgs = args.map((arg) => sanitizeValue(arg, false));
    console.log(`${formatTag(tag)} ${cleanMsg}`, ...cleanArgs);
  },

  info(tag: string, message: string, ...args: unknown[]) {
    const isProd = isProduction();
    const cleanMsg = stripEmojis(message);
    const cleanArgs = args.map((arg) => sanitizeValue(arg, isProd));
    console.info(`${formatTag(tag)} ${cleanMsg}`, ...cleanArgs);
  },

  warn(tag: string, message: string, ...args: unknown[]) {
    const isProd = isProduction();
    const cleanMsg = stripEmojis(message);
    const cleanArgs = args.map((arg) => sanitizeValue(arg, isProd));
    console.warn(`${formatTag(tag)} ${cleanMsg}`, ...cleanArgs);
  },

  error(tag: string, message: string, ...args: unknown[]) {
    const isProd = isProduction();
    const cleanMsg = stripEmojis(message);
    const cleanArgs = args.map((arg) => sanitizeValue(arg, isProd));
    console.error(`${formatTag(tag)} ${cleanMsg}`, ...cleanArgs);
  },
};
