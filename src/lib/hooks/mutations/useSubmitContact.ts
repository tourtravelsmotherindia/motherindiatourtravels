/**
 * Mutation hook for submitting a contact form message.
 */

import { useMutation } from "@tanstack/react-query";

import { type ContactPayload, type ContactResponse, submitContact } from "@/lib/api";

export function useSubmitContact() {
  return useMutation<ContactResponse, Error, ContactPayload>({
    mutationFn: submitContact,
  });
}
