import { prisma } from "@/lib/db/prisma";

export async function getFAQData() {
  const faqs = await prisma.fAQ.findMany({ orderBy: { sortOrder: "asc" } });
  const taglineRecord = await prisma.fAQTagline.findFirst();

  return {
    tagline: taglineRecord?.tagline || "",
    faqs: faqs.map((f) => ({
      question: f.question,
      answer: f.answer,
    })),
  };
}
