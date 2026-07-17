"use client";

import { AnimatePresence } from "framer-motion";
import {
  AlertTriangle,
  ChevronLeft,
  ChevronRight,
  Edit2,
  Loader2,
  Plus,
  Search,
  Trash2,
} from "lucide-react";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import React, { useEffect, useState } from "react";

import AdminFormDrawer from "@/components/manage/AdminFormDrawer";
import EmptyState from "@/components/manage/EmptyState";
import ErrorState from "@/components/manage/ErrorState";
import LoadingState from "@/components/manage/LoadingState";
import Dropdown from "@/components/ui/Dropdown";
import { useToast } from "@/context/ToastContext";
import { ADMIN_TABLES, getSingularLabel } from "@/lib/adminSchema";
import { useDeleteRecord } from "@/lib/hooks/mutations";
import { useRecords, useTableRelationCache } from "@/lib/hooks/queries";
import { formatLocalDateTime } from "@/lib/manage/dateUtils";

interface CrudClientProps {
  table: string;
}

export default function CrudClient({ table }: CrudClientProps) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const pathname = usePathname();
  const { showToast } = useToast();

  const tableConfig = ADMIN_TABLES[table];

  // URL action parameters
  const action = searchParams.get("action");
  const editId = searchParams.get("id");

  // Local UI state (ephemeral, per-table-instance)
  const [searchTerm, setSearchTerm] = useState<string>("");
  const [currentPage, setCurrentPage] = useState<number>(1);
  const [deletingId, setDeletingId] = useState<string | null>(null);
  const [mounted, setMounted] = useState<boolean>(false);
  const [sortBy, setSortBy] = useState<string>("newest");
  const [filters, setFilters] = useState<Record<string, string>>({});

  // React Query: fetch table records
  const {
    data: records = [],
    isLoading: loading,
    isError,
    error,
    refetch,
  } = useRecords<Record<string, unknown>>(table);

  // React Query: delete mutation
  const deleteMutation = useDeleteRecord(table);

  // Hydration guard
  useEffect(() => {
    setTimeout(() => setMounted(true), 0);
  }, []);

  // Fetch relation options for select fields (uses useEffect internally to avoid hook-in-loop)
  const { relationCache, isLoading: relationCacheLoading } = useTableRelationCache(
    tableConfig?.fields || [],
    table,
  );

  // Determine filterable fields (boolean or select fields)
  const filterableFields = React.useMemo(() => {
    return (tableConfig?.fields || []).filter((f) => f.type === "boolean" || f.type === "select");
  }, [tableConfig]);

  // Determine if alphabetical sorting is possible
  const nameField = React.useMemo(() => {
    return (tableConfig?.fields || []).find((f) => ["name", "title", "label"].includes(f.name));
  }, [tableConfig]);

  // Search & filtering (client-side)
  const filteredRecords = React.useMemo(() => {
    if (!tableConfig) return [];
    return records.filter((rec) => {
      // 1. Search term match
      let matchesSearch = true;
      if (searchTerm.trim()) {
        if (tableConfig.searchField) {
          const val = rec[tableConfig.searchField];
          matchesSearch = String(val || "")
            .toLowerCase()
            .includes(searchTerm.toLowerCase());
        } else {
          matchesSearch = Object.values(rec).some((val) =>
            String(val || "")
              .toLowerCase()
              .includes(searchTerm.toLowerCase()),
          );
        }
      }

      // 2. Dynamic filter match
      const matchesFilters = Object.entries(filters).every(([fieldName, filterValue]) => {
        if (!filterValue || filterValue === "ALL") return true;
        const val = rec[fieldName];
        const fieldConfig = tableConfig.fields.find((f) => f.name === fieldName);
        if (fieldConfig?.type === "boolean") {
          return !!val === (filterValue === "true");
        }
        return String(val ?? "") === String(filterValue);
      });

      return matchesSearch && matchesFilters;
    });
  }, [records, searchTerm, filters, tableConfig]);

  // Sorting
  const sortedRecords = React.useMemo(() => {
    if (!tableConfig) return [];
    const list = [...filteredRecords];
    list.sort((a, b) => {
      const dateA = (a.createdAt || a.created_at || a.updatedAt || a.updated_at) as string | number | Date | undefined;
      const dateB = (b.createdAt || b.created_at || b.updatedAt || b.updated_at) as string | number | Date | undefined;

      if (sortBy === "newest") {
        if (dateA && dateB) {
          return new Date(dateB).getTime() - new Date(dateA).getTime();
        }
        return String(b.id || "").localeCompare(String(a.id || ""));
      }

      if (sortBy === "oldest") {
        if (dateA && dateB) {
          return new Date(dateA).getTime() - new Date(dateB).getTime();
        }
        return String(a.id || "").localeCompare(String(b.id || ""));
      }

      if (sortBy === "alpha-asc" && nameField) {
        return String(a[nameField.name] || "").localeCompare(String(b[nameField.name] || ""));
      }

      if (sortBy === "alpha-desc" && nameField) {
        return String(b[nameField.name] || "").localeCompare(String(a[nameField.name] || ""));
      }

      return 0;
    });
    return list;
  }, [filteredRecords, sortBy, nameField, tableConfig]);

  // Pagination
  const itemsPerPage = 12;
  const totalPages = Math.ceil(sortedRecords.length / itemsPerPage);
  const paginatedRecords = sortedRecords.slice(
    (currentPage - 1) * itemsPerPage,
    currentPage * itemsPerPage,
  );

  // Not in schema
  if (!tableConfig) {
    return (
      <div className="bg-black rounded-2xl border border-neutral-800 p-12 text-center text-white">
        <AlertTriangle className="w-10 h-10 text-amber-400 mx-auto mb-4 animate-pulse" />
        <h2 className="text-base font-bold font-display text-white">Table Not Supported</h2>
        <p className="text-sm text-neutral-400 mt-2">
          The table &ldquo;{table}&rdquo; is not configured in the schema system.
        </p>
        <button
          onClick={() => router.push("/manage/")}
          className="mt-6 px-6 py-2.5 bg-brand hover:bg-brand-hover text-white rounded-full font-semibold text-sm transition-all cursor-pointer"
        >
          Return to Dashboard
        </button>
      </div>
    );
  }

  // Action handlers
  const handleAddNew = () => {
    router.push(`${pathname}?action=new`);
  };

  const handleEdit = (id: string) => {
    router.push(`${pathname}?action=edit&id=${id}`);
  };

  const handleDeleteTrigger = (rec: Record<string, unknown>) => {
    if (tableConfig.compositeKeys) {
      const keys = tableConfig.compositeKeys.map((k) => `${k}=eq.${rec[k]}`).join("&");
      setDeletingId(keys);
    } else {
      setDeletingId(rec.id as string);
    }
    router.push(`${pathname}?action=delete`);
  };

  const handleConfirmDelete = async () => {
    if (!deletingId) return;

    try {
      if (tableConfig.compositeKeys) {
        await deleteMutation.mutateAsync({ id: null, queryParams: deletingId });
      } else {
        await deleteMutation.mutateAsync({ id: deletingId, queryParams: "" });
      }
      showToast("success", "Record Deleted", "The record has been permanently removed.");
      router.push(pathname);
      setDeletingId(null);
    } catch (err: unknown) {
      const errorMessage = err instanceof Error ? err.message : "Failed to delete record";
      showToast("error", "Delete Failed", errorMessage);
    }
  };

  // Cell renderer
  const renderCellContent = (colName: string, value: unknown) => {
    const field = tableConfig.fields.find((f) => f.name === colName);
    if (!field) return String(value ?? "");

    if (value === null || value === undefined) return "-";

    // Boolean
    if (field.type === "boolean") {
      return value ? (
        <span className="inline-flex items-center gap-1 text-[10px] font-semibold text-emerald-600">
          <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0" />
          {field.trueLabel || "Active"}
        </span>
      ) : (
        <span className="inline-flex items-center gap-1 text-[10px] font-semibold text-neutral-500">
          <span className="w-1.5 h-1.5 rounded-full bg-neutral-400 shrink-0" />
          {field.falseLabel || "Inactive"}
        </span>
      );
    }

    // Select relation display (uses cached relation options)
    if (field.type === "select" && field.relation) {
      const cache = relationCache[field.name];
      const key = String(value);
      if (!cache && relationCacheLoading) {
        return (
          <span className="text-neutral-300 text-[10px] animate-pulse select-none">&hellip;</span>
        );
      }
      return cache ? cache[key] || key : key;
    }

    // Select static enum
    if (field.type === "select" && field.options) {
      const option = field.options.find((opt) => opt.value === value);
      return option ? option.label : String(value);
    }

    // Image thumbnail
    if (field.type === "image") {
      const src = String(value);
      return src ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={src}
          alt="Thumbnail"
          className="w-10 h-10 object-cover rounded-lg border border-border-light bg-neutral-100"
        />
      ) : (
        <div className="w-10 h-10 rounded-lg border border-border-light bg-neutral-50 flex items-center justify-center text-neutral-300">
          -
        </div>
      );
    }

    // Array of strings (tags)
    if (field.type === "array-string" && Array.isArray(value)) {
      const list = value as string[];
      return (
        <div className="flex flex-wrap gap-1 max-w-[200px]">
          {list.slice(0, 3).map((item, idx) => (
            <span
              key={idx}
              className="px-2 py-0.5 bg-neutral-100 text-neutral-600 font-semibold text-[10px] rounded-md border border-neutral-200"
            >
              {item}
            </span>
          ))}
          {list.length > 3 && (
            <span className="text-[9px] text-neutral-400 font-bold self-center">
              +{list.length - 3} more
            </span>
          )}
        </div>
      );
    }

    // Datetime
    if (field.type === "datetime") {
      return (
        <span suppressHydrationWarning>
          {mounted ? formatLocalDateTime(value as string | Date | number) : "..."}
        </span>
      );
    }

    return String(value);
  };

  return (
    <div className="space-y-4 animate-in fade-in duration-300">
      {/* Search & Actions Toolbar */}
      {(!tableConfig.disableSearch ||
        !tableConfig.disableCreate ||
        filterableFields.length > 0 ||
        nameField) && (
        <div className="bg-black rounded-2xl border border-neutral-800 p-4 flex flex-col gap-4 text-white">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
            {!tableConfig.disableSearch ? (
              <div className="relative max-w-sm w-full">
                <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-neutral-500">
                  <Search className="w-3.5 h-3.5" />
                </div>
                <input
                  type="text"
                  placeholder={
                    tableConfig.searchField
                      ? `Search by ${tableConfig.searchField}...`
                      : "Search records..."
                  }
                  value={searchTerm}
                  onChange={(e) => {
                    setSearchTerm(e.target.value);
                    setCurrentPage(1);
                  }}
                  className="w-full rounded-full border border-neutral-850 pl-10 pr-5 py-2.5 text-xs focus:border-brand/45 focus:outline-none transition-colors bg-neutral-950 placeholder:text-neutral-500 text-neutral-200"
                />
              </div>
            ) : (
              <div />
            )}

            {!tableConfig.disableCreate && (
              <button
                onClick={handleAddNew}
                className="flex items-center justify-center gap-1.5 rounded-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs py-2.5 px-5 transition-all cursor-pointer shadow-premium shrink-0"
              >
                <Plus className="w-3.5 h-3.5" />
                <span>Add {getSingularLabel(tableConfig.label)}</span>
              </button>
            )}
          </div>

          {/* Filters & Sorting Sub-Row */}
          {(filterableFields.length > 0 || nameField) && (
            <div className="flex flex-wrap items-center gap-3 pt-3 border-t border-neutral-900">
              {/* Dynamic Filter Dropdowns */}
              {filterableFields.map((field) => {
                let options = [];
                if (field.type === "boolean") {
                  options = [
                    { value: "ALL", label: `All ${field.label}` },
                    { value: "true", label: field.trueLabel || "Yes" },
                    { value: "false", label: field.falseLabel || "No" },
                  ];
                } else {
                  const isRelation = !!field.relation;
                  const rawOpts = isRelation
                    ? Object.entries(relationCache[field.name] || {}).map(([id, label]) => ({
                        value: id,
                        label,
                      }))
                    : (field.options || []).map((o) => ({
                        value: String(o.value),
                        label: o.label,
                      }));

                  options = [{ value: "ALL", label: `All ${field.label}s` }, ...rawOpts];
                }

                const currentValue = filters[field.name] || "ALL";

                return (
                  <div key={field.name} className="w-full sm:w-auto">
                    <Dropdown
                      options={options}
                      value={currentValue}
                      onChange={(val) => {
                        setFilters((prev) => ({ ...prev, [field.name]: val }));
                        setCurrentPage(1);
                      }}
                      placeholder={`Filter by ${field.label}`}
                      className="w-full sm:w-48"
                      triggerClassName="w-full text-left font-semibold text-xs py-2 px-4 h-9 bg-neutral-950 border border-neutral-850 text-neutral-300 hover:text-white"
                      menuClassName="w-full sm:w-56"
                      theme="dark"
                    />
                  </div>
                );
              })}

              {/* Dynamic Sort Dropdown */}
              <div className="w-full sm:w-auto">
                <Dropdown
                  options={[
                    { value: "newest", label: "Sort: Newest" },
                    { value: "oldest", label: "Sort: Oldest" },
                    ...(nameField
                      ? [
                          { value: "alpha-asc", label: `Sort: A-Z` },
                          { value: "alpha-desc", label: `Sort: Z-A` },
                        ]
                      : []),
                  ]}
                  value={sortBy}
                  onChange={(val) => setSortBy(val)}
                  className="w-full sm:w-44"
                  triggerClassName="w-full text-left font-semibold text-xs py-2 px-4 h-9 bg-neutral-950 border border-neutral-850 text-neutral-300 hover:text-white"
                  menuClassName="w-full sm:w-48"
                  theme="dark"
                />
              </div>

              {/* Clear Filters Link/Button */}
              {Object.values(filters).some((v) => v && v !== "ALL") && (
                <button
                  onClick={() => {
                    setFilters({});
                    setCurrentPage(1);
                  }}
                  className="text-xs font-semibold text-neutral-400 hover:text-white hover:bg-neutral-900 border border-neutral-800 rounded-full px-4 py-2 transition-all cursor-pointer h-9 shrink-0"
                >
                  Clear Filters
                </button>
              )}
            </div>
          )}
        </div>
      )}

      {/* Main Table Browser */}
      <div className="bg-black rounded-2xl border border-neutral-800 overflow-hidden text-white">
        {loading ? (
          <LoadingState message="Syncing tables with database..." />
        ) : isError ? (
          <ErrorState
            message={error instanceof Error ? error.message : "Failed to load records"}
            onRetry={() => refetch()}
          />
        ) : sortedRecords.length === 0 ? (
          <EmptyState />
        ) : (
          <div className="flex flex-col">
            <div className="overflow-x-auto no-scrollbar">
              <table className="w-full text-left border-collapse text-xs bg-black">
                <thead>
                  <tr className="border-b border-neutral-900 text-neutral-400 uppercase tracking-wider font-bold text-[10px]">
                    {tableConfig.displayColumns.map((col) => {
                      const f = tableConfig.fields.find((field) => field.name === col);
                      return (
                        <th key={col} className="py-3 px-6 font-semibold">
                          {f ? f.label : col}
                        </th>
                      );
                    })}
                    <th className="py-3 px-6 font-semibold text-right">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-neutral-900/60 text-neutral-300 font-medium">
                  {paginatedRecords.map((rec) => {
                    const rowKey = (
                      tableConfig.compositeKeys
                        ? tableConfig.compositeKeys.map((k) => rec[k]).join("-")
                        : rec.id
                    ) as string;

                    return (
                      <tr
                        key={rowKey}
                        className="border-b border-neutral-900/60 hover:bg-neutral-900/30 transition-colors"
                      >
                        {tableConfig.displayColumns.map((col) => (
                          <td key={col} className="py-3.5 px-6 truncate max-w-[220px]">
                            {renderCellContent(col, rec[col])}
                          </td>
                        ))}
                        <td className="py-3.5 px-6 text-right space-x-1.5 flex items-center justify-end h-full">
                          {!tableConfig.disableUpdate && (
                            <button
                              onClick={() => handleEdit((rec.id as string) || rowKey)}
                              title="Edit Record"
                              className="p-1.5 rounded-lg border border-neutral-800 hover:border-brand/40 hover:bg-neutral-900/50 text-neutral-400 hover:text-brand transition-all cursor-pointer"
                            >
                              <Edit2 className="w-3 h-3" />
                            </button>
                          )}
                          {!tableConfig.disableDelete && (
                            <button
                              onClick={() => handleDeleteTrigger(rec)}
                              title="Delete Record"
                              className="p-1.5 rounded-lg border border-neutral-800 hover:border-red-500/40 hover:bg-red-950/20 text-neutral-400 hover:text-red-500 transition-all cursor-pointer"
                            >
                              <Trash2 className="w-3 h-3" />
                            </button>
                          )}
                          {tableConfig.disableUpdate && tableConfig.disableDelete && (
                            <span className="text-[10px] text-neutral-500 font-medium italic select-none">
                              Read-only
                            </span>
                          )}
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>

            {/* Pagination */}
            {totalPages > 1 && (
              <div className="border-t border-neutral-900 px-6 py-3.5 flex items-center justify-between bg-black text-neutral-400">
                <span className="text-[10px] text-neutral-500 font-medium">
                  Showing {(currentPage - 1) * itemsPerPage + 1} to{" "}
                  {Math.min(currentPage * itemsPerPage, sortedRecords.length)} of{" "}
                  {sortedRecords.length} records
                </span>

                <div className="flex items-center gap-1">
                  <button
                    disabled={currentPage === 1}
                    onClick={() => setCurrentPage((p) => p - 1)}
                    className="p-1.5 rounded-lg border border-neutral-800 hover:bg-neutral-900 text-neutral-400 transition-colors disabled:opacity-40 disabled:cursor-not-allowed cursor-pointer"
                  >
                    <ChevronLeft className="w-3.5 h-3.5 text-neutral-500" />
                  </button>

                  {Array.from({ length: totalPages }).map((_, idx) => {
                    const pageNum = idx + 1;
                    const isCurrent = currentPage === pageNum;
                    return (
                      <button
                        key={pageNum}
                        onClick={() => setCurrentPage(pageNum)}
                        className={`w-7 h-7 rounded-lg text-[10px] font-bold transition-all cursor-pointer ${
                          isCurrent
                            ? "bg-brand text-white shadow-[0_1px_4px_rgba(0,0,0,0.1)]"
                            : "bg-black border border-neutral-800 hover:bg-neutral-900 text-neutral-400"
                        }`}
                      >
                        {pageNum}
                      </button>
                    );
                  })}

                  <button
                    disabled={currentPage === totalPages}
                    onClick={() => setCurrentPage((p) => p + 1)}
                    className="p-1.5 rounded-lg border border-neutral-800 hover:bg-neutral-900 transition-colors disabled:opacity-40 disabled:cursor-not-allowed cursor-pointer"
                  >
                    <ChevronRight className="w-3.5 h-3.5 text-neutral-500" />
                  </button>
                </div>
              </div>
            )}
          </div>
        )}
      </div>

      {/* Slide-over Form Drawer (Create / Edit) */}
      <AnimatePresence>
        {(action === "new" || (action === "edit" && editId)) && (
          <AdminFormDrawer
            key={table + (editId || "new")}
            table={table}
            recordId={action === "edit" ? editId : null}
            onClose={() => router.push(pathname)}
            onSaved={() => {
              refetch();
              router.push(pathname);
            }}
          />
        )}
      </AnimatePresence>

      {/* Delete Confirmation Dialog */}
      {action === "delete" && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          <div
            className="fixed inset-0 bg-neutral-950/60 backdrop-blur-xs transition-opacity"
            onClick={() => {
              setDeletingId(null);
              router.push(pathname);
            }}
          />

          <div className="bg-black rounded-[2rem] border border-neutral-800 text-white max-w-sm w-full p-6 text-center z-10 animate-in zoom-in-95 duration-200">
            <div className="w-12 h-12 rounded-full bg-red-950/20 text-red-500 flex items-center justify-center mx-auto mb-4 border border-red-900/30">
              <AlertTriangle className="w-5 h-5 animate-bounce" />
            </div>

            <h3 className="font-display font-bold text-base text-white">Confirm Delete Record?</h3>

            <p className="text-xs text-neutral-400 mt-2 font-medium leading-relaxed">
              Are you sure you want to permanently delete this{" "}
              {getSingularLabel(tableConfig.label).toLowerCase()} entry? This action is
              irreversible.
            </p>

            <div className="flex items-center gap-3 mt-6">
              <button
                onClick={() => {
                  setDeletingId(null);
                  router.push(pathname);
                }}
                disabled={deleteMutation.isPending}
                className="flex-1 px-4 py-2.5 text-xs font-semibold border border-neutral-800 hover:bg-neutral-900 rounded-full text-neutral-400 transition-colors cursor-pointer"
              >
                Cancel
              </button>
              <button
                onClick={handleConfirmDelete}
                disabled={deleteMutation.isPending}
                className="flex-1 px-4 py-2.5 text-xs font-semibold bg-red-600 hover:bg-red-700 text-white rounded-full transition-all shadow-sm flex items-center justify-center gap-1.5 disabled:opacity-50 cursor-pointer"
              >
                {deleteMutation.isPending ? (
                  <>
                    <Loader2 className="w-3.5 h-3.5 animate-spin" />
                    <span>Deleting...</span>
                  </>
                ) : (
                  <span>Delete Entry</span>
                )}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
