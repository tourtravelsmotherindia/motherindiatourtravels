import { getCompanyData } from "@/lib/db/repositories/companyRepo";
import { getPackagesIndex } from "@/lib/db/repositories/packageRepo";

import PackagesClient from "./PackagesClient";

export default async function PackagesPage() {
  const [packagesData, companyData] = await Promise.all([getPackagesIndex(), getCompanyData()]);
  return <PackagesClient packagesData={packagesData} companyData={companyData} />;
}
