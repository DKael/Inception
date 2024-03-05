<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_REDIS_HOST', 'redis_host_here' );
define( 'WP_REDIS_PORT', 'redis_port_here' );
define( 'WP_REDIS_PREFIX', 'redis_prefix_here' );
define( 'WP_REDIS_DATABASE' , 'redis_database_here' );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DISABLE_DROPIN_CHECK', true );
define( 'WP_CACHE', true );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'aHtB>x08wH50H(dw,g9dB!`fj%hjB^la?w6c5E- JM@f&,V^68vC?dk)@ +7:=5~');
define('SECURE_AUTH_KEY',  'Bo-J+RzP@rtlxf@|(@cH?km|TX_D7<k^DugYM{+el$8EDI^ta:5fvU<(43HNR:I4');
define('LOGGED_IN_KEY',    'Lsk!U}_v^[+tryC[!5/Q}RBheP$`;$:0U<gQIJ$4@s,Bn++6{yTJxisWE@=+z$]$');
define('NONCE_KEY',        'u%Q*>Sqrdy,HxuG|[om:QEkSg#9<peNm^JGlpgf{HJz%hySn,f%|ANREE.]U}&+.');
define('AUTH_SALT',        '~=~%m)j9B47) N>(<F)6swXE{]-Suu+UJspc[>%snF!~S&~HI Y)U-t_<j*w{LzC');
define('SECURE_AUTH_SALT', 'n!eN29QwB%ZH{2@#VNy;i<th_-^2P%$4e5sZmXhw~/K5L+4-#I%D9jc,b`<,=*^c');
define('LOGGED_IN_SALT',   'W wnvG3K,_FHsesRP+*5f3(+Yf}Tu]yv|D-M8^!LQeE0a!rzOXhYS]uVVo+rX}qH');
define('NONCE_SALT',       'mrx6tgm.6=J<DLOk:}.41%1qZWn+XG$Z!vxp.Htr~`Rp]?-B2:(Dl9mbA~`$.K-b');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
