/**
 * React Query hook for relation dropdown options.
 *
 * Fetches all records from a related table and maps them into {label, value}
 * objects suitable for the Dropdown component. Results are cached separately
 * per (relationTable, fieldName) combination.
 */

import { useQuery } from "@tanstack/react-query";

import { fetchRecords } from "@/lib/apiClient";

import { queryKeys } from "./queryKeys";

interface RelationOption {
  label: string;
  value: string | number | boolean;
}

export function useRelationOptions(
  relationTable: string,
  labelField: string,
  valueField: string,
  fieldName: string,
) {
  return useQuery({
    queryKey: queryKeys.relationOptions(relationTable, fieldName),
    queryFn: async () => {
      const records = await fetchRecords<Record<string, unknown>>(relationTable);

      // Special handling for package-variants: prefix with package name
      const packagesMap: Record<string, string> = {};
      if (relationTable === "package-variants") {
        try {
          const packages = await fetchRecords<Record<string, unknown>>("packages");
          packages.forEach((pkg) => {
            packagesMap[String(pkg.id)] = String(pkg.name);
          });
        } catch {
          // Non-critical — labels will just lack the prefix
        }
      }

      return records.map((rec): RelationOption => {
        let label = String(rec[labelField] || rec.id || "Unnamed");
        if (relationTable === "package-variants") {
          const packageId = String((rec as Record<string, unknown>).packageId || "");
          const packageName = packagesMap[packageId] || "Unknown Package";
          label = `${packageName} - ${label}`;
        }
        return {
          label,
          value: (rec[valueField] || rec.id) as string | number | boolean,
        };
      });
    },
    staleTime: 5 * 60 * 1000, // Relation lists rarely change during a session
  });
}
