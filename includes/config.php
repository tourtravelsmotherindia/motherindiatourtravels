<?php
/**
 * Site Configuration
 * Loaded from data/site-config.json
 */
$config = json_decode(file_get_contents(__DIR__ . '/../data/site-config.json'), true);

define('SITE_NAME', $config['site_name']);
define('SITE_TAGLINE', $config['tagline']);
define('SITE_PHONE', $config['phone']);
define('SITE_EMAIL', $config['email']);
define('SITE_WHATSAPP', $config['whatsapp']);
define('SITE_FACEBOOK', $config['facebook']);
define('SITE_INSTAGRAM', $config['instagram']);
define('GOOGLE_VERIFICATION', $config['google_verification']);
define('GTM_ID', $config['gtm_id']);
define('CLARITY_ID', $config['clarity_id']);
define('BASE_URL', $config['base_url']);
define('LOGO_PATH', $config['logo_path']);
define('LOGO_FOOTER_PATH', $config['logo_footer_path']);
define('FAVICON_PATH', $config['favicon_path']);
