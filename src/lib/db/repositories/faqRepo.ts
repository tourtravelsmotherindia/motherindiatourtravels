import { prisma } from "@/lib/db/prisma";
import type { FAQSectionData } from "@/types/faq";

export async function getFAQSectionData(): Promise<FAQSectionData> {
  const [faqs, section] = await Promise.all([
    prisma.fAQ.findMany({ orderBy: { sortOrder: "asc" } }),
    prisma.siteSection.findUnique({ where: { key: "faq" } }),
  ]);

  return {
    tagline: section?.tagline ?? "Have Questions?",
    subtitle:
      section?.subtitle ??
      "We've got answers to the most common travel questions from our customers.",
    items: faqs.map((f) => ({
      id: f.id,
      question: f.question,
      answer: f.answer,
      sortOrder: f.sortOrder,
    })),
  };
}
