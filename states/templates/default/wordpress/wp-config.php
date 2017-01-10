<?php

define('DB_NAME', "{{pillar['opus'][target]['database']['db_name']}}");
define('DB_USER', "{{pillar['opus'][target]['database']['db_user']}}");
define('DB_PASSWORD', "{{pillar['opus'][target]['database']['db_pass']}}");
define('DB_HOST', "{{pillar['mysql']['mysql_host'][0]}}");


define('DB_CHARSET', "{{pillar['opus'][target]['app']['DB_CHARSET']}}");
define('DB_COLLATE', "{{pillar['opus'][target]['app']['DB_COLLATE']}}");

define('AUTH_KEY',         "{{pillar['opus'][target]['app']['AUTH_KEY']}}");
define('SECURE_AUTH_KEY',  "{{pillar['opus'][target]['app']['SECURE_AUTH_KEY']}}");
define('LOGGED_IN_KEY',    "{{pillar['opus'][target]['app']['LOGGED_IN_KEY']}}");
define('NONCE_KEY',        "{{pillar['opus'][target]['app']['NONCE_KEY']}}");
define('AUTH_SALT',        "{{pillar['opus'][target]['app']['AUTH_SALT']}}");
define('SECURE_AUTH_SALT', "{{pillar['opus'][target]['app']['SECURE_AUTH_SALT']}}");
define('LOGGED_IN_SALT',   "{{pillar['opus'][target]['app']['LOGGED_IN_SALT']}}");
define('NONCE_SALT',       "{{pillar['opus'][target]['app']['NONCE_SALT']}}");


$table_prefix  = 'wp_';

define('WP_DEBUG', false);


if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
