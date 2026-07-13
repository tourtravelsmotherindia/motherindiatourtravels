/**
 * Generic React Query hook for fetching all records from an admin CRUD table.
 *
 * Replaces ad-hoc useState/useEffect getRecords() calls in every component.
 */

import { useQuery } from "@tanstack/react-query";

import { fetchRecords } from "@/lib/apiClient";

import { queryKeys } from "./queryKeys";

interface UseRecordsOptions {
  /** Query params appended to the URL (e.g. "order=createdAt.desc&limit=100") */
  queryParams?: string;
  /** Enable/disable the query (defaults to true) */
  enabled?: boolean;
  /** Refetch interval in ms — only set for sections that need auto-refresh */
  refetchInterval?: number | false;
}

export function useRecords<T = Record<string, unknown>>(
  table: string,
  options: UseRecordsOptions = {},
) {
  const { queryParams, enabled = true, refetchInterval = false } = options;

  return useQuery({
    queryKey: queryKeys.records(table, queryParams),
    queryFn: () => fetchRecords<T>(table, queryParams),
    enabled,
    refetchInterval,
  });
}
