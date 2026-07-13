"use client";

import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { type ReactNode, useState } from "react";

function makeQueryClient() {
  return new QueryClient({
    defaultOptions: {
      queries: {
        // Admin panel data changes infrequently during a single session.
        // 2-minute stale time means the UI feels fresh but avoids redundant
        // refetches when navigating between views.
        staleTime: 2 * 60 * 1000,

        // Retry once on failure (network blip), then surface the error.
        retry: 1,

        // Don't refetch on window focus — admin users often switch tabs to
        // cross-reference data, and aggressive refetching is distracting.
        refetchOnWindowFocus: false,
      },
      mutations: {
        // Mutations should not retry automatically — create/update/delete
        // failures need explicit user action to retry.
        retry: 0,
      },
    },
  });
}

let browserQueryClient: QueryClient | undefined;

function getQueryClient() {
  if (typeof window === "undefined") {
    // Server: always make a new client (avoids cross-request state leaks)
    return makeQueryClient();
  }
  // Browser: reuse the same client for the lifetime of the page
  if (!browserQueryClient) {
    browserQueryClient = makeQueryClient();
  }
  return browserQueryClient;
}

export function QueryProvider({ children }: { children: ReactNode }) {
  const [queryClient] = useState(getQueryClient);

  return <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>;
}
