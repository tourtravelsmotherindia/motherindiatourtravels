/**
 * React Query hook for the latest system status snapshot.
 *
 * Used by the dashboard system health card and the ManageHeader status indicator.
 * Does NOT auto-refresh by default — set refetchInterval for live sections.
 */

import { useQuery } from "@tanstack/react-query";

import { fetchRecords } from "@/lib/apiClient";
import type { SystemStatus } from "@/types/system-status";

import { queryKeys } from "./queryKeys";

interface UseSystemStatusOptions {
  refetchInterval?: number | false;
}

export function useSystemStatus(options: UseSystemStatusOptions = {}) {
  const { refetchInterval = false } = options;

  return useQuery({
    queryKey: queryKeys.systemStatusLatest(),
    queryFn: async (): Promise<SystemStatus | null> => {
      const records = await fetchRecords<SystemStatus>(
        "system-status",
        "order=createdAt.desc&limit=1",
      );
      return records.length > 0 ? records[0] : null;
    },
    staleTime: 30 * 1000,
    refetchInterval,
  });
}
