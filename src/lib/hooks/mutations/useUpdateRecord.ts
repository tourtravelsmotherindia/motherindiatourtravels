/**
 * Mutation hook for updating an existing record.
 *
 * On success, invalidates both the list and the individual record cache.
 */

import { useMutation, useQueryClient } from "@tanstack/react-query";

import { updateRecord } from "@/lib/apiClient";

import { queryKeys } from "../queries/queryKeys";

interface UpdateRecordVariables {
  id: string | null;
  data: Record<string, unknown>;
  queryParams?: string;
}

export function useUpdateRecord(table: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, data, queryParams = "" }: UpdateRecordVariables) =>
      updateRecord(table, id, data, queryParams),
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: queryKeys.records(table) });
      if (variables.id) {
        queryClient.invalidateQueries({
          queryKey: queryKeys.record(table, variables.id),
        });
      }
    },
  });
}
