<?php
require_once __DIR__ . '/includes/config.php';
require_once __DIR__ . '/includes/functions.php';

$pageTitle = "TravelXploria Blog | Get Inspiring Travel Stories &amp; Tips";
$pageDesc  = "Explore the TravelXploria Blog for inspiring travel stories, destination guides, travel tips, and more.";
$ogTitleVal = "TravelXploria Blog | Get Inspiring Travel Stories &amp; Tips";
$ogDescVal  = "Explore the TravelXploria Blog for inspiring travel stories, destination guides, travel tips, and more.";
$ogUrlVal   = "https://travelxploria.com/blog";
$ogImageVal = "/icon/fav.png";

// Helper to clean Next.js image URLs to direct paths
function getCleanBlogImageUrl($url) {
    if (empty($url)) return '/icon/fav.png';
    // Fix missing slash
    $url = preg_replace('#uploads_media(Destination|Hotels|reviews|blog|Static)#', 'uploads_media/$1', $url);
    if (strpos($url, '_next/image') !== false) {
        if (preg_match('/url=([^&]+)/', $url, $m)) {
            $url = urldecode($m[1]);
        }
    }
    $url = str_replace('//uploads_media', '/uploads_media', $url);
    if (strpos($url, 'http') !== 0 && strpos($url, '/') !== 0) {
        $url = '/' . $url;
    }
    return $url;
}

// Helper to calculate time ago
function timeAgo($dateStr) {
    if (empty($dateStr)) return '';
    $timestamp = strtotime($dateStr);
    if (!$timestamp) return '';
    $diff = time() - $timestamp;
    if ($diff < 0) $diff = 0;
    
    if ($diff < 60) return 'Just now';
    $intervals = [
        31536000 => 'year',
        2592000 => 'month',
        604800 => 'week',
        86400 => 'day',
        3600 => 'hour',
        60 => 'minute'
    ];
    foreach ($intervals as $secs => $label) {
        $div = $diff / $secs;
        if ($div >= 1) {
            $n = round($div);
            return $n . ' ' . $label . ($n > 1 ? 's' : '') . ' ago';
        }
    }
    return '';
}

// Load all blog data files
$blogFiles = glob(__DIR__ . '/data/blogs/*.json');
$allBlogs = [];
$mappings = loadData('slug-mappings.json');
$titleToSlug = $mappings['blog_title_to_slug'] ?? [];

foreach ($blogFiles as $bf) {
    $data = json_decode(file_get_contents($bf), true);
    if (!$data) continue;
    $slug = $data['slug'] ?? str_replace('.json', '', basename($bf));
    $title = $data['blog_title'] ?? '';

    // Extract featured image (skip logo images)
    $featuredImg = '';
    $images = $data['images'] ?? [];
    foreach ($images as $img) {
        $url = $img['url'] ?? '';
        if (strpos($url, 'uploads_media/blog/') !== false || strpos($url, 'uploads_media/') !== false) {
            $featuredImg = $url;
            break;
        }
    }
    if (empty($featuredImg) && !empty($images)) {
        $featuredImg = $images[0]['url'] ?? '';
    }
    
    $featuredImg = getCleanBlogImageUrl($featuredImg);

    $allBlogs[] = [
        'slug'       => $slug,
        'title'      => $title,
        'desc'       => $data['description'] ?? '',
        'pub_date'   => $data['publish_date'] ?? '',
        'image'      => $featuredImg,
        'seo_title'  => $data['seo_title'] ?? '',
    ];
}

// Sort by publish_date descending (newest first)
usort($allBlogs, function($a, $b) {
    return strtotime($b['pub_date']) - strtotime($a['pub_date']);
});

// Output shell head
ob_start();
include __DIR__ . '/includes/shell-head.php';
$html = ob_get_clean();
$html = preg_replace('/<title[^>]*>.*?<\/title>/', '<title>' . e($pageTitle) . '</title>', $html, 1);
$html = preg_replace('/<meta name="description" content="[^"]*"/', '<meta name="description" content="' . e($pageDesc) . '"', $html, 1);
$html = preg_replace('/<meta property="og:title" content="[^"]*"/', '<meta property="og:title" content="' . e($ogTitleVal) . '"', $html, 1);
$html = preg_replace('/<meta name="twitter:title" content="[^"]*"/', '<meta name="twitter:title" content="' . e($ogTitleVal) . '"', $html, 1);
echo $html;
?>

<div class="min-h-screen bg-[#f8f8f8] text-gray-800 font-sans overflow-x-hidden">

<section class="text-white py-24 text-center bg-[linear-gradient(135deg,_#6A9C89,_#FF885B,_#FCDE70)]">
    <h1 class="text-5xl font-extrabold drop-shadow-lg">Our Blogs</h1>
    <p class="text-lg mt-4 text-white/80">Inspiring journeys and travel stories from around the world</p>
</section>

<div class="container mx-auto px-4 py-16">
    <?php if (empty($allBlogs)): ?>
    <div class="text-center py-20">
        <p class="text-gray-400 text-lg">No blog posts found.</p>
    </div>
    <?php else: ?>
    <div class="grid gap-10 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3">
        <?php foreach ($allBlogs as $blog): 
            $blogImg = e($blog['image']);
            $blogUrl = '/blog/' . urlencode($blog['slug']);
            $blogTitle = e($blog['title']);
            $blogDesc = e(substr($blog['desc'], 0, 150)) . (strlen($blog['desc']) > 150 ? '...' : '');
            $pubDate = !empty($blog['pub_date']) ? timeAgo($blog['pub_date']) : 'Recent';
        ?>
        <a href="<?php echo $blogUrl; ?>" class="blog-card bg-white rounded-2xl shadow-lg overflow-hidden cursor-pointer group" style="display: none; opacity: 1; transform: none; transition: transform 0.3s ease, shadow 0.3s ease;">
            <div class="relative h-56 overflow-hidden">
                <div class="relative w-full h-64">
                    <img alt="<?php echo $blogTitle; ?>" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110" loading="lazy" src="<?php echo $blogImg; ?>" onerror="this.src='/icon/fav.png';this.onerror=null;">
                </div>
                <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent opacity-70 group-hover:opacity-90 transition-opacity duration-300"></div>
                <div class="absolute bottom-4 left-4 text-white z-10 pr-4">
                    <h3 class="text-lg font-bold leading-tight"><?php echo $blogTitle; ?></h3>
                </div>
            </div>
            <div class="p-4 flex flex-col justify-between flex-grow" style="min-height: 180px;">
                <div>
                    <p class="text-xs text-gray-500 mb-1"><?php echo $pubDate; ?></p>
                    <p class="text-sm text-red font-medium mb-2">Published By Travelxploria</p>
                    <div class="text-gray-600 text-sm line-clamp-3 leading-relaxed"><?php echo $blogDesc; ?></div>
                </div>
                <div class="mt-3 text-right">
                    <span class="text-green-600 text-sm font-semibold hover:underline">Read more →</span>
                </div>
            </div>
        </a>
        <?php endforeach; ?>
    </div>
    
    <div class="text-center mt-10" id="load-more-container">
        <button id="load-more-btn" class="px-6 py-3 bg-green text-white text-sm font-bold rounded-full animated-gradient hover:bg-green-700 transition-colors shadow-md">Load More</button>
    </div>
    <?php endif; ?>
</div>

</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var cards = document.querySelectorAll('.blog-card');
    var loadMoreBtn = document.getElementById('load-more-btn');
    var visibleCount = 6;
    var increment = 6;

    // Show initial cards
    for (var i = 0; i < cards.length; i++) {
        if (i < visibleCount) {
            cards[i].style.display = 'flex';
            cards[i].style.flexDirection = 'column';
        } else {
            cards[i].style.display = 'none';
        }
    }

    if (cards.length <= visibleCount) {
        if (loadMoreBtn) loadMoreBtn.style.display = 'none';
    }

    if (loadMoreBtn) {
        loadMoreBtn.addEventListener('click', function() {
            var shownThisTurn = 0;
            for (var i = visibleCount; i < cards.length; i++) {
                if (shownThisTurn < increment) {
                    cards[i].style.display = 'flex';
                    cards[i].style.flexDirection = 'column';
                    shownThisTurn++;
                }
            }
            visibleCount += shownThisTurn;
            if (visibleCount >= cards.length) {
                loadMoreBtn.style.display = 'none';
            }
        });
    }
});
</script>

<?php include __DIR__ . '/includes/shell-foot.php'; ?>
