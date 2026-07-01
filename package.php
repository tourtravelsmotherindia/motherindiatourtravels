<?php
require_once __DIR__ . '/includes/config.php';
require_once __DIR__ . '/includes/functions.php';

$slug = isset($_GET['slug']) ? $_GET['slug'] : trim(str_replace('/package/', '', parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)), '/');
if (empty($slug)) { header('Location: /'); exit; }

$page = getPageData('packages', $slug);
if (!$page) { http_response_code(404); header('Location: /'); exit; }

$title     = !empty($page['seo_title']) ? $page['seo_title'] : ($page['package_name'] ?? $slug) . ' | TravelXploria';
$desc      = !empty($page['description']) ? $page['description'] : 'Book ' . ($page['package_name'] ?? $slug);
$prices    = $page['price'] ?? [];
$overview  = $page['overview'] ?? '';
$itinerary = $page['itinerary'] ?? [];

// Load exact original HTML as template
$srcFile = __DIR__ . '/travelxploria/package/' . $slug . '.html';
if (!file_exists($srcFile)) { http_response_code(404); echo 'Package not found'; exit; }
$html = file_get_contents($srcFile);

// Fix relative _next/static asset paths -> absolute (CRITICAL for CSS/JS)
$html = str_replace('href="_next/', 'href="/_next/', $html);
$html = str_replace('src="_next/', 'src="/_next/', $html);
// Clean relative ../ paths
$html = str_replace(['href="../index.html"', 'href="../'], ['href="/"', 'href="/'], $html);
$html = str_replace('src="../', 'src="/', $html);
$html = str_replace('href="../icon/', 'href="/icon/', $html);

// Fix opacity of product info sidebar so it shows up on page load
$html = str_replace('style="opacity:0;transform:translateY(30px) translateZ(0)"', 'style="opacity: 1; transform: none;"', $html);

// Clean _next/image URLs -> direct URLs
$html = preg_replace_callback('/src="[^"]*?_next\/image[^"]*"/', function($m) {
    if (preg_match('/url=([^&\s"]+)/', $m[0], $u)) return 'src="' . rawurldecode($u[1]) . '"';
    return $m[0];
}, $html);
$html = preg_replace('/(?:image)?[Ss]rc[Ss]et="[^"]*?_next\/image[^"]*"/', '', $html);

// Fix external image refs to local
$html = str_replace(
    ['https://www.travelxploria.com/images/logo.png','https://travelxploria.com/images/logo.png'],
    '/images/logo.png', $html
);
$html = str_replace(
    ['https://www.travelxploria.com/images/mob-logo.png','https://travelxploria.com/images/mob-logo.png'],
    '/images/mob-logo.png', $html
);
$html = str_replace(
    ['https://www.travelxploria.com/images/logo-footer.png','https://travelxploria.com/images/logo-footer.png'],
    '/images/logo-footer.png', $html
);

// Fix missing / in uploads_mediaDestination and uploads_mediaHotels
$html = preg_replace('/(uploads_media)(Destination|Hotels|reviews)/', '$1/$2', $html);

// Remove HTTrack injection
$html = preg_replace('/<!-- Added by HTTrack --><meta [^>]*><!-- \/Added by HTTrack -->/', '', $html);

// Remove mirror comments
$html = preg_replace('/<!-- Mirrored from [^-]+-->/', '', $html);

// Remove __NEXT_DATA__ script
$html = preg_replace('/<script id="__NEXT_DATA__" type="application\/json">.*?<\/script>/s', '', $html);

// Fix internal .html links
$html = preg_replace('/href="([a-zA-Z][a-zA-Z0-9\-]+)\.html"/', 'href="/$1"', $html);
$html = preg_replace('/href="package\/([^"]+)\.html"/', 'href="/package/$1"', $html);
$html = preg_replace('/href="blog\/([^"]+)\.html"/', 'href="/blog/$1"', $html);

// Inject SEO meta
$html = preg_replace('/<title[^>]*>.*?<\/title>/', '<title>' . e($title) . '</title>', $html, 1);
$html = preg_replace('/<meta name="description"[^>]*>/', '<meta name="description" content="' . e($desc) . '" data-next-head="">', $html, 1);
$html = preg_replace('/<meta property="og:title"[^>]*>/', '<meta property="og:title" content="' . e($title) . '" data-next-head="">', $html, 1);
$html = preg_replace('/<meta property="og:description"[^>]*>/', '<meta property="og:description" content="' . e($desc) . '" data-next-head="">', $html, 1);
$html = preg_replace('/<meta name="twitter:title"[^>]*>/', '<meta name="twitter:title" content="' . e($title) . '" data-next-head="">', $html, 1);
$html = preg_replace('/<meta name="twitter:description"[^>]*>/', '<meta name="twitter:description" content="' . e($desc) . '" data-next-head="">', $html, 1);
$html = preg_replace('/<meta name="keywords"[^>]*>/', '<meta name="keywords" content="' . e($title) . '" data-next-head="">', $html, 1);
$html = preg_replace('/<link rel="canonical"[^>]*>/', '<link rel="canonical" href="https://travelxploria.com/package/' . e($slug) . '" data-next-head="">', $html, 1);

// Inject price
if (is_array($prices) && !empty($prices)) {
    $defPrice = '';
    if (is_array($prices[0])) $defPrice = $prices[0]['actual'] ?? $prices[0]['old_price'] ?? '';
    if ($defPrice) {
        $html = preg_replace('/₹<!-- *-->\/-/', '₹' . number_format((int)$defPrice) . '/-', $html);
    }
}

// Inject Trip Overview
if ($overview) {
    $html = str_replace('<div class="leading-tight"></div>', '<div class="leading-tight">' . $overview . '</div>', $html);
}

if (!function_exists('getMediaUrl')) {
    function getMediaUrl($path) {
        if (empty($path)) return '';
        $path = ltrim(str_replace('//', '/', $path), '/');
        if (strpos($path, 'http') === 0) return $path;
        return 'https://travelxploria.com/uploads_media/' . $path;
    }
}

// Build dynamic itinerary tab content
$itinHtml = '';
if (is_array($itinerary) && !empty($itinerary)) {
    $dayNum = 0;
    foreach ($itinerary as $city) {
        $cityName = $city['city'] ?? '';
        $country  = $city['country'] ?? '';
        $dayCount = isset($city['day_details']) ? count($city['day_details']) : 0;
        if ($dayCount === 0) continue;
        
        // Get banner image
        $bannerImg = '';
        if (!empty($city['banner_image']) && is_array($city['banner_image'])) {
            $bannerImg = getMediaUrl($city['banner_image'][0]['path'] ?? '');
        }
        if (!$bannerImg && !empty($page['images']) && is_array($page['images'])) {
            $bannerImg = getMediaUrl($page['images'][0]['path'] ?? '');
        }
        if (!$bannerImg) {
            $bannerImg = 'https://travelxploria.com/images/default-destination.jpg';
        }
        
        $itinHtml .= '<div class="container-full section-swiper-navigation md:pt-4 pt-4 rounded-2xl mb-4">';
        $itinHtml .= '<div class="relative w-full h-[200px] md:h-[300px] overflow-hidden rounded-2xl">';
        $itinHtml .= '<img alt="' . e($cityName) . '" class="w-full h-full object-cover" src="' . $bannerImg . '" />';
        $itinHtml .= '<div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent"></div>';
        $itinHtml .= '<div class="absolute bottom-0 left-0 w-full p-6 text-white text-center md:text-left">';
        $itinHtml .= '<div class="flex flex-col md:flex-row items-center md:items-end gap-2 justify-center md:justify-start">';
        $itinHtml .= '<span class="text-secondary2 font-extrabold text-5xl md:text-7xl leading-none">' . $dayCount . '</span>';
        $itinHtml .= '<div class="flex flex-col text-left">';
        $itinHtml .= '<span class="leading-none text-xs md:text-sm font-semibold tracking-wider text-gray-300 uppercase">Days in</span>';
        $itinHtml .= '<span class="leading-tight text-xl md:text-2xl font-bold text-red">' . e($cityName) . ($country ? ', ' . e($country) : '') . '</span>';
        $itinHtml .= '</div>';
        $itinHtml .= '</div>';
        $itinHtml .= '</div>';
        $itinHtml .= '</div>';
        $itinHtml .= '</div>';
        
        $itinHtml .= '<div class="max-w-3xl mx-auto my-5 p-0">';
        foreach ($city['day_details'] ?? [] as $day) {
            $dayNum++;
            $dayTitle   = $day['day_title'] ?? "Day $dayNum";
            $daySummary = $day['day_summary'] ?? '';
            
            // Build elements (transfers, hotels, activities)
            $elementsHtml = '';
            if (!empty($day['day_element']) && is_array($day['day_element'])) {
                foreach ($day['day_element'] as $elem) {
                    if ($elem['type'] === 'transfer' && !empty($elem['transferDetails'])) {
                        $t = $elem['transferDetails'];
                        $elementsHtml .= '
                        <div class="p-4 my-4 text-md text-secondary font-light bg-light-yellow rounded-[10px] border border-yellow/20">
                          <div class="flex flex-wrap gap-4 mb-2">
                            <div class="item flex items-center gap-2">
                              <i class="bi bi-taxi-front-fill text-yellow-600 text-lg"></i>
                              <span class="font-semibold text-sm text-red">' . e($t['transferType']) . ' Transfer</span>
                            </div>
                          </div>
                          <div class="font-bold text-black text-sm mb-3">' . e($t['transferIn']) . ' Transfer from ' . e($t['from']) . ' to ' . e($t['to']) . '</div>
                          <div class="flex gap-2 w-full items-stretch">
                            <div class="flex flex-col items-center justify-center w-8">
                              <span class="text-red text-lg"><i class="bi bi-geo-alt-fill"></i></span>
                              <div class="border-l border-dotted border-gray-400 h-10 my-1"></div>
                              <span class="text-gray-600 text-lg"><i class="bi bi-geo-alt-fill"></i></span>
                            </div>
                            <div class="flex flex-col justify-between py-1 flex-1">
                              <div class="bg-white px-3 py-1.5 rounded-[5px] shadow-sm border border-gray-100">
                                <div class="text-red font-semibold text-[10px] uppercase">From</div>
                                <div class="text-xs text-gray-800 font-semibold">' . e($t['from']) . '</div>
                              </div>
                              <div class="bg-white px-3 py-1.5 rounded-[5px] shadow-sm border border-gray-100 mt-2">
                                <div class="text-red font-semibold text-[10px] uppercase">To</div>
                                <div class="text-xs text-gray-800 font-semibold">' . e($t['to']) . '</div>
                              </div>
                            </div>
                          </div>
                        </div>';
                    } elseif ($elem['type'] === 'hotel' && !empty($elem['groupedData'])) {
                        $elementsHtml .= '
                        <div class="my-4 border-t border-line pt-4">
                          <div class="flex justify-between items-center mb-2">
                            <div class="font-bold text-black text-sm">Check-in at Hotel</div>
                            <div class="flex items-center flex-wrap gap-2">
                              <div class="color-item px-3 py-1 flex items-center justify-center gap-2 rounded-full border border-line cursor-pointer bg-selected text-xs transition-colors duration-200">3 Star</div>
                              <div class="color-item px-3 py-1 flex items-center justify-center gap-2 rounded-full border border-line cursor-pointer text-xs transition-colors duration-200">4 Star</div>
                              <div class="color-item px-3 py-1 flex items-center justify-center gap-2 rounded-full border border-line cursor-pointer text-xs transition-colors duration-200">5 Star</div>
                            </div>
                          </div>';
                        
                        foreach ([3, 4, 5] as $tier) {
                            if (!empty($elem['groupedData'][$tier])) {
                                foreach ($elem['groupedData'][$tier] as $hotel) {
                                    $hotelName = $hotel['h_name'] ?? '';
                                    $hotelImg = '';
                                    if (!empty($hotel['images'])) {
                                        $hotelImages = json_decode($hotel['images'], true);
                                        if (!empty($hotelImages)) {
                                            $hotelImg = getMediaUrl($hotelImages[0]['path'] ?? '');
                                        }
                                    }
                                    if (!$hotelImg) {
                                        $hotelImg = 'https://travelxploria.com/images/placeholder-hotel.jpg';
                                    }
                                    $displayStyle = ($tier === 3) ? 'display:block' : 'display:none';
                                    $elementsHtml .= '
                                    <div class="hotel-tier-card hotel-tier-' . $tier . '" style="' . $displayStyle . '">
                                      <div class="p-3 px-0 text-md mt-0 text-secondary font-light bg-white rounded-[10px]">
                                        <div class="flex justify-between gap-4 items-center mt-1 py-2 px-3 rounded-[4px]" style="background:#efefef">
                                          <div>
                                            <div class="font-semibold text-xs text-black" style="font-size:10px">Check In</div>
                                            <div class="font-bold text-xs text-black">3:00 PM</div>
                                          </div>
                                          <div class="font-semibold text-xs text-gray-600">' . e($hotel['room_type'] ?? 'Standard Room') . '</div>
                                          <div>
                                            <div class="font-semibold text-xs text-black" style="font-size:10px">Check Out</div>
                                            <div class="font-bold text-xs text-black">12:00 PM</div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-2">
                                        <div class="bg-yellowlight p-3 text-center rounded-md shadow-sm border border-gray-100">
                                          <div class="relative w-full h-[150px] rounded-md overflow-hidden">
                                            <img alt="' . e($hotelName) . '" class="w-full h-full object-cover" src="' . $hotelImg . '" />
                                            <div class="absolute bottom-0 left-0 w-full bg-gradient-to-t from-black/60 to-transparent p-2 text-white">
                                              <div class="flex justify-center gap-1 items-center w-full">
                                                <span class="text-yellow-400 text-xs"><i class="bi bi-star-fill"></i></span>
                                                <div class="leading-none text-white text-[10px] font-semibold">' . $tier . ' /5</div>
                                              </div>
                                            </div>
                                          </div>
                                          <div class="text-black font-semibold mt-2 text-xs">' . e($hotelName) . '</div>
                                        </div>
                                      </div>
                                    </div>';
                                }
                            }
                        }
                        $elementsHtml .= '</div>';
                    } elseif ($elem['type'] === 'activity' && !empty($elem['rowData'])) {
                        $act = $elem['rowData'];
                        $actName = $act['a_name'] ?? '';
                        $actDetails = $act['a_details'] ?? '';
                        $actImg = '';
                        if (!empty($act['images'])) {
                            $actImages = json_decode($act['images'], true);
                            if (!empty($actImages)) {
                                $actImg = getMediaUrl($actImages[0]['path'] ?? '');
                            }
                        }
                        $elementsHtml .= '
                        <div class="p-4 my-4 text-md text-secondary font-light bg-light-green rounded-[10px] border border-green/20">
                          <div class="flex flex-wrap gap-4 mb-2">
                            <div class="item flex items-center gap-2">
                              <i class="bi bi-ticket-detailed-fill text-green-600 text-lg"></i>
                              <span class="font-semibold text-sm text-green-800">Activity: ' . e($actName) . '</span>
                            </div>
                          </div>';
                        if ($actImg) {
                            $elementsHtml .= '
                            <div class="w-full h-[180px] rounded-md overflow-hidden my-3">
                              <img alt="' . e($actName) . '" class="w-full h-full object-cover" src="' . $actImg . '" />
                            </div>';
                        }
                        $elementsHtml .= '
                          <div class="text-xs text-gray-700 leading-relaxed font-light">' . $actDetails . '</div>
                        </div>';
                    }
                }
            }
            
            $itinHtml .= '
            <div class="mb-4 border border-line shadow-cumtom rounded-lg overflow-hidden shadow-sm bg-white">
              <button class="accordion-toggle w-full flex justify-between items-center p-3 focus:outline-none transition-all duration-300 hover:bg-gray-50 text-left">
                <div class="flex flex-col md:flex-row gap-2 items-start md:items-center">
                  <span class="text-xs font-semibold bg-green px-3 py-1 rounded-full text-black">Day ' . $dayNum . '</span>
                  <span class="text-[14px] font-semibold text-gray-800">' . e($dayTitle) . '</span>
                </div>
                <span class="text-md transform transition-transform duration-300 accordion-arrow">
                  <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" class="text-xl w-5 h-5 text-gray-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                    <path d="M207.029 381.476L12.686 187.132c-9.373-9.373-9.373-24.569 0-33.941l22.667-22.667c9.357-9.357 24.522-9.375 33.901-.04L224 284.505l154.745-154.021c9.379-9.335 24.544-9.317 33.901.04l22.667 22.667c9.373 9.373 9.373 24.569 0 33.941L240.971 381.476c-9.373 9.372-24.569 9.372-33.942 0z"></path>
                  </svg>
                </span>
              </button>
              <div class="accordion-content overflow-hidden transition-[max-height] duration-300 max-h-0">
                <div class="md:p-5 lg:p-5 p-4 bg-white border-t border-line">
                  <div class="py-3 text-sm text-gray-700 leading-relaxed font-light">' . $daySummary . '</div>
                  ' . $elementsHtml . '
                </div>
              </div>
            </div>';
        }
        $itinHtml .= '</div>';
    }
}

if ($itinHtml) {
    $startTag = '<div class="desc-item description open">';
    $endTag   = '<div class="desc-item specifications ';
    $startPos = strpos($html, $startTag);
    $endPos   = strpos($html, $endTag);
    if ($startPos !== false && $endPos !== false) {
        $newItinTabHtml = $startTag . "\n" . $itinHtml . "\n</div>\n";
        $html = substr($html, 0, $startPos) . $newItinTabHtml . substr($html, $endPos);
    }
}

// Inject JS before </body>
$tiersJson = json_encode($prices);
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

// Tab Switching logic
var tabHeaders = d.querySelectorAll('.menu-tab1 .tab-item');
var tabPanels = d.querySelectorAll('.desc-block .desc-item');
tabHeaders.forEach(function(tab, index) {
  tab.addEventListener('click', function() {
    tabHeaders.forEach(function(t) { t.classList.remove('active'); });
    this.classList.add('active');
    tabPanels.forEach(function(panel, pIndex) {
      if (pIndex === index) {
        panel.classList.add('open');
      } else {
        panel.classList.remove('open');
      }
    });
  });
});

// Accordion open/close logic
d.addEventListener('click', function(e) {
  var btn = e.target.closest('.accordion-toggle') || e.target.closest('button');
  if (btn) {
    var container = btn.parentElement;
    if (container && container.classList.contains('border-line') && container.classList.contains('rounded-lg')) {
      e.preventDefault();
      btn.classList.toggle('active');
      
      var arrow = btn.querySelector('.accordion-arrow') || btn.querySelector('svg');
      if (arrow) {
        arrow.style.transform = btn.classList.contains('active') ? 'rotate(180deg)' : 'rotate(0deg)';
        arrow.style.transition = 'transform 0.3s ease';
      }
      
      var content = btn.nextElementSibling;
      if (content) {
        if (btn.classList.contains('active')) {
          content.style.maxHeight = content.scrollHeight + "px";
          content.classList.remove('max-h-0');
        } else {
          content.style.maxHeight = "0px";
          content.classList.add('max-h-0');
        }
      }
    }
  }
});

// Hotel Tier Selection & Price Selector logic
var tiers=<?php echo $tiersJson; ?>;
d.querySelectorAll('.color-item').forEach(function(item){
  item.addEventListener('click', function(){
    var match = this.textContent.trim().match(/\d/);
    if (!match) return;
    var rating = match[0];
    
    // Sync active color items
    d.querySelectorAll('.color-item').forEach(function(btn){
      var btnMatch = btn.textContent.trim().match(/\d/);
      if (btnMatch && btnMatch[0] === rating) {
        btn.classList.add('bg-selected');
      } else {
        btn.classList.remove('bg-selected');
      }
    });
    
    // Toggle hotel tier cards
    d.querySelectorAll('.hotel-tier-card').forEach(function(card){
      if (card.classList.contains('hotel-tier-' + rating)) {
        card.style.display = 'block';
      } else {
        card.style.display = 'none';
      }
    });
    
    // Toggle main product price if tiers match
    if (tiers && tiers.length) {
      var t = tiers.find(function(T){ return String(T.rating) === rating; });
      if (t) {
        d.querySelectorAll('.product-price').forEach(function(el){
          el.innerHTML = '\u20b9' + parseInt(t.actual).toLocaleString() + '/- <span class="text-sm font-normal">Per Person</span>';
        });
      }
    }
  });
});

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
})();
</script>
<?php
$jsScript = ob_get_clean();
$html = str_replace('</body>', $jsScript . '</body>', $html);

echo $html;
