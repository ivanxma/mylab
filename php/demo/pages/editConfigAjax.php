<?
// This ajax call will fire from the configuration page to update the config file
require_once('../config.php');

/*************************************************************************************************************************************/
/*
/* This is very simple script. It will get a key for the multidimensional $config variable to update as string and the actual value
/* to update.
/* The tricky part is to use string (comes from the "name" attribute of the input element in editConfig.php) to actual keys.
/* Again, stackoverflow had the answer
/*
/*************************************************************************************************************************************/

$keyToUpdate = $_GET['keyToUpdate'];					// The string of keys
$keys = explode('][', trim($keyToUpdate, '[]'));		// Split the keys string into array based on the fact each key encapsulate within []
$curr = &$config['config'];								// $curr is pointer to the multidimensional array $config (already inside the first level which is 'config')
foreach($keys as $key) {								// Loop through the keys we received
	$curr = &$curr[$key];								// For each iteration, $curr becomes a pointer to a deeper level, this way we can walk into the array all the way to the actual leaf
}
$curr = $_GET['valueToUpdate'];							// At the end of the walk, $curr POINTS (not hold the value) to the leaf asked for. Updating $curr actually updates the $config array.

file_put_contents(rootDirectory.'config.JSON', json_encode($config));		// We write the JSON file. This will write ugly JSON. I tried to use JSON_PRETTY_PRINT, bit it's not working. Have no idea why.
?>