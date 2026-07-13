/**
 * Mutation hook for image uploads to the R2-backed images worker.
 */

import { useMutation } from "@tanstack/react-query";

import { uploadImage } from "@/lib/apiClient";

export function useUploadImage() {
  return useMutation({
    mutationFn: ({ file, folder = "mother-india" }: { file: File; folder?: string }) =>
      uploadImage(file, folder),
  });
}
