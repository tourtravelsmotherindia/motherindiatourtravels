/**
 * Mutation hook for triggering a system diagnostic ping.
 *
 * On success, invalidates both the latest status and the logs list.
 */

import { useMutation, useQueryClient } from "@tanstack/react-query";

import { triggerSystemPing } from "@/lib/apiClient";

import { queryKeys } from "../queries/queryKeys";

export function useSystemPing() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: triggerSystemPing,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.systemStatusLatest() });
      queryClient.invalidateQueries({ queryKey: queryKeys.systemStatusLogs() });
    },
  });
}
