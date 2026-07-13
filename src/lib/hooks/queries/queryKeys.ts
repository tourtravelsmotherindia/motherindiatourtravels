/**
 * React Query hook keys for the admin panel.
 *
 * Centralising keys here makes invalidation predictable and prevents
 * magic-string drift across query/mutation hooks.
 *
 * Naming convention: ["resource", ...scope]
 *   - ["records", table]            — list of records for a table
 *   - ["record", table, id]         — single record
 *   - ["dashboard-metrics"]         — dashboard overview metrics
 *   - ["system-status", "latest"]   — latest system status snapshot
 *   - ["system-status", "logs"]     — diagnostic log history
 *   - ["relation-options", table, field] — dropdown options for a relation field
 */

export const queryKeys = {
  /** All records of a given table (with optional query params) */
  records: (table: string, queryParams?: string) => ["records", table, queryParams] as const,

  /** Single record by table + id */
  record: (table: string, id: string) => ["record", table, id] as const,

  /** Dashboard overview metrics (bookings/packages/blogs/contacts counts) */
  dashboardMetrics: () => ["dashboard-metrics"] as const,

  /** Latest system status snapshot */
  systemStatusLatest: () => ["system-status", "latest"] as const,

  /** System status diagnostic logs */
  systemStatusLogs: () => ["system-status", "logs"] as const,

  /** Relation dropdown options for a specific field on a table */
  relationOptions: (table: string, fieldName: string) =>
    ["relation-options", table, fieldName] as const,
} as const;
