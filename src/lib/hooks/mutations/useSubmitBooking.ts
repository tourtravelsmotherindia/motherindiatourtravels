/**
 * Mutation hook for submitting a booking inquiry.
 *
 * Wraps the public submitBooking API call from @/lib/api.
 * No onSuccess invalidation needed — the booking write does not affect
 * any React-Query-cached list visible to the user during the session.
 */

import { useMutation } from "@tanstack/react-query";

import { type BookingPayload, type BookingResponse, submitBooking } from "@/lib/api";

export function useSubmitBooking() {
  return useMutation<BookingResponse, Error, BookingPayload>({
    mutationFn: submitBooking,
  });
}
