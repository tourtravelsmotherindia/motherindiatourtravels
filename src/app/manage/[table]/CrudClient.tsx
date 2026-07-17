"use client";

import { AnimatePresence } from "framer-motion";
import {
  AlertTriangle,
  ChevronDown,
  ChevronLeft,
  ChevronRight,
  ChevronsUpDown,
  ChevronUp,
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

  // Sorting state
  const [sortBy, setSortBy] = useState<string | null>(null);
  const [sortOrder, setSortOrder] = useState<"asc" | "desc">("asc");

  // Filtering state
  const [filters, setFilters] = useState<Record<string, string>>({});

  // Filterable fields helper
  const filterableFields = React.useMemo(() => {
    return (tableConfig?.fields || []).filter(
      (f) =>
        (tableConfig?.displayColumns || []).includes(f.name) &&
        (f.type === "select" || f.type === "boolean"),
    );
  }, [tableConfig]);

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

  // Search & filtering (client-side)
  const filteredRecords = React.useMemo(() => {
    return records.filter((rec) => {
      // 1. Search term check
      if (searchTerm.trim()) {
        const matchesSearch = tableConfig?.searchField
          ? String(rec[tableConfig.searchField] || "")
              .toLowerCase()
              .includes(searchTerm.toLowerCase())
          : Object.values(rec).some((val) =>
              String(val || "")
                .toLowerCase()
                .includes(searchTerm.toLowerCase()),
            );
        if (!matchesSearch) return false;
      }

      // 2. Active filters check
      for (const [key, filterVal] of Object.entries(filters)) {
        if (!filterVal) continue; // Empty value means 'All'

        const field = tableConfig?.fields.find((f) => f.name === key);
        const recVal = rec[key];

        if (field?.type === "boolean") {
          const isTrue = filterVal === "true";
          if (!!recVal !== isTrue) return false;
        } else {
          // Compare strings/numbers/enums
          if (String(recVal ?? "") !== filterVal) return false;
        }
      }

      return true;
    });
  }, [records, searchTerm, filters, tableConfig]);

  // Client-side sorting
  const sortedRecords = React.useMemo(() => {
    if (!sortBy) return filteredRecords;

    return [...filteredRecords].sort((a, b) => {
      const field = tableConfig?.fields.find((f) => f.name === sortBy);
      const valA = a[sortBy];
      const valB = b[sortBy];

      if (valA === null || valA === undefined) return 1;
      if (valB === null || valB === undefined) return -1;

      if (field?.type === "number") {
        return sortOrder === "asc" ? Number(valA) - Number(valB) : Number(valB) - Number(valA);
      }

      if (field?.type === "datetime") {
        const timeA = new Date(valA as string | number).getTime();
        const timeB = new Date(valB as string | number).getTime();
        return sortOrder === "asc" ? timeA - timeB : timeB - timeA;
      }

      // Default string sorting
      const strA = String(valA).toLowerCase();
      const strB = String(valB).toLowerCase();
      if (strA < strB) return sortOrder === "asc" ? -1 : 1;
      if (strA > strB) return sortOrder === "asc" ? 1 : -1;
      return 0;
    });
  }, [filteredRecords, sortBy, sortOrder, tableConfig]);

  // Not in schema
  if (!tableConfig) {
    return (
      <div className="bg-white rounded-2xl border border-neutral-100 p-12 text-center shadow-[0_1px_4px_rgba(0,0,0,0.04)]">
        <AlertTriangle className="w-10 h-10 text-amber-400 mx-auto mb-4" />
        <h2 className="text-base font-bold font-display text-neutral-800">Table Not Supported</h2>
        <p className="text-sm text-neutral-400 mt-2">
          The table &ldquo;{table}&rdquo; is not configured in the schema system.
        </p>
        <button
          onClick={() => router.push("/manage/")}
          className="mt-6 px-6 py-2.5 bg-brand hover:bg-brand-hover text-white rounded-full font-semibold text-sm transition-all"
        >
          Return to Dashboard
        </button>
      </div>
    );
  }

  // Pagination
  const itemsPerPage = 12;
  const totalPages = Math.ceil(filteredRecords.length / itemsPerPage);
  const paginatedRecords = sortedRecords.slice(
    (currentPage - 1) * itemsPerPage,
    currentPage * itemsPerPage,
  );

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
        filterableFields.length > 0) && (
        <div className="bg-white rounded-2xl border border-neutral-100 shadow-[0_1px_4px_rgba(0,0,0,0.04)] p-4 flex flex-col lg:flex-row lg:items-center justify-between gap-4">
          {/* Left: Search Bar & Filters in one line */}
          <div className="flex-1 flex flex-col md:flex-row md:items-center gap-3 min-w-0">
            {!tableConfig.disableSearch ? (
              <div className="relative w-full md:w-72 shrink-0">
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
                  className="w-full rounded-full border border-neutral-100 pl-10 pr-5 py-2 text-xs focus:border-brand/30 focus:outline-none transition-colors bg-neutral-50 placeholder:text-neutral-600 text-black font-semibold"
                />
              </div>
            ) : (
              <div />
            )}

            {filterableFields.length > 0 && (
              <div className="flex flex-wrap items-center gap-2.5 min-w-0">
                {filterableFields.map((field) => {
                  let dropdownOptions: { label: string; value: string }[] = [];

                  if (field.type === "boolean") {
                    dropdownOptions = [
                      { label: "All", value: "" },
                      { label: field.trueLabel || "Yes", value: "true" },
                      { label: field.falseLabel || "No", value: "false" },
                    ];
                  } else if (field.type === "select") {
                    dropdownOptions = [{ label: "All", value: "" }];
                    if (field.relation) {
                      const cache = relationCache[field.name] || {};
                      Object.entries(cache).forEach(([val, label]) => {
                        dropdownOptions.push({ label: String(label), value: val });
                      });
                    } else if (field.options) {
                      field.options.forEach((opt) => {
                        dropdownOptions.push({ label: opt.label, value: String(opt.value) });
                      });
                    }
                  }

                  const currentValue = filters[field.name] || "";

                  return (
                    <div key={field.name} className="flex items-center gap-1.5 shrink-0">
                      <Dropdown
                        options={dropdownOptions}
                        value={currentValue}
                        onChange={(val) => {
                          setFilters((prev) => ({ ...prev, [field.name]: val }));
                          setCurrentPage(1);
                        }}
                        placeholder={field.label}
                        variant="slim"
                        className="w-auto min-w-[130px]"
                      />
                    </div>
                  );
                })}
              </div>
            )}
          </div>

          {/* Right: Actions / Clear Filters */}
          <div className="flex items-center justify-end gap-3.5 shrink-0">
            {Object.values(filters).some((v) => v !== "") && (
              <button
                onClick={() => setFilters({})}
                className="text-xs font-bold text-black hover:text-brand transition-colors cursor-pointer"
              >
                Clear Filters
              </button>
            )}

            {!tableConfig.disableCreate && (
              <button
                onClick={handleAddNew}
                className="flex items-center justify-center gap-1.5 rounded-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs py-2 px-5 shadow-[0_1px_4px_rgba(0,0,0,0.08)] transition-all cursor-pointer shrink-0"
              >
                <Plus className="w-3.5 h-3.5" />
                <span>Add {getSingularLabel(tableConfig.label)}</span>
              </button>
            )}
          </div>
        </div>
      )}

      {/* Main Table Browser */}
      <div className="bg-white rounded-2xl border border-neutral-100 shadow-[0_1px_4px_rgba(0,0,0,0.04)] overflow-hidden">
        {loading ? (
          <LoadingState message="Syncing tables with database..." />
        ) : isError ? (
          <ErrorState
            message={error instanceof Error ? error.message : "Failed to load records"}
            onRetry={() => refetch()}
          />
        ) : filteredRecords.length === 0 ? (
          <EmptyState />
        ) : (
          <div className="flex flex-col">
            <div className="overflow-x-auto no-scrollbar">
              <table className="w-full text-left border-collapse text-xs">
                <thead>
                  <tr className="border-b border-neutral-50 text-black uppercase tracking-wider font-extrabold text-[10px]">
                    {tableConfig.displayColumns.map((col) => {
                      const f = tableConfig.fields.find((field) => field.name === col);
                      const isSorted = sortBy === col;
                      return (
                        <th
                          key={col}
                          className="py-3 px-6 font-bold cursor-pointer select-none hover:bg-neutral-50/80 transition-colors"
                          onClick={() => {
                            if (sortBy === col) {
                              setSortOrder((prev) => (prev === "asc" ? "desc" : "asc"));
                            } else {
                              setSortBy(col);
                              setSortOrder("asc");
                            }
                          }}
                        >
                          <div className="flex items-center gap-1">
                            <span>{f ? f.label : col}</span>
                            {isSorted ? (
                              sortOrder === "asc" ? (
                                <ChevronUp className="w-3 h-3 text-brand" />
                              ) : (
                                <ChevronDown className="w-3 h-3 text-brand" />
                              )
                            ) : (
                              <ChevronsUpDown className="w-3 h-3 text-neutral-400 opacity-40 hover:opacity-100 transition-opacity" />
                            )}
                          </div>
                        </th>
                      );
                    })}
                    <th className="py-3 px-6 font-bold text-right">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-neutral-50 text-black font-medium">
                  {paginatedRecords.map((rec) => {
                    const rowKey = (
                      tableConfig.compositeKeys
                        ? tableConfig.compositeKeys.map((k) => rec[k]).join("-")
                        : rec.id
                    ) as string;

                    return (
                      <tr key={rowKey} className="hover:bg-neutral-50/60 transition-colors">
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
                              className="p-1.5 rounded-lg border border-neutral-100 hover:border-brand/20 hover:bg-brand-light/30 text-neutral-500 hover:text-brand transition-all"
                            >
                              <Edit2 className="w-3 h-3" />
                            </button>
                          )}
                          {!tableConfig.disableDelete && (
                            <button
                              onClick={() => handleDeleteTrigger(rec)}
                              title="Delete Record"
                              className="p-1.5 rounded-lg border border-neutral-100 hover:border-red-200 hover:bg-red-50 text-neutral-500 hover:text-red-500 transition-all"
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
              <div className="border-t border-neutral-50 px-6 py-3.5 flex items-center justify-between">
                <span className="text-[10px] text-black font-bold">
                  Showing {(currentPage - 1) * itemsPerPage + 1} to{" "}
                  {Math.min(currentPage * itemsPerPage, filteredRecords.length)} of{" "}
                  {filteredRecords.length} records
                </span>

                <div className="flex items-center gap-1">
                  <button
                    disabled={currentPage === 1}
                    onClick={() => setCurrentPage((p) => p - 1)}
                    className="p-1.5 rounded-lg border border-neutral-100 hover:bg-neutral-50 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
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
                        className={`w-7 h-7 rounded-lg text-[10px] font-bold transition-all ${
                          isCurrent
                            ? "bg-brand text-white shadow-[0_1px_4px_rgba(0,0,0,0.1)]"
                            : "bg-white border border-neutral-100 hover:bg-neutral-50 text-black"
                        }`}
                      >
                        {pageNum}
                      </button>
                    );
                  })}

                  <button
                    disabled={currentPage === totalPages}
                    onClick={() => setCurrentPage((p) => p + 1)}
                    className="p-1.5 rounded-lg border border-neutral-100 hover:bg-neutral-50 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
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
            className="fixed inset-0 bg-neutral-900/40 backdrop-blur-xs transition-opacity"
            onClick={() => {
              setDeletingId(null);
              router.push(pathname);
            }}
          />

          <div className="bg-white rounded-[2rem] border border-border-light shadow-premium max-w-sm w-full p-6 text-center z-10 animate-in zoom-in-95 duration-200">
            <div className="w-12 h-12 rounded-full bg-red-50 text-red-600 flex items-center justify-center mx-auto mb-4 border border-red-100">
              <AlertTriangle className="w-5 h-5 animate-bounce" />
            </div>

            <h3 className="font-display font-bold text-base text-black">Confirm Delete Record?</h3>

            <p className="text-xs text-black mt-2 font-medium leading-relaxed">
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
                className="flex-1 px-4 py-2.5 text-xs font-semibold border border-border-light hover:bg-neutral-100 rounded-full text-black transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={handleConfirmDelete}
                disabled={deleteMutation.isPending}
                className="flex-1 px-4 py-2.5 text-xs font-semibold bg-red-600 hover:bg-red-700 text-white rounded-full transition-all shadow-sm flex items-center justify-center gap-1.5 disabled:opacity-50"
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
