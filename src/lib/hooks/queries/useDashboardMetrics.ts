/**
 * React Query hook for the dashboard overview metrics.
 *
 * Fetches counts across bookings, packages, blogs, contacts and the latest
 * system status. The dashboard doesn't auto-refresh — data is fresh on mount
 * and when the user manually pings.
 */

import { useQuery } from "@tanstack/react-query";

import { fetchRecords } from "@/lib/apiClient";
import { logger } from "@/lib/logger";
import type { SystemStatus } from "@/types/system-status";

import { queryKeys } from "./queryKeys";

export interface BookingSummary {
  id: string;
  name: string;
  email: string;
  phone: string;
  createdAt: string;
  status: string;
  numberOfPeople?: number;
  adults: number;
  children: number;
  infants: number;
  rooms: number;
}

export interface DashboardMetrics {
  bookingsCount: number;
  newBookings: number;
  packagesCount: number;
  blogsCount: number;
  contactsCount: number;
  systemStatus: SystemStatus | null;
  recentBookings: BookingSummary[];
}

export function useDashboardMetrics() {
  return useQuery({
    queryKey: queryKeys.dashboardMetrics(),
    queryFn: async (): Promise<DashboardMetrics> => {
      const [bookings, packages, blogs, contacts, statusRecords] = await Promise.all([
        fetchRecords<BookingSummary>("bookings"),
        fetchRecords("packages"),
        fetchRecords("blog-posts"),
        fetchRecords("contacts"),
        fetchRecords<SystemStatus>("system-status", "order=createdAt.desc&limit=1").catch((e) => {
          logger.error("DashboardMetrics", "Failed to fetch system status for dashboard:", e);
          return [];
        }),
      ]);

      const newBookingsCount = bookings.filter((b) => b.status === "NEW").length;

      const sorted = [...bookings].sort(
        (a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime(),
      );
      const recentBookings = sorted.slice(0, 5);

      return {
        bookingsCount: bookings.length,
        newBookings: newBookingsCount,
        packagesCount: packages.length,
        blogsCount: blogs.length,
        contactsCount: contacts.length,
        systemStatus: statusRecords && statusRecords.length > 0 ? statusRecords[0] : null,
        recentBookings,
      };
    },
    staleTime: 60 * 1000, // 1 minute — dashboard metrics don't change every second
  });
}
