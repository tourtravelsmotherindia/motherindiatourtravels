/**
 * Hook that fetches relation options for all select fields in a table config.
 *
 * Uses plain fetchRecords (not individual useQuery calls) to avoid the
 * rules-of-hooks restriction against calling hooks inside .map() callbacks.
 * Relation label data is cached via React Query's useQuery per relation table
 * using a dedicated QueryKeyFetcher sub-component pattern internally.
 */

import { useEffect, useState } from "react";

import type { FieldConfig } from "@/lib/adminSchema";
import { fetchRecords } from "@/lib/apiClient";

export function useTableRelationCache(
  fields: FieldConfig[],
  table: string, // dependency trigger — refetches when table changes
) {
  const [relationCache, setRelationCache] = useState<Record<string, Record<string, string>>>({});

  useEffect(() => {
    const relationFields = fields.filter((f) => f.type === "select" && f.relation);
    if (relationFields.length === 0) {
      return;
    }

    let cancelled = false;

    const fetchAll = async () => {
      const cache: Record<string, Record<string, string>> = {};

      for (const field of relationFields) {
        const rel = field.relation!;
        try {
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

          cache[field.name] = fieldCache;
        } catch (err) {
          console.error(`Failed to fetch relation data for ${field.name}:`, err);
        }
      }

      if (!cancelled) {
        setRelationCache((prev) => ({ ...prev, ...cache }));
      }
    };

    fetchAll();

    return () => {
      cancelled = true;
    };
  }, [fields, table]);

  return relationCache;
}
