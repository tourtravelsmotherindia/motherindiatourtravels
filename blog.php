<?php
require_once __DIR__ . '/includes/config.php';
require_once __DIR__ . '/includes/functions.php';

$slug = isset($_GET['slug']) ? $_GET['slug'] : trim(str_replace('/blog/', '', parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)), '/');
if (empty($slug)) { header('Location: /blog'); exit; }

$page = getPageData('blogs', $slug);
if (!$page) { http_response_code(404); header('Location: /blog'); exit; }

$blogTitle  = $page['blog_title'] ?? str_replace('-', ' ', ucwords($slug));
$desc       = $page['description'] ?? $blogTitle;
$pubDate    = $page['publish_date'] ?? '';
$body       = $page['body_content'] ?? '';
$related    = $page['related_blogs'] ?? [];
$images     = $page['images'] ?? [];

$title   = $blogTitle . ' | TravelXploria';
$ogTitle = $blogTitle;

// Strip the leading "Published by travelxploria on ..." line from body_content (blog.php adds its own)
$body = preg_replace('#^<p>Published by\s*<!-- -->travelxploria<!-- -->\s*on\s*<!-- -->[^<]*<!-- --></p>#', '', $body);

// Fix relative .html links in body_content
$body = str_replace(['href="index.html"','href="about-us.html"','href="contact.html"','href="faq.html"','href="Blog.html"'],
                    ['href="/"','href="/about-us"','href="/contact"','href="/faq"','href="/blog"'], $body);
$body = preg_replace('/href="([a-z][a-zA-Z0-9\-]+)\.html"/', 'href="/$1"', $body);
$body = preg_replace('/href="package\/([^"]+)\.html"/', 'href="/package/$1"', $body);
$body = preg_replace('/href="blog\/([^"]+)\.html"/', 'href="/blog/$1"', $body);

// Fix _next/image URLs in body_content -> direct image URLs
$body = preg_replace_callback('/src="[^"]*_next\/image[^"]*"/', function($m) {
    if (preg_match('/url=([^&\s"]+)/', $m[0], $u)) return 'src="' . rawurldecode($u[1]) . '"';
    return $m[0];
}, $body);
$body = preg_replace_callback('/srcset="[^"]*_next\/image[^"]*"/', function($m) {
    if (preg_match('/url=([^&\s,]+)/', $m[0], $u)) return 'srcset="' . rawurldecode($u[1]) . ' 1x"';
    return $m[0];
}, $body);

// Load slug mappings for related blog URL resolution
$mappings = loadData('slug-mappings.json');
$titleToSlug = $mappings['blog_title_to_slug'] ?? [];

// Output shell head with SEO overrides
ob_start();
include __DIR__ . '/includes/shell-head.php';
$html = ob_get_clean();
$html = preg_replace('/<title[^>]*>.*?<\/title>/', '<title>' . e($title) . '</title>', $html, 1);
$html = preg_replace('/<meta name="description" content="[^"]*"/', '<meta name="description" content="' . e($desc) . '"', $html, 1);
$html = preg_replace('/<meta property="og:title" content="[^"]*"/', '<meta property="og:title" content="' . e($ogTitle) . '"', $html, 1);
$html = preg_replace('/<meta name="twitter:title" content="[^"]*"/', '<meta name="twitter:title" content="' . e($ogTitle) . '"', $html, 1);
echo $html;
?>

<div class="min-h-screen bg-[#f8f8f8] text-gray-800 font-sans overflow-x-hidden">

<section class="relative pt-[110px] pb-8 bg-white">
    <div class="container mx-auto px-4 md:px-20 max-w-4xl">
        <div class="text-sm text-gray-500 mb-4"><a href="/" class="hover:text-red transition-colors">Home</a> <span class="mx-2">/</span> <a href="/blog" class="hover:text-red transition-colors">Blog</a> <span class="mx-2">/</span> <span class="text-gray-800"><?php echo e($blogTitle); ?></span></div>
        <h1 class="text-4xl font-bold text-center mb-4"><?php echo e($blogTitle); ?></h1>
        <?php if ($pubDate): ?><p class="text-gray-600 text-center">Published by Travelxploria on <?php echo e($pubDate); ?></p><?php endif; ?>
    </div>
</section>

<section class="py-8 bg-white"><div class="container mx-auto px-4 md:px-20 max-w-4xl">
    <?php echo $body; ?>
</div></section>

<?php if (!empty($related)): ?>
<section class="py-12 bg-white"><div class="container mx-auto px-4 md:px-20 max-w-6xl">
    <h2 class="text-2xl font-semibold mb-8 text-gray-900">Related Blogs</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <?php foreach (array_slice($related, 0, 6) as $rbTitle):
            $rbSlug = $titleToSlug[$rbTitle] ?? strtolower(preg_replace('/[^a-zA-Z0-9]+/', '-', trim($rbTitle)));
            $rbSlug = trim($rbSlug, '-');
        ?>
        <a href="/blog/<?php echo urlencode($rbSlug); ?>" class="group bg-white border border-gray-200 rounded-xl overflow-hidden hover:shadow-lg transition-all duration-300"><div class="p-6"><h3 class="text-lg font-bold text-gray-900 group-hover:text-red transition-colors line-clamp-2"><?php echo e($rbTitle); ?></h3><div class="mt-3 text-red font-medium text-sm flex items-center gap-1">Read More <span>→</span></div></div></a>
        <?php endforeach; ?>
    </div>
</div></section>
<?php endif; ?>

<section class="py-16 bg-gradient-to-r from-[#102E50] to-[#1a3a5c]"><div class="container mx-auto px-4 md:px-20 text-center">
    <h2 class="text-3xl md:text-4xl font-extrabold text-white mb-6">Inspired to Travel?</h2>
    <p class="text-gray-300 text-lg mb-8 max-w-2xl mx-auto">Let our travel experts create the perfect itinerary for your next adventure.</p>
    <div class="flex flex-col sm:flex-row gap-4 justify-center">
        <a href="/contact" class="inline-flex items-center justify-center px-8 py-4 bg-red text-white rounded-full font-bold text-lg hover:bg-red-700 transition-colors">Plan Your Trip</a>
        <a href="https://wa.me/919831393561" target="_blank" class="inline-flex items-center justify-center px-8 py-4 bg-green text-white rounded-full font-bold text-lg hover:bg-green-700 transition-colors"><i class="bi bi-whatsapp mr-2"></i> Chat on WhatsApp</a>
    </div>
</div></section>

</div>

<?php include __DIR__ . '/includes/shell-foot.php'; ?>
