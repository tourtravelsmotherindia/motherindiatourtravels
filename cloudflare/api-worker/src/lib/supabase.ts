/**
 * Minimal Supabase REST client for Cloudflare Workers.
 * Uses PostgREST syntax via native fetch — no Node.js SDK required.
 */
export function createSupabaseClient(supabaseUrl: string, secretKey: string) {
  const base = `${supabaseUrl}/rest/v1`;
  const authUrl = `${supabaseUrl}/auth/v1`;

  const headers = {
    apikey: secretKey,
    Authorization: `Bearer ${secretKey}`,
    "Content-Type": "application/json",
    Prefer: "return=representation",
  };

  return {
    /**
     * SELECT rows from a table with optional PostgREST filters.
     * @example from('Package').select('id,name,slug').eq('isPopular', 'true').get()
     */
    from(table: string) {
      const url = `${base}/${table}`;
      const params = new URLSearchParams();

      const builder = {
        select(cols = "*") {
          params.set("select", cols);
          return builder;
        },
        eq(col: string, val: string | number | boolean) {
          params.set(col, `eq.${val}`);
          return builder;
        },
        neq(col: string, val: string | number | boolean) {
          params.set(col, `neq.${val}`);
          return builder;
        },
        order(col: string, ascending = true) {
          params.set("order", `${col}.${ascending ? "asc" : "desc"}`);
          return builder;
        },
        limit(n: number) {
          params.set("limit", String(n));
          return builder;
        },
        range(_from: number, _to: number) {
          // PostgREST uses Range header for pagination
          return builder;
        },
        async get<T = unknown>(): Promise<T[]> {
          const qs = params.toString();
          const res = await fetch(`${url}${qs ? "?" + qs : ""}`, {
            headers: { ...headers, Prefer: "return=representation" },
          });
          if (!res.ok) {
            const err = await res.text();
            throw new Error(`Supabase GET ${table}: ${res.status} ${err}`);
          }
          return res.json() as Promise<T[]>;
        },
        async getOne<T = unknown>(): Promise<T | null> {
          const rows = await builder.get<T>();
          return rows[0] ?? null;
        },
        async insert<T = unknown>(body: Record<string, unknown>): Promise<T> {
          const qs = params.toString();
          const res = await fetch(`${url}${qs ? "?" + qs : ""}`, {
            method: "POST",
            headers,
            body: JSON.stringify(body),
          });
          if (!res.ok) {
            const err = await res.text();
            throw new Error(`Supabase INSERT ${table}: ${res.status} ${err}`);
          }
          const rows = (await res.json()) as T[];
          return rows[0];
        },
        async update<T = unknown>(id: string, body: Record<string, unknown>): Promise<T> {
          const res = await fetch(`${url}?id=eq.${id}`, {
            method: "PATCH",
            headers,
            body: JSON.stringify(body),
          });
          if (!res.ok) {
            const err = await res.text();
            throw new Error(`Supabase UPDATE ${table} id=${id}: ${res.status} ${err}`);
          }
          const rows = (await res.json()) as T[];
          return rows[0];
        },
        async delete(id: string): Promise<void> {
          const res = await fetch(`${url}?id=eq.${id}`, {
            method: "DELETE",
            headers: { ...headers, Prefer: "return=minimal" },
          });
          if (!res.ok) {
            const err = await res.text();
            throw new Error(`Supabase DELETE ${table} id=${id}: ${res.status} ${err}`);
          }
        },
        async upsert<T = unknown>(body: Record<string, unknown>, onConflict: string): Promise<T> {
          const res = await fetch(`${url}?on_conflict=${onConflict}`, {
            method: "POST",
            headers: {
              ...headers,
              Prefer: "resolution=merge-duplicates,return=representation",
            },
            body: JSON.stringify(body),
          });
          if (!res.ok) {
            const err = await res.text();
            throw new Error(`Supabase UPSERT ${table}: ${res.status} ${err}`);
          }
          const rows = (await res.json()) as T[];
          return rows[0];
        },
      };

      return builder;
    },

    /**
     * Verify a Supabase JWT by calling the Auth /user endpoint.
     * Returns the user object on success, null if invalid.
     */
    async verifyToken(token: string): Promise<{ id: string; email: string } | null> {
      try {
        const res = await fetch(`${authUrl}/user`, {
          headers: {
            apikey: serviceKey,
            Authorization: `Bearer ${token}`,
          },
        });
        if (!res.ok) return null;
        const user = (await res.json()) as { id: string; email: string };
        return user;
      } catch {
        return null;
      }
    },

    /**
     * Sign in with email + password via Supabase Auth.
     * Returns access_token + refresh_token on success.
     */
    async signIn(
      email: string,
      password: string,
    ): Promise<{ access_token: string; refresh_token: string } | null> {
      try {
        const res = await fetch(`${authUrl}/token?grant_type=password`, {
          method: "POST",
          headers: {
            apikey: serviceKey,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ email, password }),
        });
        if (!res.ok) return null;
        return res.json() as Promise<{ access_token: string; refresh_token: string }>;
      } catch {
        return null;
      }
    },
  };
}

export type SupabaseClient = ReturnType<typeof createSupabaseClient>;
