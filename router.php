<?php
/**
 * Router for PHP built-in server
 * Usage: php -S localhost:8000 router.php
 *
 * Also works without explicit router:
 *   php -S localhost:8000  (fallback routes to index.php which acts as front controller)
 */

$uri = rtrim(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH), '/');
$lowerUri = strtolower($uri);

// Serve static files directly (let PHP handle them)
if (preg_match('#^/(_next|icon|photo|reels|hero-video|favicon)#', $uri)) {
    return false;
}

// Blog posts: /blog/{slug} (case-insensitive)
if (preg_match('#^/blog/([a-zA-Z0-9\-]+)$#', $uri, $m)) {
    $_GET['slug'] = strtolower($m[1]);
    require __DIR__ . '/blog.php';
    return true;
}

// Package details: /package/{slug}
if (preg_match('#^/package/([a-zA-Z0-9\-&,]+)$#', $uri, $m)) {
    $_GET['slug'] = $m[1];
    require __DIR__ . '/package.php';
    return true;
}

// Handle root
if ($uri === '' || $uri === '/') {
    require __DIR__ . '/index.php';
    return true;
}

// Static pages (case-insensitive via lowercase URI)
$pages = [
    '/about-us'             => 'about-us.php',
    '/contact'              => 'contact.php',
    '/faq'                  => 'faq.php',
    '/blog'                 => 'blog-listing.php',
    '/cancellation-policy'  => 'cancellation-policy.php',
    '/privacy-policy'       => 'privacy-policy.php',
    '/terms-and-condition'  => 'terms-and-condition.php',
    '/sitemap'              => 'sitemap.php',
];

if (isset($pages[$lowerUri])) {
    require __DIR__ . '/' . $pages[$lowerUri];
    return true;
}

// Collection pages: /{slug}
if (preg_match('#^/([a-zA-Z0-9\-]+)$#', $uri, $m)) {
    $_GET['slug'] = strtolower($m[1]);
    require __DIR__ . '/collection.php';
    return true;
}

// 404
http_response_code(404);
echo 'Page not found';
