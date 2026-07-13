"use client";

import { Plus, Trash2, X } from "lucide-react";
import React, { useState } from "react";

import ImageUploadInput from "@/components/manage/ImageUploadInput";
import { type AboutData, type AboutSectionImageCollage } from "@/types/company";

interface AboutJsonEditorProps {
  value: AboutData | null | undefined;
  onChange: (val: AboutData) => void;
}

const TABS = [
  { id: "header", label: "Header & Stats" },
  { id: "mission", label: "Our Mission" },
  { id: "vision", label: "Our Vision" },
  { id: "history", label: "Strength & Team" },
  { id: "howWeWork", label: "How We Work" },
  { id: "footer", label: "Footer Narrative" },
];

const DEFAULT_ABOUT_DATA: AboutData = {
  footer: "",
  header: {
    badge: "",
    title: "",
    description: "",
    image: "",
    introText: "",
    stats: [],
  },
  mission: { title: "", description: "", items: [], images: [] },
  vision: { title: "", description: "", items: [], images: [] },
  history: { title: "", description: "", items: [], images: [] },
  howWeWork: { title: "", subtitle: "", videoImage: "", videoUrl: "" },
};

function getMergedAboutData(val: AboutData | null | undefined): AboutData {
  if (!val || typeof val !== "object") {
    return DEFAULT_ABOUT_DATA;
  }
  return {
    footer: val.footer || "",
    header: {
      badge: val.header?.badge || "",
      title: val.header?.title || "",
      description: val.header?.description || "",
      image: val.header?.image || "",
      introText: val.header?.introText || "",
      stats: Array.isArray(val.header?.stats) ? val.header.stats : [],
    },
    mission: {
      title: val.mission?.title || "",
      description: val.mission?.description || "",
      items: Array.isArray(val.mission?.items) ? val.mission.items : [],
      images: Array.isArray(val.mission?.images) ? val.mission.images : [],
    },
    vision: {
      title: val.vision?.title || "",
      description: val.vision?.description || "",
      items: Array.isArray(val.vision?.items) ? val.vision.items : [],
      images: Array.isArray(val.vision?.images) ? val.vision.images : [],
    },
    history: {
      title: val.history?.title || "",
      description: val.history?.description || "",
      items: Array.isArray(val.history?.items) ? val.history.items : [],
      images: Array.isArray(val.history?.images) ? val.history.images : [],
    },
    howWeWork: {
      title: val.howWeWork?.title || "",
      subtitle: val.howWeWork?.subtitle || "",
      videoImage: val.howWeWork?.videoImage || "",
      videoUrl: val.howWeWork?.videoUrl || "",
    },
  };
}

export default function AboutJsonEditor({ value, onChange }: AboutJsonEditorProps) {
  const [activeTab, setActiveTab] = useState("header");
  const [prevValue, setPrevValue] = useState(value);
  const [data, setData] = useState<AboutData>(() => getMergedAboutData(value));

  if (value !== prevValue) {
    setPrevValue(value);
    setData(getMergedAboutData(value));
  }

  const handleUpdate = (updated: AboutData) => {
    setData(updated);
    onChange(updated);
  };

  // Header Handlers
  const handleHeaderChange = (field: keyof AboutData["header"], val: unknown) => {
    const updated = {
      ...data,
      header: {
        ...data.header,
        [field]: val,
      },
    };
    handleUpdate(updated);
  };

  const handleAddStat = () => {
    const updated = {
      ...data,
      header: {
        ...data.header,
        stats: [...data.header.stats, { value: "", label: "" }],
      },
    };
    handleUpdate(updated);
  };

  const handleRemoveStat = (idx: number) => {
    const updated = {
      ...data,
      header: {
        ...data.header,
        stats: data.header.stats.filter((_, i) => i !== idx),
      },
    };
    handleUpdate(updated);
  };

  const handleStatChange = (idx: number, field: "value" | "label", val: string) => {
    const statsCopy = [...data.header.stats];
    statsCopy[idx] = { ...statsCopy[idx], [field]: val };
    const updated = {
      ...data,
      header: {
        ...data.header,
        stats: statsCopy,
      },
    };
    handleUpdate(updated);
  };

  // Collage Section Handlers (Mission, Vision, History)
  const handleCollageChange = (
    section: "mission" | "vision" | "history",
    field: keyof AboutSectionImageCollage,
    val: unknown,
  ) => {
    const updated = {
      ...data,
      [section]: {
        ...data[section],
        [field]: val,
      },
    };
    handleUpdate(updated);
  };

  // How We Work Handlers
  const handleHowWeWorkChange = (field: keyof AboutData["howWeWork"], val: string) => {
    const updated = {
      ...data,
      howWeWork: {
        ...data.howWeWork,
        [field]: val,
      },
    };
    handleUpdate(updated);
  };

  return (
    <div className="space-y-6">
      {/* Navigation tabs */}
      <div className="flex flex-wrap border-b border-border-light gap-1">
        {TABS.map((tab) => {
          const isActive = activeTab === tab.id;
          return (
            <button
              key={tab.id}
              type="button"
              onClick={() => setActiveTab(tab.id)}
              className={`px-4 py-2 text-xs font-bold transition-all border-b-2 uppercase tracking-wider ${
                isActive
                  ? "border-brand text-brand bg-brand-light/10"
                  : "border-transparent text-neutral-400 hover:text-neutral-600"
              }`}
            >
              {tab.label}
            </button>
          );
        })}
      </div>

      {/* Tab content */}
      <div className="pt-2">
        {activeTab === "header" && (
          <div className="space-y-4">
            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Header Badge Subtext
              </label>
              <input
                type="text"
                value={data.header.badge}
                placeholder="e.g. MOTHER INDIA • DISCOVER • EXPLORE"
                onChange={(e) => handleHeaderChange("badge", e.target.value)}
                className="w-full rounded-full border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Header Title
              </label>
              <input
                type="text"
                value={data.header.title}
                placeholder="Header title"
                onChange={(e) => handleHeaderChange("title", e.target.value)}
                className="w-full rounded-full border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Header Description
              </label>
              <textarea
                rows={3}
                value={data.header.description}
                placeholder="Main header description text"
                onChange={(e) => handleHeaderChange("description", e.target.value)}
                className="w-full rounded-[1.25rem] border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors font-sans"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Introduction Text
              </label>
              <textarea
                rows={3}
                value={data.header.introText}
                placeholder="Detailed introduction paragraph"
                onChange={(e) => handleHeaderChange("introText", e.target.value)}
                className="w-full rounded-[1.25rem] border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors font-sans"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Header Main Image
              </label>
              <ImageUploadInput
                value={data.header.image}
                onChange={(url) => handleHeaderChange("image", url)}
                folder="company-about"
              />
            </div>

            {/* Stats section */}
            <div className="pt-4 border-t border-border-light space-y-3">
              <div className="flex items-center justify-between">
                <label className="block text-xs font-bold text-neutral-600 uppercase tracking-wider">
                  Company Statistics Badges
                </label>
                <button
                  type="button"
                  onClick={handleAddStat}
                  className="text-xs font-bold text-brand hover:text-brand-hover flex items-center gap-1"
                >
                  <Plus className="w-3.5 h-3.5" /> Add Stat
                </button>
              </div>

              <div className="space-y-2">
                {data.header.stats.map((stat, idx) => (
                  <div key={idx} className="flex gap-2 items-center">
                    <div className="w-1/3">
                      <input
                        type="text"
                        value={stat.value}
                        placeholder="Value (e.g. 20+)"
                        onChange={(e) => handleStatChange(idx, "value", e.target.value)}
                        className="w-full rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
                      />
                    </div>
                    <div className="flex-1">
                      <input
                        type="text"
                        value={stat.label}
                        placeholder="Label (e.g. Years Experience)"
                        onChange={(e) => handleStatChange(idx, "label", e.target.value)}
                        className="w-full rounded-full border border-border-light px-4 py-2 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
                      />
                    </div>
                    <button
                      type="button"
                      onClick={() => handleRemoveStat(idx)}
                      className="p-2 text-neutral-400 hover:text-red-500 rounded-full hover:bg-neutral-100 transition-colors"
                    >
                      <Trash2 className="w-4 h-4" />
                    </button>
                  </div>
                ))}
                {data.header.stats.length === 0 && (
                  <p className="text-xs text-neutral-400 italic">No statistics defined yet.</p>
                )}
              </div>
            </div>
          </div>
        )}

        {(activeTab === "mission" || activeTab === "vision" || activeTab === "history") && (
          <div className="space-y-4">
            {/* Collage section editing */}
            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Section Title
              </label>
              <input
                type="text"
                value={data[activeTab as "mission" | "vision" | "history"].title}
                placeholder="Section title"
                onChange={(e) =>
                  handleCollageChange(
                    activeTab as "mission" | "vision" | "history",
                    "title",
                    e.target.value,
                  )
                }
                className="w-full rounded-full border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Description Text
              </label>
              <textarea
                rows={4}
                value={data[activeTab as "mission" | "vision" | "history"].description}
                placeholder="Section description content"
                onChange={(e) =>
                  handleCollageChange(
                    activeTab as "mission" | "vision" | "history",
                    "description",
                    e.target.value,
                  )
                }
                className="w-full rounded-[1.25rem] border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors font-sans"
              />
            </div>

            {/* Bullet points checklist */}
            <div className="space-y-2">
              <label className="block text-xs font-bold text-neutral-600 uppercase tracking-wider">
                Bullet Checklist Points
              </label>
              <div className="flex flex-wrap gap-1.5 mb-2">
                {data[activeTab as "mission" | "vision" | "history"].items.map((item, idx) => (
                  <span
                    key={idx}
                    className="inline-flex items-center gap-1.5 px-3 py-1 bg-brand-light text-brand font-semibold text-xs rounded-full border border-brand/10"
                  >
                    <span>{item}</span>
                    <button
                      type="button"
                      onClick={() => {
                        const items = data[
                          activeTab as "mission" | "vision" | "history"
                        ].items.filter((_, i) => i !== idx);
                        handleCollageChange(
                          activeTab as "mission" | "vision" | "history",
                          "items",
                          items,
                        );
                      }}
                      className="hover:text-brand-hover transition-colors"
                    >
                      <X className="w-3 h-3" />
                    </button>
                  </span>
                ))}
              </div>
              <input
                type="text"
                placeholder="Add bullet point and press Enter"
                onKeyDown={(e) => {
                  if (e.key === "Enter") {
                    e.preventDefault();
                    const target = e.target as HTMLInputElement;
                    const val = target.value.trim();
                    if (!val) return;
                    const sectionKey = activeTab as "mission" | "vision" | "history";
                    const currentItems = data[sectionKey].items;
                    if (currentItems.includes(val)) return;
                    handleCollageChange(sectionKey, "items", [...currentItems, val]);
                    target.value = "";
                  }
                }}
                className="w-full rounded-full border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
              />
            </div>

            {/* Collage images */}
            <div className="space-y-3 pt-2">
              <label className="block text-xs font-bold text-neutral-600 uppercase tracking-wider">
                Collage Accent Images
              </label>
              <div className="grid grid-cols-2 gap-3">
                {data[activeTab as "mission" | "vision" | "history"].images.map((img, idx) => (
                  <div
                    key={idx}
                    className="relative group rounded-[1.25rem] overflow-hidden border border-border-light h-28 bg-neutral-50"
                  >
                    {/* eslint-disable-next-line @next/next/no-img-element */}
                    <img src={img} alt="Collage detail" className="w-full h-full object-cover" />
                    <button
                      type="button"
                      onClick={() => {
                        const images = data[
                          activeTab as "mission" | "vision" | "history"
                        ].images.filter((_, i) => i !== idx);
                        handleCollageChange(
                          activeTab as "mission" | "vision" | "history",
                          "images",
                          images,
                        );
                      }}
                      className="absolute top-2 right-2 p-1.5 bg-red-600 text-white rounded-full hover:bg-red-700 shadow-sm opacity-0 group-hover:opacity-100 transition-opacity"
                    >
                      <X className="w-3.5 h-3.5" />
                    </button>
                  </div>
                ))}
                {data[activeTab as "mission" | "vision" | "history"].images.length < 2 && (
                  <ImageUploadInput
                    value=""
                    onChange={(url) => {
                      const sectionKey = activeTab as "mission" | "vision" | "history";
                      const currentImages = data[sectionKey].images;
                      handleCollageChange(sectionKey, "images", [...currentImages, url]);
                    }}
                    folder="company-about"
                  />
                )}
              </div>
            </div>
          </div>
        )}

        {activeTab === "howWeWork" && (
          <div className="space-y-4">
            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Section Heading
              </label>
              <input
                type="text"
                value={data.howWeWork.title}
                placeholder="How we work heading"
                onChange={(e) => handleHowWeWorkChange("title", e.target.value)}
                className="w-full rounded-full border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Section Subtitle / Description
              </label>
              <textarea
                rows={3}
                value={data.howWeWork.subtitle}
                placeholder="How we work subtitle description"
                onChange={(e) => handleHowWeWorkChange("subtitle", e.target.value)}
                className="w-full rounded-[1.25rem] border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors font-sans"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                YouTube Video URL
              </label>
              <input
                type="text"
                value={data.howWeWork.videoUrl}
                placeholder="e.g. https://www.youtube.com/watch?v=..."
                onChange={(e) => handleHowWeWorkChange("videoUrl", e.target.value)}
                className="w-full rounded-full border border-border-light px-4 py-2.5 text-sm bg-white focus:border-brand focus:outline-none transition-colors"
              />
            </div>

            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Video Overlay Thumbnail Image
              </label>
              <ImageUploadInput
                value={data.howWeWork.videoImage}
                onChange={(url) => handleHowWeWorkChange("videoImage", url)}
                folder="company-about"
              />
            </div>
          </div>
        )}

        {activeTab === "footer" && (
          <div className="space-y-4">
            <div className="space-y-1.5">
              <label className="block text-xs font-semibold text-neutral-600 uppercase">
                Footer About Narrative Block
              </label>
              <textarea
                rows={6}
                value={data.footer}
                placeholder="Provide a concise company intro narrative that appears in the website footer links block."
                onChange={(e) => handleUpdate({ ...data, footer: e.target.value })}
                className="w-full rounded-[1.25rem] border border-border-light px-4 py-3 text-sm bg-white focus:border-brand focus:outline-none transition-colors font-sans leading-relaxed"
              />
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
