/**
 * Centralized API client for admin React Query hooks.
 * Wraps the existing adminApi functions into a structured, typed client
 * with consistent error shapes for useQuery / useMutation consumers.
 *
 * All admin data flows through this module — no raw fetch() in components.
 */

import {
  adminDelete,
  adminGet,
  adminPatch,
  adminPost,
  uploadImage as uploadImageRaw,
} from "@/lib/adminApi";

// Re-export auth helpers so consumers don't need dual imports
export {
  clearTokens,
  getAccessToken,
  getRefreshToken,
  isLoggedIn,
  logout,
  setTokens,
} from "@/lib/adminApi";

// Types

export interface ApiClientError {
  message: string;
  status?: number;
}

export interface UploadResult {
  public_id: string;
  url: string;
  bytes: number;
}

// Generic CRUD client — plain functions (not hooks) that React Query calls

export async function fetchRecords<T = Record<string, unknown>>(
  table: string,
  queryParams: string = "",
): Promise<T[]> {
  const queryString = queryParams
    ? queryParams.startsWith("?")
      ? queryParams
      : `?${queryParams}`
    : "";
  return adminGet<T[]>(`/admin/crud/${table}${queryString}`);
}

export async function fetchRecord<T = Record<string, unknown>>(
  table: string,
  id: string,
): Promise<T> {
  return adminGet<T>(`/admin/crud/${table}/${id}`);
}

export async function createRecord<T = Record<string, unknown>>(
  table: string,
  data: Record<string, unknown>,
): Promise<T> {
  return adminPost<T>(`/admin/crud/${table}`, data);
}

export async function updateRecord<T = Record<string, unknown>>(
  table: string,
  id: string | null,
  data: Record<string, unknown>,
  queryParams: string = "",
): Promise<T> {
  const path = id ? `/admin/crud/${table}/${id}` : `/admin/crud/${table}`;
  const queryString = queryParams
    ? queryParams.startsWith("?")
      ? queryParams
      : `?${queryParams}`
    : "";

  return adminPatch<T>(`${path}${queryString}`, data);
}

export async function deleteRecord<T = void>(
  table: string,
  id: string | null,
  queryParams: string = "",
): Promise<T> {
  const path = id ? `/admin/crud/${table}/${id}` : `/admin/crud/${table}`;
  const queryString = queryParams
    ? queryParams.startsWith("?")
      ? queryParams
      : `?${queryParams}`
    : "";

  return adminDelete<T>(`${path}${queryString}`);
}

export async function uploadImage(
  file: File,
  folder: string = "mother-india",
): Promise<UploadResult> {
  return uploadImageRaw(file, folder);
}

export async function triggerSystemPing(): Promise<{
  success: boolean;
  data: Record<string, unknown>;
  error?: string;
}> {
  return adminPost<{
    success: boolean;
    data: Record<string, unknown>;
    error?: string;
  }>("/admin/system-status/ping", {});
}
