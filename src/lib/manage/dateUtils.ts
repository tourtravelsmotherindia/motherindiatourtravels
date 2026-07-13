/**
 * Ensures a date string is treated as UTC by appending "Z" if no timezone indicator exists.
 * Dates from the API are stored as UTC in PostgreSQL but may arrive without timezone info.
 */
function ensureUTCDateString(value: string | Date | number): string | number | Date {
  if (typeof value === "string" && value.trim()) {
    // Check if the string already has timezone info (Z at end, or +/-HH:MM/±HHMM offset at end)
    if (!/[Zz]$|[+-]\d{2}:?\d{2}$/.test(value.trim())) {
      return value.trim() + "Z";
    }
  }
  return value;
}

/**
 * Converts a UTC date string to a localized date-time string for table display.
 * Uses the browser's locale and timezone for formatting.
 * Shows: "13 Jul 26, 10:33 AM"
 */
export function formatLocalDateTime(value: string | Date | number | null | undefined): string {
  if (!value) return "-";
  try {
    const date = new Date(ensureUTCDateString(value));
    if (isNaN(date.getTime())) return String(value);
    return date.toLocaleString(undefined, {
      day: "numeric",
      month: "short",
      year: "2-digit",
      hour: "2-digit",
      minute: "2-digit",
    });
  } catch {
    return String(value);
  }
}

/**
 * Formats a UTC date string for use in a datetime-local input.
 * Returns "YYYY-MM-DDTHH:MM" in the browser's local timezone.
 */
export function formatForDatetimeLocalInput(
  value: string | Date | number | null | undefined,
): string {
  if (!value) return "";
  try {
    const date = new Date(ensureUTCDateString(value));
    if (isNaN(date.getTime())) return "";
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    const hours = String(date.getHours()).padStart(2, "0");
    const minutes = String(date.getMinutes()).padStart(2, "0");
    return `${year}-${month}-${day}T${hours}:${minutes}`;
  } catch {
    return String(value);
  }
}

/**
 * Formats a UTC date string to a verbose localized string (includes seconds).
 * Shows: "13 Jul 26, 10:33:38 AM"
 */
export function formatLocalDateTimeVerbose(
  value: string | Date | number | null | undefined,
): string {
  if (!value) return "-";
  try {
    const date = new Date(ensureUTCDateString(value));
    if (isNaN(date.getTime())) return String(value);
    return date.toLocaleString(undefined, {
      day: "numeric",
      month: "short",
      year: "2-digit",
      hour: "2-digit",
      minute: "2-digit",
      second: "2-digit",
    });
  } catch {
    return String(value);
  }
}
