"use client";

import { LucideIcon } from "lucide-react";
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
  icon?: LucideIcon | React.ComponentType<{ className?: string }>;
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
  icon: Icon,
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
        <div className="w-full bg-white border border-neutral-200 rounded-full px-5 focus-within:border-brand focus-within:ring-1 focus-within:ring-brand/35 hover:border-neutral-300 transition-all duration-200 flex items-center gap-2.5 min-h-[46px]">
          {Icon && <Icon className="w-4 h-4 text-neutral-400 shrink-0" />}
          <input
            id={id}
            type={type}
            required={required}
            value={value}
            onChange={(e) => onChange(e.target.value)}
            placeholder={placeholder}
            className="w-full bg-transparent text-sm focus:outline-none font-sans text-foreground py-3 border-none p-0 focus:ring-0 focus:border-none focus:outline-none"
          />
        </div>
      )}
    </div>
  );
}
