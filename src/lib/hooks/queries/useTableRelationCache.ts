/**
 * Hook that fetches relation labels for all select fields in a table config.
 *
 * Uses parallel fetchRequests to minimize the loading window. Returns an
 * `isLoading` flag so consumers can show a placeholder instead of raw IDs
 * while relation data is being resolved.
 */

import { useEffect, useState } from "react";

import type { FieldConfig } from "@/lib/adminSchema";
import { fetchRecords } from "@/lib/apiClient";

export function useTableRelationCache(
  fields: FieldConfig[],
  table: string, // dependency trigger — refetches when table changes
) {
  const [relationCache, setRelationCache] = useState<Record<string, Record<string, string>>>({});
  const hasRelations = fields.filter((f) => f.type === "select" && f.relation).length > 0;
  const [isLoading, setIsLoading] = useState(hasRelations);

  useEffect(() => {
    const relationFields = fields.filter((f) => f.type === "select" && f.relation);
    if (relationFields.length === 0) {
      return;
    }

    let cancelled = false;

    const fetchAll = async () => {
      // Fetch all relation tables in parallel (Promise.all instead of sequential for...of)
      const results = await Promise.allSettled(
        relationFields.map(async (field) => {
          const rel = field.relation!;
          const relRecords = await fetchRecords<Record<string, unknown>>(rel.table);

          // Special handling: package-variants prefix with package name
          const packagesMap: Record<string, string> = {};
          if (rel.table === "package-variants") {
            try {
              const packages = await fetchRecords<Record<string, unknown>>("packages");
              packages.forEach((pkg) => {
                packagesMap[String(pkg.id)] = String(pkg.name);
              });
            } catch {
              // Non-critical
            }
          }

          const fieldCache: Record<string, string> = {};
          relRecords.forEach((rec) => {
            const key = String(rec[rel.valueField] || rec.id);
            let label = String(rec[rel.labelField] || rec.id || "Unnamed");
            if (rel.table === "package-variants") {
              const packageId = String((rec as Record<string, unknown>).packageId || "");
              const packageName = packagesMap[packageId] || "Unknown Package";
              label = `${packageName} - ${label}`;
            }
            fieldCache[key] = label;
          });

          return { fieldName: field.name, fieldCache };
        }),
      );

      if (cancelled) return;

      const cache: Record<string, Record<string, string>> = {};
      results.forEach((result) => {
        if (result.status === "fulfilled") {
          cache[result.value.fieldName] = result.value.fieldCache;
        }
      });

      setRelationCache((prev) => ({ ...prev, ...cache }));
      setIsLoading(false);
    };

    fetchAll();

    return () => {
      cancelled = true;
    };
  }, [fields, table]);

  return { relationCache, isLoading };
}
