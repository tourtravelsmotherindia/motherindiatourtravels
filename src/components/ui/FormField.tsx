"use client";

import React from "react";

interface FormFieldProps {
  id: string;
  label: string;
  type?: "text" | "email" | "tel" | "textarea";
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  required?: boolean;
  className?: string;
  rows?: number;
}

export default function FormField({
  id,
  label,
  type = "text",
  value,
  onChange,
  placeholder = "",
  required = false,
  className = "",
  rows = 4,
}: FormFieldProps) {
  const commonClasses =
    "w-full bg-white border border-neutral-200 text-sm focus:outline-none focus:border-brand focus:ring-1 focus:ring-brand/35 hover:border-neutral-300 font-sans transition-all duration-200 text-foreground";

  return (
    <div className={`flex flex-col gap-2 ${className}`}>
      <label htmlFor={id} className="text-xs font-semibold text-neutral-500 ml-1">
        {label}
      </label>
      {type === "textarea" ? (
        <textarea
          id={id}
          required={required}
          value={value}
          onChange={(e) => onChange(e.target.value)}
          placeholder={placeholder}
          rows={rows}
          className={`${commonClasses} rounded-[1.5rem] px-5 py-4.5 resize-none min-h-[140px]`}
        />
      ) : (
        <input
          id={id}
          type={type}
          required={required}
          value={value}
          onChange={(e) => onChange(e.target.value)}
          placeholder={placeholder}
          className={`${commonClasses} rounded-full px-5 py-3`}
        />
      )}
    </div>
  );
}
