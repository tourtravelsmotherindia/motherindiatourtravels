import React, { Suspense } from "react";

import { ADMIN_TABLES } from "@/lib/adminSchema";

import CrudClient from "./CrudClient";

export async function generateStaticParams() {
  return Object.keys(ADMIN_TABLES).map((key) => ({
    table: key,
  }));
}

export default async function GenericCrudPage({ params }: { params: Promise<{ table: string }> }) {
  const { table } = await params;
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-white flex items-center justify-center font-sans text-muted">
          Loading manager...
        </div>
      }
    >
      <CrudClient table={table} />
    </Suspense>
  );
}
