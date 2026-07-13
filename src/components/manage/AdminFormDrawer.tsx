"use client";

import { AnimatePresence, motion } from "framer-motion";
import { Loader2, Save, X } from "lucide-react";
import React, { useEffect, useState } from "react";

import Dropdown from "@/components/ui/Dropdown";
import { useToast } from "@/context/ToastContext";
import { createRecord, getRecord, getRecords, updateRecord } from "@/lib/adminApi";
import { ADMIN_TABLES, FieldConfig } from "@/lib/adminSchema";
import { type AboutData, type WorkingHoursSchedule } from "@/types/company";

import AboutJsonEditor from "./AboutJsonEditor";
import ExceptionsJsonEditor, { type HolidayException } from "./ExceptionsJsonEditor";
import GenericJsonEditor from "./GenericJsonEditor";
import ImageUploadInput from "./ImageUploadInput";
import ScheduleJsonEditor from "./ScheduleJsonEditor";
import SocialMediaJsonEditor from "./SocialMediaJsonEditor";

interface AdminFormDrawerProps {
  table: string;
  recordId: string | null;
  onClose: () => void;
  onSaved: () => void;
}

export default function AdminFormDrawer({
  table,
  recordId,
  onClose,
  onSaved,
}: AdminFormDrawerProps) {
  const tableConfig = ADMIN_TABLES[table];
  const { showToast } = useToast();

  // Load field metadata
  const fields = React.useMemo(() => tableConfig?.fields || [], [tableConfig]);

  // Determine if we should split form into tabs (e.g., packages, blog posts)
  const isLargeForm = ["packages", "blog-posts", "company"].includes(table);

  // Initialize form default values with lazy state initializer to avoid set-state-in-effect warning
  const [formData, setFormData] = useState<Record<string, unknown>>(() => {
    const defaults: Record<string, unknown> = {};
    fields.forEach((f) => {
      if (f.defaultValue !== undefined) {
        defaults[f.name] = f.defaultValue;
      } else if (f.type === "boolean") {
        defaults[f.name] = false;
      } else if (f.type === "array-string" || f.type === "images-list") {
        defaults[f.name] = [];
      } else if (f.type === "json") {
        if (f.name === "about") {
          defaults[f.name] = {};
        } else if (f.name === "schedule" || f.name === "exceptions") {
          defaults[f.name] = [];
        } else {
          defaults[f.name] = {};
        }
      } else {
        defaults[f.name] = "";
      }
    });
    return defaults;
  });

  const [loading, setLoading] = useState<boolean>(false);
  const [saving, setSaving] = useState<boolean>(false);
  const [relationOptions, setRelationOptions] = useState<
    Record<string, { label: string; value: string | number | boolean }[]>
  >({});
  const [activeTab, setActiveTab] = useState<string>("general");

  // Load record details if editing
  useEffect(() => {
    // Lock scroll on background body
    document.body.style.overflow = "hidden";
    return () => {
      document.body.style.overflow = "";
    };
  }, []);

  useEffect(() => {
    if (!recordId || !table) return;

    const fetchRecord = async () => {
      try {
        setLoading(true);
        const data = await getRecord<Record<string, unknown>>(table, recordId);

        // Parse array/json fields if needed (API worker handles it, but let's make sure it fits inputs)
        const parsedData = { ...data };
        fields.forEach((f) => {
          if (f.type === "json") {
            const val = parsedData[f.name];
            if (typeof val === "string" && val.trim()) {
              try {
                parsedData[f.name] = JSON.parse(val);
              } catch {
                parsedData[f.name] = null;
              }
            } else if (typeof val !== "object" || val === null) {
              if (f.name === "about") {
                parsedData[f.name] = {};
              } else if (f.name === "schedule" || f.name === "exceptions") {
                parsedData[f.name] = [];
              } else {
                parsedData[f.name] = {};
              }
            }
          }
        });

        setFormData(parsedData);
      } catch (err: unknown) {
        const errorMessage = err instanceof Error ? err.message : "Failed to load record details";
        showToast("error", "Fetch Details", errorMessage);
        onClose();
      } finally {
        setLoading(false);
      }
    };

    fetchRecord();
  }, [table, recordId, fields, onClose, showToast]);

  // Load relationship option dropdowns dynamically
  useEffect(() => {
    const fetchRelations = async () => {
      const relationFields = fields.filter((f) => f.type === "select" && f.relation);

      for (const field of relationFields) {
        if (!field.relation) continue;
        try {
          const records = await getRecords<Record<string, unknown>>(field.relation.table);

          const packagesMap: Record<string, string> = {};
          if (field.relation.table === "package-variants") {
            try {
              const packages = await getRecords<Record<string, unknown>>("packages");
              packages.forEach((pkg) => {
                packagesMap[String(pkg.id)] = String(pkg.name);
              });
            } catch (err) {
              console.error("Failed to fetch packages for variants mapping:", err);
            }
          }

          const options = records.map((rec) => {
            let label = String(rec[field.relation!.labelField] || rec.id || "Unnamed");
            if (field.relation!.table === "package-variants") {
              const packageId = String(rec.packageId || "");
              const packageName = packagesMap[packageId] || "Unknown Package";
              label = `${packageName} - ${label}`;
            }
            return {
              label,
              value: (rec[field.relation!.valueField] || rec.id) as string | number | boolean,
            };
          });

          setRelationOptions((prev) => ({
            ...prev,
            [field.name]: options,
          }));
        } catch (err) {
          console.error(`Failed to load relation options for ${field.name}:`, err);
        }
      }
    };

    if (table) {
      fetchRelations();
    }
  }, [table, fields]);

  const handleInputChange = (name: string, value: unknown) => {
    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  // Tag inputs helper (for Highlights, Inclusions, tags list)
  const [tagInputText, setTagInputText] = useState<Record<string, string>>({});

  const handleAddTag = (fieldName: string, e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === "Enter") {
      e.preventDefault();
      const val = tagInputText[fieldName]?.trim();
      if (!val) return;

      const currentTags = (formData[fieldName] as string[]) || [];
      if (currentTags.includes(val)) {
        showToast("info", "Duplicate Item", "This item has already been added.");
        return;
      }

      handleInputChange(fieldName, [...currentTags, val]);
      setTagInputText((prev) => ({ ...prev, [fieldName]: "" }));
    }
  };

  const handleRemoveTag = (fieldName: string, index: number) => {
    const currentTags = (formData[fieldName] as string[]) || [];
    const newTags = [...currentTags];
    newTags.splice(index, 1);
    handleInputChange(fieldName, newTags);
  };

  // Submit Handler
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    // Validate required fields
    for (const f of fields) {
      if (
        f.required &&
        (formData[f.name] === undefined || formData[f.name] === null || formData[f.name] === "")
      ) {
        showToast("error", "Validation Error", `Field "${f.label}" is required.`);
        return;
      }
    }

    // Process JSON fields
    const processedData = { ...formData };
    for (const f of fields) {
      if (f.type === "json") {
        const val = formData[f.name];
        if (typeof val === "string") {
          if (val.trim()) {
            try {
              processedData[f.name] = JSON.parse(val);
            } catch {
              showToast("error", "Syntax Error", `Invalid JSON structure in field "${f.label}".`);
              return;
            }
          } else {
            processedData[f.name] = null;
          }
        } else {
          processedData[f.name] = val;
        }
      }

      // Convert numbers explicitly
      if (
        f.type === "number" &&
        processedData[f.name] !== undefined &&
        processedData[f.name] !== ""
      ) {
        processedData[f.name] = Number(processedData[f.name]);
      }
    }

    try {
      setSaving(true);
      if (recordId) {
        // Edit Mode
        // If composite keys table (like destination-neighbours), call update without a single ID,
        // but we'll extract filter parameters. Standard table uses standard ID.
        if (tableConfig.compositeKeys) {
          const filterQueries = tableConfig.compositeKeys
            .map((k) => `${k}=eq.${formData[k]}`)
            .join("&");
          await updateRecord(table, null, processedData, filterQueries);
        } else {
          await updateRecord(table, recordId, processedData);
        }
        showToast("success", "Update Success", "The database record has been updated.");
      } else {
        // Create Mode
        await createRecord(table, processedData);
        showToast("success", "Create Success", "A new database record has been created.");
      }
      onSaved();
    } catch (err: unknown) {
      const errorMessage = err instanceof Error ? err.message : "Failed to save record";
      showToast("error", "Save Failed", errorMessage);
    } finally {
      setSaving(false);
    }
  };

  // Group fields for large forms
  const generalFields = fields.filter(
    (f) =>
      !f.name.startsWith("seo") &&
      f.type !== "images-list" &&
      f.name !== "content" &&
      f.name !== "overview",
  );
  const mediaFields = fields.filter((f) => f.type === "images-list");
  const contentFields = fields.filter((f) => f.name === "content" || f.name === "overview");
  const seoFields = fields.filter((f) => f.name.startsWith("seo"));

  const renderField = (field: FieldConfig) => {
    switch (field.type) {
      case "text":
      case "number":
        return (
          <div key={field.name} className="w-full">
            <label className="block text-xs font-semibold text-neutral-600 uppercase mb-2">
              {field.label} {field.required && <span className="text-red-500">*</span>}
            </label>
            <input
              type={field.type === "number" ? "number" : "text"}
              value={(formData[field.name] as string | number | undefined) ?? ""}
              onChange={(e) => handleInputChange(field.name, e.target.value)}
              placeholder={field.placeholder || `Enter ${field.label.toLowerCase()}`}
              className="w-full rounded-full border border-border-light px-5 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
            />
          </div>
        );

      case "datetime":
        return (
          <div key={field.name} className="w-full">
            <label className="block text-xs font-semibold text-neutral-600 uppercase mb-2">
              {field.label} {field.required && <span className="text-red-500">*</span>}
            </label>
            <input
              type="datetime-local"
              value={
                formData[field.name]
                  ? new Date(formData[field.name] as string | number).toISOString().slice(0, 16)
                  : ""
              }
              onChange={(e) => handleInputChange(field.name, e.target.value)}
              className="w-full rounded-full border border-border-light px-5 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
            />
          </div>
        );

      case "boolean":
        const isChecked = !!formData[field.name];
        return (
          <div key={field.name} className="w-full">
            <label className="block text-xs font-semibold text-neutral-600 uppercase mb-2">
              &nbsp;
            </label>
            <div
              onClick={() => handleInputChange(field.name, !isChecked)}
              className="flex items-center gap-3.5 w-full rounded-full border border-border-light px-5 py-[11px] bg-white hover:border-brand/45 cursor-pointer transition-colors select-none"
            >
              <button
                type="button"
                id={field.name}
                className={`w-5 h-5 rounded-md border flex items-center justify-center transition-all duration-200 cursor-pointer ${
                  isChecked
                    ? "bg-brand border-brand text-white"
                    : "bg-white border-neutral-300 text-transparent"
                }`}
              >
                <svg
                  className="w-3.5 h-3.5"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="3.5"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                >
                  <polyline points="20 6 9 17 4 12" />
                </svg>
              </button>
              <span className="text-sm font-bold text-neutral-700">{field.label}</span>
            </div>
          </div>
        );

      case "textarea":
        return (
          <div key={field.name} className="w-full">
            <label className="block text-xs font-semibold text-neutral-600 uppercase mb-2">
              {field.label} {field.required && <span className="text-red-500">*</span>}
            </label>
            <textarea
              rows={field.name === "content" ? 14 : 4}
              value={(formData[field.name] as string | undefined) ?? ""}
              onChange={(e) => handleInputChange(field.name, e.target.value)}
              placeholder={field.placeholder || `Enter ${field.label.toLowerCase()} content`}
              className="w-full rounded-[1.5rem] border border-border-light px-5 py-3 text-sm bg-white focus:border-brand focus:outline-none transition-colors font-sans leading-relaxed"
            />
          </div>
        );

      case "select":
        const rawOptions = field.relation ? relationOptions[field.name] || [] : field.options || [];
        const dropdownOptions = rawOptions.map((opt) => ({
          value: String(opt.value),
          label: opt.label,
        }));
        const selectedValue = String(formData[field.name] ?? "");

        const handleDropdownChange = (val: string) => {
          const originalOpt = rawOptions.find((opt) => String(opt.value) === val);
          const finalVal = originalOpt ? originalOpt.value : val;
          handleInputChange(field.name, finalVal);
        };

        return (
          <div key={field.name} className="w-full">
            <label className="block text-xs font-semibold text-neutral-600 uppercase mb-2">
              {field.label} {field.required && <span className="text-red-500">*</span>}
            </label>
            <Dropdown
              options={dropdownOptions}
              value={selectedValue}
              onChange={handleDropdownChange}
              placeholder={`Select ${field.label}`}
              className="w-full"
              triggerClassName="w-full text-left font-medium"
              menuClassName="w-full max-w-full"
            />
          </div>
        );

      case "image":
        return (
          <ImageUploadInput
            key={field.name}
            value={(formData[field.name] as string | undefined) || ""}
            onChange={(url) => handleInputChange(field.name, url)}
            label={field.label}
            folder={table}
          />
        );

      case "images-list":
        const list = (formData[field.name] as string[]) || [];
        return (
          <div key={field.name} className="w-full space-y-3">
            <label className="block text-xs font-semibold text-neutral-600 uppercase">
              {field.label}
            </label>

            <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
              {list.map((img: string, idx: number) => (
                <div
                  key={idx}
                  className="relative group rounded-[1.5rem] overflow-hidden border border-border-light h-28 bg-neutral-100"
                >
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img src={img} alt="Gallery item" className="w-full h-full object-cover" />
                  <button
                    onClick={(e) => {
                      e.preventDefault();
                      const newList = [...list];
                      newList.splice(idx, 1);
                      handleInputChange(field.name, newList);
                    }}
                    className="absolute top-2 right-2 p-1.5 bg-red-600 text-white rounded-full hover:bg-red-700 shadow-sm opacity-0 group-hover:opacity-100 transition-opacity"
                  >
                    <X className="w-3.5 h-3.5" />
                  </button>
                </div>
              ))}

              <ImageUploadInput
                value=""
                onChange={(url) => handleInputChange(field.name, [...list, url])}
                folder={table}
              />
            </div>
          </div>
        );

      case "array-string":
        const tags = (formData[field.name] as string[]) || [];
        return (
          <div key={field.name} className="w-full">
            <label className="block text-xs font-semibold text-neutral-600 uppercase mb-2">
              {field.label} (Press Enter to add)
            </label>

            <div className="flex flex-wrap gap-1.5 mb-2.5">
              {tags.map((tag: string, idx: number) => (
                <span
                  key={idx}
                  className="inline-flex items-center gap-1 px-3 py-1 bg-brand-light text-brand font-semibold text-xs rounded-full border border-brand/10"
                >
                  <span>{tag}</span>
                  <button
                    type="button"
                    onClick={() => handleRemoveTag(field.name, idx)}
                    className="hover:text-brand-hover transition-colors"
                  >
                    <X className="w-3 h-3" />
                  </button>
                </span>
              ))}
              {tags.length === 0 && (
                <span className="text-xs text-neutral-400 font-medium italic">
                  No values added yet.
                </span>
              )}
            </div>

            <input
              type="text"
              value={tagInputText[field.name] ?? ""}
              onChange={(e) =>
                setTagInputText((prev) => ({ ...prev, [field.name]: e.target.value }))
              }
              onKeyDown={(e) => handleAddTag(field.name, e)}
              placeholder="Type value and press Enter"
              className="w-full rounded-full border border-border-light px-5 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
            />
          </div>
        );

      case "json":
        const jsonVal = formData[field.name];
        return (
          <div key={field.name} className="w-full">
            {field.name === "about" && (
              <AboutJsonEditor
                value={jsonVal as AboutData | null | undefined}
                onChange={(val) => handleInputChange(field.name, val)}
              />
            )}
            {field.name === "schedule" && (
              <ScheduleJsonEditor
                value={jsonVal as WorkingHoursSchedule[] | null | undefined}
                onChange={(val) => handleInputChange(field.name, val)}
              />
            )}
            {field.name === "exceptions" && (
              <ExceptionsJsonEditor
                value={jsonVal as HolidayException[] | null | undefined}
                onChange={(val) => handleInputChange(field.name, val)}
              />
            )}
            {field.name === "socialMedia" && (
              <SocialMediaJsonEditor
                value={jsonVal as Record<string, string> | null | undefined}
                onChange={(val) => handleInputChange(field.name, val)}
              />
            )}
            {field.name !== "about" &&
              field.name !== "schedule" &&
              field.name !== "exceptions" &&
              field.name !== "socialMedia" && (
                <GenericJsonEditor
                  label={field.label}
                  value={jsonVal as Record<string, unknown> | unknown[] | null | undefined}
                  onChange={(val) => handleInputChange(field.name, val)}
                />
              )}
          </div>
        );

      default:
        return null;
    }
  };

  return (
    <AnimatePresence>
      <div className="fixed inset-0 z-40 flex justify-end">
        {/* Backdrop Overlay */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.25 }}
          className="fixed inset-0 bg-neutral-900/40 backdrop-blur-xs"
          onClick={onClose}
        />

        {/* Sliding Panel */}
        <motion.div
          initial={{ x: "100%" }}
          animate={{ x: 0 }}
          exit={{ x: "100%" }}
          transition={{ type: "tween", duration: 0.3 }}
          className={`relative h-full bg-neutral-50 shadow-premium flex flex-col z-50 border-l border-border-light ${
            isLargeForm ? "w-full max-w-4xl" : "w-full max-w-2xl"
          }`}
        >
          {/* Header */}
          <div className="bg-white px-6 py-4 border-b border-border-light flex items-center justify-between">
            <div>
              <h2 className="text-lg font-bold font-display text-foreground flex items-center gap-2">
                <span>
                  {recordId ? "Edit" : "Create"} {tableConfig?.label.slice(0, -1) || "Record"}
                </span>
                {recordId && (
                  <span className="text-xs px-2 py-0.5 bg-neutral-100 text-neutral-500 rounded-full font-mono">
                    {recordId.slice(0, 8)}
                  </span>
                )}
              </h2>
              <p className="text-xs text-neutral-500 mt-0.5">
                Fill in fields to persist items in database.
              </p>
            </div>
            <button
              onClick={onClose}
              className="w-8 h-8 rounded-full border border-border-light hover:bg-neutral-50 text-neutral-500 hover:text-neutral-800 transition-colors flex items-center justify-center"
            >
              <X className="w-4 h-4" />
            </button>
          </div>

          {/* Loading details State */}
          {loading ? (
            <div className="flex-1 flex flex-col items-center justify-center bg-white">
              <Loader2 className="w-8 h-8 text-brand animate-spin" />
              <p className="text-xs text-neutral-500 font-semibold mt-2">
                Loading record details...
              </p>
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="flex-1 flex flex-col overflow-hidden">
              {/* Form Body - Scrollable content */}
              <div className="flex-1 overflow-y-auto p-6 space-y-6 dropdown-scrollbar bg-white">
                {isLargeForm ? (
                  // Large forms tabbed layout
                  <div className="space-y-6">
                    {/* Tabs Segment Control */}
                    <div className="flex rounded-full bg-neutral-100 p-1 w-fit border border-neutral-200">
                      <button
                        type="button"
                        onClick={() => setActiveTab("general")}
                        className={`px-4 py-1.5 text-xs font-semibold rounded-full transition-colors ${
                          activeTab === "general"
                            ? "bg-brand text-white shadow-premium"
                            : "text-neutral-600 hover:text-brand"
                        }`}
                      >
                        General Details
                      </button>
                      {contentFields.length > 0 && (
                        <button
                          type="button"
                          onClick={() => setActiveTab("content")}
                          className={`px-4 py-1.5 text-xs font-semibold rounded-full transition-colors ${
                            activeTab === "content"
                              ? "bg-brand text-white shadow-premium"
                              : "text-neutral-600 hover:text-brand"
                          }`}
                        >
                          Long Content
                        </button>
                      )}
                      {mediaFields.length > 0 && (
                        <button
                          type="button"
                          onClick={() => setActiveTab("media")}
                          className={`px-4 py-1.5 text-xs font-semibold rounded-full transition-colors ${
                            activeTab === "media"
                              ? "bg-brand text-white shadow-premium"
                              : "text-neutral-600 hover:text-brand"
                          }`}
                        >
                          Gallery / Media
                        </button>
                      )}
                      {seoFields.length > 0 && (
                        <button
                          type="button"
                          onClick={() => setActiveTab("seo")}
                          className={`px-4 py-1.5 text-xs font-semibold rounded-full transition-colors ${
                            activeTab === "seo"
                              ? "bg-brand text-white shadow-premium"
                              : "text-neutral-600 hover:text-brand"
                          }`}
                        >
                          SEO Optimization
                        </button>
                      )}
                    </div>

                    {/* Tab panels */}
                    <div className="space-y-5 animate-in fade-in duration-200">
                      {activeTab === "general" && (
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                          {generalFields.map((f) => (
                            <div
                              key={f.name}
                              className={
                                f.type === "textarea" ||
                                f.type === "image" ||
                                f.type === "json" ||
                                f.type === "array-string" ||
                                f.type === "images-list"
                                  ? "md:col-span-2"
                                  : ""
                              }
                            >
                              {renderField(f)}
                            </div>
                          ))}
                        </div>
                      )}

                      {activeTab === "content" && (
                        <div className="space-y-5">{contentFields.map((f) => renderField(f))}</div>
                      )}

                      {activeTab === "media" && (
                        <div className="space-y-5">{mediaFields.map((f) => renderField(f))}</div>
                      )}

                      {activeTab === "seo" && (
                        <div className="space-y-5">{seoFields.map((f) => renderField(f))}</div>
                      )}
                    </div>
                  </div>
                ) : (
                  // Normal Forms (Single Column Layout)
                  <div className="grid grid-cols-1 gap-5">
                    {fields.map((f) => (
                      <div key={f.name}>{renderField(f)}</div>
                    ))}
                  </div>
                )}
              </div>

              {/* Footer */}
              <div className="bg-neutral-50 px-6 py-4 border-t border-border-light flex items-center justify-end gap-3.5">
                <button
                  type="button"
                  onClick={onClose}
                  disabled={saving}
                  className="px-5 py-2.5 rounded-full border border-border-light text-neutral-600 hover:bg-neutral-100 font-semibold text-sm transition-colors"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  disabled={saving}
                  className="flex items-center gap-2 px-6 py-2.5 rounded-full bg-brand hover:bg-brand-hover text-white font-semibold text-sm transition-all shadow-premium disabled:opacity-50"
                >
                  {saving ? (
                    <>
                      <Loader2 className="w-4 h-4 animate-spin" />
                      <span>Saving...</span>
                    </>
                  ) : (
                    <>
                      <Save className="w-4 h-4" />
                      <span>Save Record</span>
                    </>
                  )}
                </button>
              </div>
            </form>
          )}
        </motion.div>
      </div>
    </AnimatePresence>
  );
}
