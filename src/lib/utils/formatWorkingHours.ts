import { WorkingHours } from "@/types/company";

export function formatWorkingHours(
  workingHours: WorkingHours | null | undefined,
  separator = ":",
): string {
  const schedule = workingHours?.schedule;
  if (!schedule || !Array.isArray(schedule)) return "";

  const formatTime = (timeStr: string) => {
    const [hourStr, minStr] = timeStr.split(":");
    const hour = parseInt(hourStr, 10);
    const ampm = hour >= 12 ? "PM" : "AM";
    const hour12 = hour % 12 || 12;
    return `${hour12}:${minStr} ${ampm}`;
  };

  const firstSlot = schedule[0];
  const firstHours = firstSlot?.hours?.[0];
  if (!firstHours) return "";

  const allSameTime = schedule.every(
    (slot) =>
      slot.hours?.[0]?.open === firstHours.open && slot.hours?.[0]?.close === firstHours.close,
  );

  const formattedTime = `${formatTime(firstHours.open)} - ${formatTime(firstHours.close)}`;

  if (allSameTime) {
    const allDays = schedule.flatMap((slot) => slot.days);
    const hasMon = allDays.includes("mon");
    const hasSun = allDays.includes("sun");
    if (allDays.length >= 7 || (hasMon && hasSun)) {
      return `Monday - Sunday${separator} ${formattedTime}`;
    }
    return `Everyday${separator} ${formattedTime}`;
  }

  return schedule
    .map((slot) => {
      const daysStr = slot.days.map((d) => d.charAt(0).toUpperCase() + d.slice(1)).join(", ");
      const slotHours = slot.hours?.[0];
      if (!slotHours) return "";
      return `${daysStr}: ${formatTime(slotHours.open)} - ${formatTime(slotHours.close)}`;
    })
    .filter(Boolean)
    .join(" | ");
}
