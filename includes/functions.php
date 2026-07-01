<?php
/**
 * Helper Functions
 */

/**
 * Load JSON data file
 */
function loadData($path) {
    $file = __DIR__ . '/../data/' . $path;
    if (!file_exists($file)) return null;
    return json_decode(file_get_contents($file), true);
}

/**
 * Get page data by slug
 */
function getPageData($type, $slug) {
    return loadData("{$type}/{$slug}.json");
}

/**
 * Get menu structure
 */
function getMenu() {
    return loadData('menu.json');
}

/**
 * Escape HTML output
 */
function e($str) {
    return htmlspecialchars($str, ENT_QUOTES, 'UTF-8');
}

/**
 * Clean Next.js image URL to direct URL
 */
function cleanImageUrl($url) {
    // Already a direct URL
    if (strpos($url, '/_next/image') === false) return $url;
    // Parse the url= parameter
    if (preg_match('/url=([^&]+)/', $url, $m)) {
        return urldecode($m[1]);
    }
    return $url;
}

/**
 * Clean Next.js srcSet to direct src
 */
function cleanSrcSet($srcset) {
    if (empty($srcset)) return '';
    // Extract the largest size URL
    preg_match_all('/url=([^&\s]+)/', $srcset, $matches);
    if (!empty($matches[1])) {
        $url = urldecode(end($matches[1]));
        // Remove Next.js wrapper for local images
        $url = preg_replace('#^https?://[^/]+/_next/image\?url=#', '', $url);
        return urldecode($url);
    }
    return $srcset;
}

/**
 * Build canonical URL
 */
function canonicalUrl($path) {
    return rtrim(BASE_URL, '/') . '/' . ltrim($path, '/');
}

/**
 * Get page title
 */
function pageTitle($data, $default = '') {
    if (!empty($data['seo_title'])) return $data['seo_title'];
    if (!empty($data['title'])) return $data['title'];
    if (!empty($data['package_name'])) return $data['package_name'] . ' | ' . SITE_NAME;
    if (!empty($data['blog_title'])) return $data['blog_title'] . ' | ' . SITE_NAME;
    return $default ?: SITE_NAME;
}

/**
 * Get page description
 */
function pageDescription($data, $default = '') {
    if (!empty($data['description'])) return $data['description'];
    return $default ?: 'TravelXploria - Your trusted travel partner for domestic and international tours.';
}

/**
 * Get current request path
 */
function currentPath() {
    $path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
    return trim($path, '/');
}

/**
 * Get current slug from URL
 */
function currentSlug() {
    $path = currentPath();
    $parts = explode('/', $path);
    return end($parts);
}
