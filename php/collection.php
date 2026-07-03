<?php
/**
 * Collection Page Template
 * Loads travelxploria/{slug}.html (with fallback to europe.html)
 * and dynamically injects details and packages.
 */
require_once __DIR__ . '/includes/config.php';
require_once __DIR__ . '/includes/functions.php';

$slug = isset($_GET['slug']) ? $_GET['slug'] : trim(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH), '/');
if (empty($slug)) { header('Location: /'); exit; }

$page = getPageData('collections', $slug);
if (!$page) { http_response_code(404); require __DIR__ . '/index.php'; exit; }

$title    = pageTitle($page);
$desc     = pageDescription($page);
$label    = $page['collection_name'] ?: $page['title'] ?: str_replace('-', ' ', ucwords($slug));
$overview = $page['overview'] ?? '';
$packages = $page['packages'] ?? [];
$cities   = $page['cities'] ?? [];
$duration = $page['ideal_duration'] ?? '';
$mappings = loadData('slug-mappings.json');
$knownPkg = $mappings['known_package_slugs'] ?? [];

// Helper function to resolve media URLs
if (!function_exists('getMediaUrl')) {
    function getMediaUrl($path) {
        if (empty($path)) return '';
        $path = ltrim(str_replace('//', '/', $path), '/');
        if (strpos($path, 'http') === 0) return $path;
        return 'https://travelxploria.com/uploads_media/' . $path;
    }
}

// Load static HTML template
$srcFile = __DIR__ . '/travelxploria/' . $slug . '.html';
if (!file_exists($srcFile)) {
    $srcFile = __DIR__ . '/travelxploria/europe.html';
}
$html = file_get_contents($srcFile);

// Fix SEO and Meta Tags
if (empty($title)) $title = $label . ' | TravelXploria';
if (empty($desc))  $desc  = 'Explore ' . $label . ' tour packages. Best price guaranteed.';
$ogTitle = $title;
$ogDesc  = $desc;
$ogUrl   = 'https://travelxploria.com/' . $slug;

$html = preg_replace('/<title[^>]*>.*?<\/title>/', '<title>' . e($title) . '</title>', $html, 1);
$html = preg_replace('/<meta name="description" content="[^"]*"/', '<meta name="description" content="' . e($desc) . '"', $html, 1);
$html = preg_replace('/<link rel="canonical" href="[^"]*"/', '<link rel="canonical" href="' . e($ogUrl) . '"', $html, 1);

// Fix relative _next/static asset paths -> absolute (CRITICAL for CSS/JS)
$html = str_replace('href="_next/', 'href="/_next/', $html);
$html = str_replace('src="_next/', 'src="/_next/', $html);
// Clean relative ../ paths
$html = str_replace(['href="../index.html"', 'href="../'], ['href="/"', 'href="/'], $html);
$html = str_replace('src="../', 'src="/', $html);
$html = str_replace('href="../icon/', 'href="/icon/', $html);

// Clean _next/image URLs -> direct URLs
$html = preg_replace_callback('/src="[^"]*?_next\/image[^"]*"/', function($m) {
    if (preg_match('/url=([^&\s"]+)/', $m[0], $u)) return 'src="' . rawurldecode($u[1]) . '"';
    return $m[0];
}, $html);
$html = preg_replace_callback('/srcset="[^"]*?_next\/image[^"]*"/', function($m) {
    return cleanSrcSet($m[0]);
}, $html);

// Fix opacity of sidebar elements
$html = str_replace('style="opacity:0;transform:translateY(30px) translateZ(0)"', 'style="opacity: 1; transform: none;"', $html);

// Generate Banner Image
$bannerImg = '';
if (!empty($page['thumbnail'])) {
    $thumb = json_decode($page['thumbnail'], true);
    if (!empty($thumb)) {
        $bannerImg = getMediaUrl($thumb[0]['path'] ?? '');
    }
}
if (!$bannerImg) {
    $bannerImg = 'https://travelxploria.com/images/default-collection-banner.jpg';
}

// Generate Package Cards Grid
$pkgsHtml = '';
if (!empty($packages) && is_array($packages)) {
    $pkgsHtml .= '<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">';
    foreach ($packages as $pkg) {
        $ws = $pkg['web_slug'] ?? $pkg['package_name'] ?? '';
        $hasDetail = in_array($ws, $knownPkg);
        $pkgUrl = $hasDetail ? '/package/' . urlencode($ws) : '/contact?pkg=' . urlencode($pkg['package_name'] ?? '');
        
        $imgUrl = getMediaUrl($pkg['image'] ?? '');
        if (empty($imgUrl)) {
            $imgUrl = 'https://travelxploria.com/images/default-package.jpg';
        }
        
        $priceHtml = '';
        if (!empty($pkg['price'])) {
            $priceHtml = '<div class="absolute bottom-4 right-4 bg-red text-white rounded-full px-4 py-1.5 text-sm font-bold shadow-md">₹' . number_format((int)$pkg['price']) . '/-</div>';
        }
        
        $offerHtml = '';
        if (!empty($pkg['offer_title'])) {
            $offerHtml = '<div class="absolute top-4 right-4 bg-yellow text-black rounded-full px-3 py-1 text-xs font-extrabold shadow-sm">' . e($pkg['offer_title']) . '</div>';
        }
        
        $pkgsHtml .= '
        <a href="' . $pkgUrl . '" class="group bg-white rounded-2xl border border-line shadow-sm overflow-hidden hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 flex flex-col h-full">
            <div class="relative h-52 overflow-hidden bg-gray-100 flex-shrink-0">
                <img src="' . $imgUrl . '" alt="' . e($pkg['package_name']) . '" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" loading="lazy">
                ' . ($pkg['days'] > 0 ? '<div class="absolute top-4 left-4 bg-white/90 backdrop-blur-sm rounded-full px-3 py-1 text-xs font-bold text-gray-800 shadow-sm">' . $pkg['days'] . ' Days</div>' : '') . '
                ' . $priceHtml . '
                ' . $offerHtml . '
            </div>
            <div class="p-5 flex flex-col justify-between flex-grow">
                <div>
                    <h3 class="text-md font-bold text-gray-900 mb-2 group-hover:text-red transition-colors line-clamp-2 leading-snug">' . e($pkg['package_name']) . '</h3>
                    ' . (!empty($pkg['overview']) ? '<div class="text-xs text-gray-500 line-clamp-3 leading-relaxed mb-4">' . strip_tags($pkg['overview']) . '</div>' : '') . '
                </div>
                <div class="border-t border-line pt-3 flex items-center justify-between mt-auto">
                    <span class="text-xs font-semibold text-gray-400">View Details</span>
                    <span class="w-7 h-7 rounded-full bg-gray-50 flex items-center justify-center text-gray-400 group-hover:bg-red group-hover:text-white transition-colors duration-200">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M9 5l7 7-7 7"/></svg>
                    </span>
                </div>
            </div>
        </a>';
    }
    $pkgsHtml .= '</div>';
} else {
    $pkgsHtml .= '
    <div class="text-center py-16 bg-white rounded-2xl border border-line p-8 max-w-2xl mx-auto shadow-sm">
        <div class="text-5xl mb-4">🚀</div>
        <h3 class="text-xl font-bold text-gray-900 mb-2">Packages Coming Soon!</h3>
        <p class="text-gray-500 text-sm mb-6">We are currently curating amazing packages for this destination.</p>
        <div class="flex flex-col sm:flex-row gap-3 justify-center">
            <a href="/contact" class="inline-flex items-center justify-center px-6 py-2.5 bg-red text-white rounded-full text-sm font-semibold hover:bg-red-700 transition-colors shadow">Contact Our Experts</a>
            <a href="https://wa.me/919831393561" target="_blank" class="inline-flex items-center justify-center px-6 py-2.5 bg-green text-white rounded-full text-sm font-semibold hover:bg-green-700 transition-colors shadow"><i class="bi bi-whatsapp mr-2"></i> WhatsApp Us</a>
        </div>
    </div>';
}

// Generate the complete collection body HTML
$collectionHtml = '
<div class="text-xs text-gray-400 mb-4"><a href="/" class="hover:text-red transition-colors">Home</a> <span class="mx-1">/</span> <span class="text-gray-600 font-medium">' . e($label) . '</span></div>

<div class="relative w-full h-[200px] md:h-[280px] rounded-3xl overflow-hidden mb-8 shadow-md">
    <img src="' . $bannerImg . '" alt="' . e($label) . '" class="w-full h-full object-cover" />
    <div class="absolute inset-0 bg-gradient-to-t from-black/85 via-black/35 to-transparent"></div>
    <div class="absolute bottom-0 left-0 w-full p-6 md:p-10 text-white">
        <h1 class="text-2xl md:text-5xl font-black tracking-tight drop-shadow-md mb-2">' . e($label) . ' Tour Packages</h1>
        ' . ($duration ? '
        <div class="inline-flex items-center gap-1.5 bg-yellow/85 text-black px-3.5 py-1 rounded-full text-[10px] font-extrabold tracking-wider uppercase shadow-sm">
            <i class="bi bi-clock-fill"></i> Ideal Duration: ' . e($duration) . '
        </div>' : '') . '
    </div>
</div>

' . ($overview ? '
<div class="bg-[#fcfcfc] rounded-2xl border border-line p-6 mb-8 shadow-sm">
    <h2 class="text-md font-bold text-gray-900 mb-3 border-b border-line pb-2">About ' . e($label) . ' Tours</h2>
    <div class="text-xs text-gray-600 leading-relaxed prose max-w-none">' . $overview . '</div>
</div>' : '') . '

<div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
    <!-- Sidebar Column -->
    <div class="lg:col-span-1 flex flex-col gap-6">
        <!-- Stats Card -->
        <div class="bg-white rounded-2xl border border-line p-5 shadow-sm">
            <h3 class="text-xs font-bold text-gray-900 mb-4 border-b border-line pb-2 uppercase tracking-wider">Trip Planner</h3>
            <div class="flex flex-col gap-4">
                ' . ($duration ? '
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-full bg-light-green flex items-center justify-center text-green text-base"><i class="bi bi-calendar-check-fill"></i></div>
                    <div>
                        <div class="text-[9px] text-gray-400 font-semibold uppercase leading-none">Ideal Duration</div>
                        <div class="text-xs font-bold text-gray-800 mt-1">' . e($duration) . '</div>
                    </div>
                </div>' : '') . '
                ' . (!empty($page['ideal_session']) ? '
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-full bg-light-yellow flex items-center justify-center text-yellow-600 text-base"><i class="bi bi-cloud-sun-fill"></i></div>
                    <div>
                        <div class="text-[9px] text-gray-400 font-semibold uppercase leading-none">Best Season</div>
                        <div class="text-xs font-bold text-gray-800 mt-1">' . e($page['ideal_session']) . '</div>
                    </div>
                </div>' : '') . '
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-full bg-blue-50 flex items-center justify-center text-blue-600 text-base"><i class="bi bi-tags-fill"></i></div>
                    <div>
                        <div class="text-[9px] text-gray-400 font-semibold uppercase leading-none">Total Packages</div>
                        <div class="text-xs font-bold text-gray-800 mt-1">' . count($packages) . ' Available</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Destinations Covered -->
        ' . (!empty($cities) ? '
        <div class="bg-white rounded-2xl border border-line p-5 shadow-sm">
            <h3 class="text-xs font-bold text-gray-900 mb-3 border-b border-line pb-2 uppercase tracking-wider">Destinations Covered</h3>
            <div class="flex flex-wrap gap-2">
                ' . implode('', array_map(function($c) {
                    return '<span class="bg-gray-50 border border-line rounded-lg px-2.5 py-1 text-xs text-gray-600 font-medium">' . e($c) . '</span>';
                }, $cities)) . '
            </div>
        </div>' : '') . '
        
        <!-- Sticky Help Card -->
        <div class="bg-gradient-to-br from-[#102E50] to-[#1a3a5c] rounded-2xl p-5 text-white shadow-md relative overflow-hidden">
            <div class="absolute right-[-20px] bottom-[-20px] text-white/5 text-9xl pointer-events-none"><i class="bi bi-headset"></i></div>
            <h3 class="text-sm font-bold mb-2">Need Expert Help?</h3>
            <p class="text-[11px] text-gray-300 mb-4 leading-relaxed">Let our travel specialists customize the perfect ' . e($label) . ' tour itinerary for you!</p>
            <div class="flex flex-col gap-2">
                <a href="tel:+919831393561" class="bg-white text-[#102E50] text-xs font-bold py-2.5 px-4 rounded-xl text-center hover:bg-gray-100 transition-colors shadow flex items-center justify-center gap-2">
                    <i class="bi bi-telephone-fill"></i> Call +91 9831393561
                </a>
                <a href="/contact" class="border border-white/40 text-white text-xs font-bold py-2.5 px-4 rounded-xl text-center hover:bg-white/10 transition-colors flex items-center justify-center gap-2">
                    Send Enquiry
                </a>
            </div>
        </div>
    </div>
    
    <!-- Package Listing Grid Column -->
    <div class="lg:col-span-3">
        <div class="flex items-center justify-between mb-4 border-b border-line pb-3">
            <span class="text-[10px] font-bold text-gray-400 uppercase tracking-wider">' . count($packages) . ' packages matching ' . e($label) . '</span>
        </div>
        ' . $pkgsHtml . '
    </div>
</div>';

// Inject Dynamic Content into shop-product wrapper
$startTag = '<div class="shop-product ';
$endTag   = '<div class="md:hidden fixed bottom-[60px]';
$startPos = strpos($html, $startTag);
$endPos   = strpos($html, $endTag);

if ($startPos !== false && $endPos !== false) {
    $shopProductHtml = '<div class="shop-product breadcrumb1 lg:py-5 md:py-5 py-5 md:main-bg-contain bg-[#f8f8f8]">
        <div class="container mx-auto px-4 md:px-20">
            ' . $collectionHtml . '
        </div>
    </div>';
    
    $html = substr($html, 0, $startPos) . $shopProductHtml . substr($html, $endPos);
}

// Inject JS before </body>
$tiersJson = json_encode($prices ?? []);
ob_start();
?><script>
(function(){
var d=document;
var cb=d.querySelector('.fixed.bottom-0.left-0.w-full.bg-black.text-white');
if(cb){
  if(localStorage.getItem('cookieConsent')){
    cb.style.display='none';
  } else {
    cb.querySelectorAll('button').forEach(function(b,i){
      b.onclick=function(){
        localStorage.setItem('cookieConsent',i===0?'accepted':'rejected');
        cb.style.display='none';
      };
    });
  }
}

// Mobile menu drawer
var menuIcon = d.querySelector('.menu-mobile-icon');
var mobileMenu = d.querySelector('#menu-mobile');
var closeMenu = d.querySelector('.close-menu-mobile-btn');
if (mobileMenu) {
  mobileMenu.style.display = 'none';
  if (menuIcon) {
    menuIcon.addEventListener('click', function() {
      mobileMenu.style.display = 'block';
    });
  }
  if (closeMenu) {
    closeMenu.addEventListener('click', function() {
      mobileMenu.style.display = 'none';
    });
  }
}

// Force full page reload for static PHP site navigation
d.addEventListener('click', function(e) {
  var a = e.target.closest('a');
  if (a && a.href) {
    var url = new URL(a.href, window.location.href);
    if (url.origin === window.location.origin) {
      if (url.pathname === window.location.pathname && url.hash) {
        return;
      }
      e.stopPropagation();
      window.location.href = a.href;
    }
  }
}, true);
})();
</script>
<?php
$jsScript = ob_get_clean();
$html = str_replace('</body>', $jsScript . '</body>', $html);

echo $html;
