import { getPackagesIndex } from "@/lib/db/repositories/packageRepo";

import PackagesClient from "./PackagesClient";

export default async function PackagesPage() {
  const packagesData = await getPackagesIndex();
  return <PackagesClient packagesData={packagesData} />;
}
