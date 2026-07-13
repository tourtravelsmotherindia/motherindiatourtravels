/**
 * React Query hook for fetching a single record by table + id.
 */

import { useQuery } from "@tanstack/react-query";

import { fetchRecord } from "@/lib/apiClient";

import { queryKeys } from "./queryKeys";

export function useRecord<T = Record<string, unknown>>(table: string, id: string | null) {
  return useQuery({
    queryKey: queryKeys.record(table, id ?? ""),
    queryFn: () => fetchRecord<T>(table, id!),
    enabled: !!id && !!table,
  });
}
