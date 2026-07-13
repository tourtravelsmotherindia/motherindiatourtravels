/**
 * Mutation hook for deleting a record.
 *
 * On success, invalidates the owning table's record list and removes
 * the individual record from cache.
 */

import { useMutation, useQueryClient } from "@tanstack/react-query";

import { deleteRecord } from "@/lib/apiClient";

import { queryKeys } from "../queries/queryKeys";

interface DeleteRecordVariables {
  id: string | null;
  queryParams?: string;
}

export function useDeleteRecord(table: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, queryParams = "" }: DeleteRecordVariables) =>
      deleteRecord(table, id, queryParams),
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: queryKeys.records(table) });
      if (variables.id) {
        queryClient.removeQueries({ queryKey: queryKeys.record(table, variables.id) });
      }
    },
  });
}
