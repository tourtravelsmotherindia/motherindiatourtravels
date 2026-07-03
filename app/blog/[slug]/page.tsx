import { Metadata } from "next";
import { notFound } from "next/navigation";
import Link from "next/link";
import {
  getBlog,
  getAllBlogSlugs,
  getRecentBlogs,
  resolveBlogSlug,
} from "@/lib/data";

export async function generateStaticParams() {
  const slugs = getAllBlogSlugs();
  return slugs.map((slug) => ({ slug }));
}

export async function generateMetadata({
  params,
}: {
  params: { slug: string };
}): Promise<Metadata> {
  const blog = getBlog(params.slug);
  if (!blog) return { title: "Not Found" };

  return {
    title: blog.seo_title || blog.blog_title || "Blog Post",
    description: blog.description || "",
  };
}

export default function BlogPostPage({
  params,
}: {
  params: { slug: string };
}) {
  const blog = getBlog(params.slug);
  if (!blog) notFound();

  const formattedDate = blog.publish_date
    ? new Date(blog.publish_date).toLocaleDateString("en-IN", {
        day: "numeric",
        month: "long",
        year: "numeric",
      })
    : "";

  // Resolve related blogs (use recent blogs as fallback since related_blogs is always empty)
  const relatedSlugs: string[] = [];
  if (blog.related_blogs?.length > 0) {
    for (const title of blog.related_blogs) {
      const slug = resolveBlogSlug(title);
      if (slug) relatedSlugs.push(slug);
    }
  }

  // Fallback: use recent blogs
  const recentBlogs = getRecentBlogs(6);

  return (
    <div className="max-w-4xl mx-auto px-4 py-12">
      {/* Breadcrumb */}
      <nav className="flex items-center gap-2 text-sm text-secondary2 mb-8">
        <Link href="/" className="hover:text-black transition-colors">
          Home
        </Link>
        <i className="bi bi-chevron-right text-xs" />
        <Link href="/blog" className="hover:text-black transition-colors">
          Blog
        </Link>
        <i className="bi bi-chevron-right text-xs" />
        <span className="text-black line-clamp-1">{blog.blog_title}</span>
      </nav>

      {/* Header */}
      <article>
        <header className="mb-10">
          <h1 className="text-3xl md:text-4xl lg:text-5xl font-bold text-black mb-4 leading-tight">
            {blog.blog_title}
          </h1>
          {formattedDate && (
            <div className="flex items-center gap-2 text-secondary2 text-sm">
              <i className="bi bi-calendar3" />
              <span>{formattedDate}</span>
            </div>
          )}
        </header>

        {/* Body Content */}
        <div
          className="prose prose-base lg:prose-lg max-w-none mb-12
            prose-img:rounded-xl prose-img:w-full
            prose-a:text-red prose-a:no-underline hover:prose-a:underline
            prose-headings:text-black prose-headings:font-bold
            prose-p:text-secondary prose-p:leading-relaxed"
          dangerouslySetInnerHTML={{ __html: blog.body_content }}
        />
      </article>

      {/* Divider */}
      <hr className="border-line my-12" />

      {/* Related Blogs */}
      <section>
        <h2 className="text-2xl font-bold text-black mb-6">
          Related Articles
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {recentBlogs
            .filter((b) => b.slug !== blog.slug)
            .slice(0, 3)
            .map((rb) => (
              <Link
                key={rb.slug}
                href={`/blog/${rb.slug}`}
                className="group block bg-surface rounded-xl overflow-hidden hover:shadow-lg transition-all duration-300"
              >
                <div className="relative aspect-[16/10] overflow-hidden">
                  {rb.image ? (
                    <img
                      src={rb.image}
                      alt={rb.blog_title}
                      className="absolute inset-0 w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                      loading="lazy"
                    />
                  ) : (
                    <div className="absolute inset-0 bg-gradient-card" />
                  )}
                </div>
                <div className="p-4">
                  <h3 className="font-semibold text-sm text-black line-clamp-2 group-hover:text-red transition-colors">
                    {rb.blog_title}
                  </h3>
                </div>
              </Link>
            ))}
        </div>
      </section>

      {/* CTA */}
      <section className="mt-12 bg-black text-white rounded-2xl p-8 md:p-12 text-center">
        <h2 className="text-2xl md:text-3xl font-bold mb-3">
          Inspired to Travel?
        </h2>
        <p className="text-secondary2 mb-6 max-w-xl mx-auto">
          Let us help you plan the perfect trip. Get in touch with our travel
          experts today.
        </p>
        <div className="flex flex-col sm:flex-row gap-3 justify-center">
          <Link
            href="/contact"
            className="inline-flex items-center gap-2 bg-red text-white px-6 py-3 rounded-full font-medium hover:opacity-90 transition-opacity"
          >
            <i className="bi bi-envelope-fill" />
            Contact Us
          </Link>
          <a
            href="https://wa.me/"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 bg-green text-black px-6 py-3 rounded-full font-medium hover:opacity-90 transition-opacity"
          >
            <i className="bi bi-whatsapp" />
            WhatsApp
          </a>
        </div>
      </section>
    </div>
  );
}
