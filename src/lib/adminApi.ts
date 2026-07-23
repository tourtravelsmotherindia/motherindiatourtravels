import { logger } from "@/lib/logger";

const API_BASE = process.env.NEXT_PUBLIC_API_URL ?? "https://api.motherindiatourtravels.com";

export interface LoginResponse {
  access_token: string;
  refresh_token: string;
}

export interface UploadResponse {
  public_id: string;
  url: string;
  bytes: number;
}

// Token management helpers
export function getAccessToken(): string | null {
  if (typeof window === "undefined") return null;
  return localStorage.getItem("admin_access_token");
}

export function getRefreshToken(): string | null {
  if (typeof window === "undefined") return null;
  return localStorage.getItem("admin_refresh_token");
}

export function setTokens(accessToken: string, refreshToken: string) {
  if (typeof window === "undefined") return;
  localStorage.setItem("admin_access_token", accessToken);
  localStorage.setItem("admin_refresh_token", refreshToken);
}

export function clearTokens() {
  if (typeof window === "undefined") return;
  localStorage.removeItem("admin_access_token");
  localStorage.removeItem("admin_refresh_token");
}

export function isLoggedIn(): boolean {
  return !!getAccessToken();
}

export function logout() {
  clearTokens();
  if (typeof window !== "undefined") {
    window.location.href = "/manage/login/";
  }
}

// Core HTTP fetch wrapper with authorization header injection
async function adminRequest<T>(path: string, options: RequestInit = {}): Promise<T> {
  const token = getAccessToken();

  const headers = new Headers(options.headers || {});
  if (token) {
    headers.set("Authorization", `Bearer ${token}`);
  }

  // Set Content-Type unless it's FormData (which needs browser boundary injection)
  if (!(options.body instanceof FormData) && !headers.has("Content-Type")) {
    headers.set("Content-Type", "application/json");
  }

  let response = await fetch(`${API_BASE}${path}`, {
    ...options,
    headers,
  });

  if (response.status === 401 || response.status === 403) {
    const refreshToken = getRefreshToken();
    if (refreshToken) {
      try {
        const refreshResponse = await fetch(`${API_BASE}/auth/refresh`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ refresh_token: refreshToken }),
        });

        if (refreshResponse.ok) {
          const newTokens = (await refreshResponse.json()) as LoginResponse;
          setTokens(newTokens.access_token, newTokens.refresh_token);

          // Retry request with new token
          headers.set("Authorization", `Bearer ${newTokens.access_token}`);
          response = await fetch(`${API_BASE}${path}`, {
            ...options,
            headers,
          });
        }
      } catch (err) {
        logger.error("AdminApi", "Token auto-refresh failed:", err);
      }
    }

    if (response.status === 401 || response.status === 403) {
      clearTokens();
      // Dispatch a session-expired event so consuming code can handle redirect smoothly.
      // Use a flag to fire only once — avoids competing redirects from parallel requests.
      if (typeof window !== "undefined" && !window.location.pathname.startsWith("/manage/login")) {
        if (!(window as unknown as Record<string, unknown>)._sessionExpiredDispatched) {
          (window as unknown as Record<string, unknown>)._sessionExpiredDispatched = true;
          window.dispatchEvent(new CustomEvent("session-expired"));
          // Reset the flag after a short while so a future real expiry can fire again
          setTimeout(() => {
            delete (window as unknown as Record<string, unknown>)._sessionExpiredDispatched;
          }, 5000);
        }
      }
      throw new Error("Session expired. Please log in again.");
    }
  }

  if (response.status === 204) {
    return {} as T;
  }

  const data = (await response.json()) as Record<string, unknown>;

  if (!response.ok) {
    throw new Error((data.error as string) || `API Request failed with status ${response.status}`);
  }

  return data as T;
}

// REST wrapper methods
export async function adminGet<T>(path: string): Promise<T> {
  return adminRequest<T>(path, { method: "GET" });
}

export async function adminPost<T>(path: string, body: unknown): Promise<T> {
  return adminRequest<T>(path, {
    method: "POST",
    body: JSON.stringify(body),
  });
}

export async function adminPatch<T>(path: string, body: unknown): Promise<T> {
  return adminRequest<T>(path, {
    method: "PATCH",
    body: JSON.stringify(body),
  });
}

export async function adminDelete<T>(path: string): Promise<T> {
  return adminRequest<T>(path, { method: "DELETE" });
}

// CRUD high-level methods for the TABLE_MAP tables
export async function getRecords<T>(table: string, queryParams: string = ""): Promise<T[]> {
  const queryString = queryParams
    ? queryParams.startsWith("?")
      ? queryParams
      : `?${queryParams}`
    : "";
  return adminGet<T[]>(`/admin/crud/${table}${queryString}`);
}

export async function getRecord<T>(table: string, id: string): Promise<T> {
  return adminGet<T>(`/admin/crud/${table}/${id}`);
}

export async function createRecord<T>(table: string, data: Record<string, unknown>): Promise<T> {
  return adminPost<T>(`/admin/crud/${table}`, data);
}

export async function updateRecord<T>(
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

  return adminRequest<T>(`${path}${queryString}`, {
    method: "PATCH",
    body: JSON.stringify(data),
  });
}

export async function deleteRecord<T>(
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

  return adminRequest<T>(`${path}${queryString}`, {
    method: "DELETE",
  });
}

// Image upload helper
export async function uploadImage(
  file: File,
  folder: string = "mother-india",
): Promise<UploadResponse> {
  const formData = new FormData();
  formData.append("file", file);
  formData.append("folder", folder);

  return adminRequest<UploadResponse>("/upload", {
    method: "POST",
    body: formData,
  });
}
