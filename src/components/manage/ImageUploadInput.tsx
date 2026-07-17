"use client";

import { Loader2, Upload, X } from "lucide-react";
import React, { useRef, useState } from "react";

import { useToast } from "@/context/ToastContext";
import { uploadImage } from "@/lib/adminApi";

interface ImageUploadInputProps {
  value: string;
  onChange: (url: string) => void;
  label?: string;
  folder?: string;
}

export default function ImageUploadInput({
  value,
  onChange,
  label,
  folder = "mother-india",
}: ImageUploadInputProps) {
  const [uploadState, setUploadState] = useState<"idle" | "uploading" | "error">("idle");
  const [dragActive, setDragActive] = useState<boolean>(false);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const { showToast } = useToast();

  const handleUploadFile = async (file: File) => {
    if (!file.type.startsWith("image/")) {
      showToast("error", "File Format", "Only image files are allowed.");
      return;
    }

    try {
      setUploadState("uploading");
      const res = await uploadImage(file, folder);
      onChange(res.url);
      setUploadState("idle");
      showToast("success", "Upload Complete", "Image uploaded successfully to R2 storage.");
    } catch (err: unknown) {
      console.error(err);
      setUploadState("error");
      const errorMessage = err instanceof Error ? err.message : "Failed to upload image";
      showToast("error", "Upload Failed", errorMessage);
    }
  };

  const handleDrag = (e: React.DragEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === "dragenter" || e.type === "dragover") {
      setDragActive(true);
    } else if (e.type === "dragleave") {
      setDragActive(false);
    }
  };

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(false);

    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      handleUploadFile(e.dataTransfer.files[0]);
    }
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      handleUploadFile(e.target.files[0]);
    }
  };

  const handleRemove = (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();
    onChange("");
    if (fileInputRef.current) {
      fileInputRef.current.value = "";
    }
  };

  const triggerInputClick = () => {
    fileInputRef.current?.click();
  };

  return (
    <div className="w-full">
      {label && (
        <label className="block text-xs font-semibold text-neutral-400 uppercase mb-2">
          {label}
        </label>
      )}

      <input
        ref={fileInputRef}
        type="file"
        accept="image/*"
        onChange={handleFileChange}
        className="hidden"
      />

      {value ? (
        // Preview State
        <div className="relative group rounded-[1.5rem] overflow-hidden border border-neutral-800 bg-neutral-950 flex items-center justify-center min-h-[160px] max-h-[220px]">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={value}
            alt="Uploaded Preview"
            className="w-full h-full object-cover max-h-[220px] rounded-[1.5rem] transition-all duration-300 group-hover:scale-102"
          />
          <div className="absolute inset-0 bg-neutral-950/60 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center gap-2">
            <button
              onClick={triggerInputClick}
              disabled={uploadState === "uploading"}
              className="px-4 py-2 text-xs font-bold bg-white text-neutral-800 rounded-full hover:bg-neutral-100 transition-colors shadow-sm cursor-pointer"
            >
              Replace
            </button>
            <button
              onClick={handleRemove}
              className="p-2 bg-red-600 text-white rounded-full hover:bg-red-700 transition-colors shadow-sm cursor-pointer"
            >
              <X className="w-4 h-4" />
            </button>
          </div>
        </div>
      ) : (
        // Upload Action Card
        <div
          onDragEnter={handleDrag}
          onDragOver={handleDrag}
          onDragLeave={handleDrag}
          onDrop={handleDrop}
          onClick={triggerInputClick}
          className={`border-2 border-dashed rounded-[1.5rem] p-6 text-center cursor-pointer transition-all duration-200 flex flex-col items-center justify-center min-h-[160px] ${
            dragActive
              ? "border-brand bg-brand-light/10"
              : "border-neutral-800 hover:border-brand hover:bg-neutral-900/30"
          }`}
        >
          {uploadState === "uploading" ? (
            <div className="flex flex-col items-center gap-2">
              <Loader2 className="w-8 h-8 text-brand animate-spin" />
              <p className="text-xs font-semibold text-neutral-400 mt-1">
                Uploading image to R2 Storage...
              </p>
            </div>
          ) : (
            <>
              <div className="w-10 h-10 rounded-full bg-brand-light/10 flex items-center justify-center text-brand mb-3 border border-brand/20">
                <Upload className="w-5 h-5" />
              </div>
              <p className="text-xs font-bold text-neutral-300">Click to upload or drag & drop</p>
              <p className="text-[10px] text-neutral-500 mt-1">PNG, JPG, GIF or WEBP up to 5MB</p>
            </>
          )}
        </div>
      )}
    </div>
  );
}
