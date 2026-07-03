import Link from "next/link";
import Image from "next/image";

interface BlogCardProps {
  slug: string;
  title: string;
  description: string;
  publishDate: string;
  image: string;
}

export default function BlogCard({
  slug,
  title,
  description,
  publishDate,
  image,
}: BlogCardProps) {
  const formattedDate = publishDate
    ? new Date(publishDate).toLocaleDateString("en-IN", {
        day: "numeric",
        month: "short",
        year: "numeric",
      })
    : "";

  return (
    <Link
      href={`/blog/${slug}`}
      className="group block bg-white rounded-xl overflow-hidden shadow-md hover:shadow-xl transition-all duration-300"
    >
      {/* Image */}
      <div className="relative aspect-[16/10] overflow-hidden bg-surface">
        {image ? (
          <Image
            src={image}
            alt={title}
            fill
            className="object-cover group-hover:scale-110 transition-transform duration-500"
            sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
          />
        ) : (
          <div className="absolute inset-0 flex items-center justify-center text-secondary">
            <i className="bi bi-image text-4xl" />
          </div>
        )}
      </div>

      {/* Content */}
      <div className="p-4">
        {formattedDate && (
          <span className="text-xs text-secondary2 mb-2 inline-block">
            {formattedDate}
          </span>
        )}
        <h3 className="font-semibold text-sm text-black line-clamp-2 mb-2 group-hover:text-red transition-colors">
          {title}
        </h3>
        {description && (
          <p className="text-xs text-secondary2 line-clamp-2">{description}</p>
        )}
      </div>
    </Link>
  );
}
