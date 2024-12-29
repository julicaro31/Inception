<?php
define('DB_NAME', getenv('MYSQL_DATABASE')); // Database name
define('DB_USER', getenv('MYSQL_USER'));        // Database user
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));    // Database password
define('DB_HOST', getenv('MYSQL_DB_HOST'));      // Database host (use service name)

// Keys and salts for authentication
// To generate keys: curl -s https://api.wordpress.org/secret-key/1.1/salt/
define('AUTH_KEY',         'L4%3czI0*r@},HYkO8Zs?`-4Sgk)~s6Y-^4b0~=z%+yxli%EM}RR+/~:UktseRTv');
define('SECURE_AUTH_KEY',  ';;f{%zU+OaBztVm*D4F`G-RE,Lj>!M>^s7+SK9Vv6j(p_F3={,Sx$DhLs(3+2y3/');
define('LOGGED_IN_KEY',    'N@ ?I=Y2.M=v4PQyvC:EaS&,h JYE+H+3gSuWE8NQ/oQC6M+Rk54^VpV-t!u3gaI');
define('NONCE_KEY',        '-.s,V.Yx~]Te5XU78 +vjv>j_3y(,v|~n_37VC=TJ6*wI|mlR:=ZC`U>|2jX#A|&');
define('AUTH_SALT',        'X;Om$s_rY7,=a8`I~,C8->~63>fj(WRW++l$|b=^VuHbD+4JKF{eRV.NMMv=oRV$');
define('SECURE_AUTH_SALT', 'CC2XswEkC~~R>b@TXDMI}S4|rB++<JwBH#m;&fS-b-;&-Z3Ks`I=V]8rGpg92P^t');
define('LOGGED_IN_SALT',   'Nzq!dE5m-Ms,By{EU`c~~+<TQp~+UDV-g^t05k+z]v S0cv=Fp*=YkHEw1aG}&$d');
define('NONCE_SALT',       'y8IhEB(7U5/Qk<o:{qh,(+FpdQ.,Y;YzFKyM0S_~&]q(OP5qk, kldyFMW_._CYJ');

// Database table prefix
$table_prefix = 'inception_';

// Debugging mode (disable for production)
define('WP_DEBUG', true);

// Absolute path to the WordPress directory
if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}

// Sets up WordPress vars and included files
require_once ABSPATH . 'wp-settings.php';
