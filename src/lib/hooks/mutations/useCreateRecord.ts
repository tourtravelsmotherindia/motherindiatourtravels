/**
 * Mutation hook for creating a new record.
 *
 * On success, invalidates the owning table's record list so the UI
 * reflects the new item without a full reload.
 */

import { useMutation, useQueryClient } from "@tanstack/react-query";

import { createRecord } from "@/lib/apiClient";

import { queryKeys } from "../queries/queryKeys";

export function useCreateRecord(table: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (data: Record<string, unknown>) => createRecord(table, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.records(table) });
    },
  });
}
