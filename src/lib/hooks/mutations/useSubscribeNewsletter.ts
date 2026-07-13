/**
 * Mutation hook for subscribing to the newsletter.
 */

import { useMutation } from "@tanstack/react-query";

import { type NewsletterPayload, type NewsletterResponse, subscribeNewsletter } from "@/lib/api";

export function useSubscribeNewsletter() {
  return useMutation<NewsletterResponse, Error, NewsletterPayload>({
    mutationFn: subscribeNewsletter,
  });
}
