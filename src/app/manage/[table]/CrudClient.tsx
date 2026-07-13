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
import { useToast } from "@/context/ToastContext";
import { deleteRecord, getRecords } from "@/lib/adminApi";
import { ADMIN_TABLES, getSingularLabel } from "@/lib/adminSchema";
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

  // Router Action Parameters
  const action = searchParams.get("action");
  const editId = searchParams.get("id");

  const [records, setRecords] = useState<Record<string, unknown>[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [refreshTrigger, setRefreshTrigger] = useState<number>(0);
  const [searchTerm, setSearchTerm] = useState<string>("");
  const [currentPage, setCurrentPage] = useState<number>(1);
  const [deletingId, setDeletingId] = useState<string | null>(null);
  const [deleting, setDeleting] = useState<boolean>(false);

  const [mounted, setMounted] = useState<boolean>(false);

  // Relationship Cache Map: { [tableSlug]: { [id]: label } }
  const [relationCache, setRelationCache] = useState<Record<string, Record<string, string>>>({});

  // 1. Fetch records for the main table
  useEffect(() => {
    setTimeout(() => {
      setMounted(true);
    }, 0);
    if (!tableConfig) return;

    const fetchTableRecords = async () => {
      try {
        setLoading(true);
        const data = await getRecords<Record<string, unknown>>(table);
        setRecords(data);
        setCurrentPage(1); // reset to page 1
      } catch (err: unknown) {
        const errMsg = err instanceof Error ? err.message : "Failed to load database records";
        // Don't toast on session expiry — the layout handles redirect smoothly
        if (!errMsg.includes("Session expired")) {
          showToast("error", "Database Sync", errMsg);
        }
      } finally {
        setLoading(false);
      }
    };

    fetchTableRecords();
  }, [table, refreshTrigger, tableConfig, showToast]);

  // 2. Fetch relation metadata to resolve foreign keys in display list
  useEffect(() => {
    if (!tableConfig) return;

    const fetchRelationLabels = async () => {
      const relationFields = tableConfig.fields.filter((f) => f.type === "select" && f.relation);

      for (const field of relationFields) {
        const rel = field.relation!;
        // Skip if already cached
        if (relationCache[rel.table]) continue;

        try {
          const relRecords = await getRecords<Record<string, unknown>>(rel.table);

          const packagesMap: Record<string, string> = {};
          if (rel.table === "package-variants") {
            try {
              const packages = await getRecords<Record<string, unknown>>("packages");
              packages.forEach((pkg) => {
                packagesMap[String(pkg.id)] = String(pkg.name);
              });
            } catch (err) {
              console.error("Failed to fetch packages for variants cache mapping:", err);
            }
          }

          const cache: Record<string, string> = {};
          relRecords.forEach((rec) => {
            const variantId = (rec[rel.valueField] || rec.id) as string;
            let label = (rec[rel.labelField] || rec.id) as string;

            if (rel.table === "package-variants") {
              const packageId = String(rec.packageId || "");
              const packageName = packagesMap[packageId] || "Unknown Package";
              label = `${packageName} - ${label}`;
            }

            cache[variantId] = label;
          });
          setRelationCache((prev) => ({
            ...prev,
            [rel.table]: cache,
          }));
        } catch (err) {
          console.error(`Failed to cache relationship values for ${rel.table}:`, err);
        }
      }
    };

    fetchRelationLabels();
  }, [tableConfig, relationCache]);

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

  // Search & Filtering
  const filteredRecords = records.filter((rec) => {
    if (!searchTerm.trim()) return true;

    // Search by primary configured search field (like name or title)
    if (tableConfig.searchField) {
      const val = rec[tableConfig.searchField];
      return String(val || "")
        .toLowerCase()
        .includes(searchTerm.toLowerCase());
    }

    // Fallback: search all textual fields in the record
    return Object.values(rec).some((val) =>
      String(val || "")
        .toLowerCase()
        .includes(searchTerm.toLowerCase()),
    );
  });

  // Pagination Logic
  const itemsPerPage = 12;
  const totalPages = Math.ceil(filteredRecords.length / itemsPerPage);
  const paginatedRecords = filteredRecords.slice(
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
      setDeleting(true);
      if (tableConfig.compositeKeys) {
        await deleteRecord(table, null, deletingId);
      } else {
        await deleteRecord(table, deletingId);
      }
      showToast("success", "Record Deleted", "The record has been permanently removed.");
      setRefreshTrigger((prev) => prev + 1);
      router.push(pathname);
    } catch (err: unknown) {
      const errorMessage = err instanceof Error ? err.message : "Failed to delete record";
      showToast("error", "Delete Failed", errorMessage);
    } finally {
      setDeleting(false);
      setDeletingId(null);
    }
  };

  // Render cells depending on schema config type
  const renderCellContent = (colName: string, value: unknown) => {
    const field = tableConfig.fields.find((f) => f.name === colName);
    if (!field) return String(value ?? "");

    if (value === null || value === undefined) return "-";

    // 1. Boolean check — uses trueLabel/falseLabel from schema, falls back to "Active"/"Inactive"
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

    // 2. Select Option Relation Display
    if (field.type === "select" && field.relation) {
      const cache = relationCache[field.relation.table];
      const key = String(value);
      return cache ? cache[key] || key : key;
    }

    // 3. Select Static enum display
    if (field.type === "select" && field.options) {
      const option = field.options.find((opt) => opt.value === value);
      return option ? option.label : String(value);
    }

    // 4. Image preview thumbnail
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

    // 5. Array of strings list (tags)
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

    // 6. Datetime formatter (UTC → local timezone)
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
      {(!tableConfig.disableSearch || !tableConfig.disableCreate) && (
        <div className="bg-white rounded-2xl border border-neutral-100 shadow-[0_1px_4px_rgba(0,0,0,0.04)] p-4 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          {/* Search Input */}
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
                className="w-full rounded-full border border-neutral-100 pl-10 pr-5 py-2 text-xs focus:border-brand/30 focus:outline-none transition-colors bg-neutral-50 placeholder:text-neutral-600 text-neutral-800"
              />
            </div>
          ) : (
            <div />
          )}

          {/* Add New Button */}
          {!tableConfig.disableCreate && (
            <button
              onClick={handleAddNew}
              className="flex items-center justify-center gap-1.5 rounded-full bg-brand hover:bg-brand-hover text-white font-semibold text-xs py-2 px-5 shadow-[0_1px_4px_rgba(0,0,0,0.08)] transition-all cursor-pointer"
            >
              <Plus className="w-3.5 h-3.5" />
              <span>Add {getSingularLabel(tableConfig.label)}</span>
            </button>
          )}
        </div>
      )}

      {/* Main Database Table Browser */}
      <div className="bg-white rounded-2xl border border-neutral-100 shadow-[0_1px_4px_rgba(0,0,0,0.04)] overflow-hidden">
        {loading ? (
          <div className="py-24 flex flex-col items-center justify-center">
            <Loader2 className="w-6 h-6 text-brand animate-spin" />
            <p className="text-xs text-neutral-600 font-semibold mt-2 animate-pulse">
              Syncing tables with database...
            </p>
          </div>
        ) : filteredRecords.length === 0 ? (
          <div className="py-24 text-center">
            <AlertTriangle className="w-10 h-10 text-neutral-300 mx-auto mb-3" />
            <h3 className="text-sm font-bold text-neutral-700">No Records Found</h3>
            <p className="text-xs text-neutral-500 mt-1">
              Try adjusting your search or insert a new entry.
            </p>
          </div>
        ) : (
          <div className="flex flex-col">
            <div className="overflow-x-auto no-scrollbar">
              <table className="w-full text-left border-collapse text-xs">
                <thead>
                  <tr className="border-b border-neutral-50 text-neutral-800 uppercase tracking-wider font-bold text-[10px]">
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
                <tbody className="divide-y divide-neutral-50 text-neutral-700 font-medium">
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

            {/* Pagination Controls */}
            {totalPages > 1 && (
              <div className="border-t border-neutral-50 px-6 py-3.5 flex items-center justify-between">
                <span className="text-[10px] text-neutral-600 font-medium">
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
                            : "bg-white border border-neutral-100 hover:bg-neutral-50 text-neutral-500"
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
              setRefreshTrigger((prev) => prev + 1);
              router.push(pathname);
            }}
          />
        )}
      </AnimatePresence>

      {/* Delete Confirmation Dialog Modal */}
      {action === "delete" && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          <div
            className="fixed inset-0 bg-neutral-900/40 backdrop-blur-xs transition-opacity"
            onClick={() => router.push(pathname)}
          />

          <div className="bg-white rounded-[2rem] border border-border-light shadow-premium max-w-sm w-full p-6 text-center z-10 animate-in zoom-in-95 duration-200">
            <div className="w-12 h-12 rounded-full bg-red-50 text-red-600 flex items-center justify-center mx-auto mb-4 border border-red-100">
              <AlertTriangle className="w-5 h-5 animate-bounce" />
            </div>

            <h3 className="font-display font-bold text-base text-neutral-900">
              Confirm Delete Record?
            </h3>

            <p className="text-xs text-neutral-500 mt-2 font-medium leading-relaxed">
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
                disabled={deleting}
                className="flex-1 px-4 py-2.5 text-xs font-semibold border border-border-light hover:bg-neutral-100 rounded-full text-neutral-600 transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={handleConfirmDelete}
                disabled={deleting}
                className="flex-1 px-4 py-2.5 text-xs font-semibold bg-red-600 hover:bg-red-700 text-white rounded-full transition-all shadow-sm flex items-center justify-center gap-1.5 disabled:opacity-50"
              >
                {deleting ? (
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
