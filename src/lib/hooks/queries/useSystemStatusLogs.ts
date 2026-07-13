/**
 * React Query hook for the diagnostic log history (System Status page).
 *
 * Auto-refreshes every 60s by default since this is a monitoring dashboard.
 * The interval is configurable via the refetchInterval option.
 */

import { useQuery } from "@tanstack/react-query";

import { fetchRecords } from "@/lib/apiClient";
import type { SystemStatus } from "@/types/system-status";

import { queryKeys } from "./queryKeys";

interface UseSystemStatusLogsOptions {
  /** Auto-refresh interval in ms. Default 60s for monitoring. Set to false to disable. */
  refetchInterval?: number | false;
}

export function useSystemStatusLogs(options: UseSystemStatusLogsOptions = {}) {
  const { refetchInterval = 60_000 } = options;

  return useQuery({
    queryKey: queryKeys.systemStatusLogs(),
    queryFn: () => fetchRecords<SystemStatus>("system-status", "order=createdAt.desc&limit=100"),
    staleTime: 30 * 1000,
    refetchInterval,
  });
}
