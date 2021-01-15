<?
define('user', 'appUser');
define('password', 'appUser');
define('rootDirectory', '/var/www/html/demo/');
define('rootWeb', '/demo/');

if (!defined('debug'))
	define('debug', false);

if (debug) {
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
	/* Suppress MySQL "Headers and client library minor version mismatch" error */
	set_error_handler(function ($errno, $errstr, $errfile, $errline) {
		if (false === strpos($errstr, 'Headers and client library minor version mismatch')) {
			return false;
		}
	});
	/* End of Suppress MySQL "Headers and client library minor version mismatch" error */
} else {
	ini_set('display_errors', 0);
	ini_set('display_startup_errors', 0);
	error_reporting(0);
}

require_once(rootDirectory.'src/include.php');

$config = file_get_contents(rootDirectory.'config.JSON');
$config = json_decode($config, true);
?>
