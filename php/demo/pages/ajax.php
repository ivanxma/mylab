<?
require_once('../config.php');
require_once('../src/include.php');

$demoID = $_GET['demoID'];
$data = json_decode($_POST['data'], true);
$host = $config['config'][$demoID]['router']['ip'];
$write = $config['config'][$demoID]['router']['write'];
$read = $config['config'][$demoID]['router']['read'];
$dbRead = new db($host, $read, user, password, 'demo');
$result = array();													// result from the ajax call will me stored here

switch ($data['facility']) {										// what this ajax call needs
	case 'topDogUpdate':											// Update top dog chart
		$dbRead->query('select id, name, truncate(balance, 2) as balance, truncate(sent, 2) as sent, truncate(received, 2) as received, truncate (fee,2) as fee from users order by users.fee desc limit 10');																			// Get the 10 top dogs (most fees paid). We also grab how much they sent and received.
		$result['topDogs'] = $dbRead->rows;
		$result['feeMin'] = min(array_map(function($a) { return $a['fee']; }, $result['topDogs']));	  // grab the min and max fees of the top dogs (that's how we get min and max
		$result['feeMax'] = max(array_map(function($a) { return $a['fee']; }, $result['topDogs']));	  // from multidimensional arrays). We use this to draw different circles sizes
		break;																						  // in the top dogs chart
	case 'headerWidgetsUpdate':									    // Update the widgets
		$dbRead->query('select format(sum(balance), 0) as sumBalance, format(sum(fee), 0) as sumFee, count(id) as totalUsers from users');
		$result['sumBalance'] = $dbRead->getRow('sumBalance');		// Total amount of money our users have
		$result['sumFee'] = $dbRead->getRow('sumFee');				// Total amount of fees they paid
		$result['totalUsers'] = $dbRead->getRow('totalUsers');		// Total amount of users
		$dbRead->query('select format(count(id), 0) as totalTransactions from transactions');
		$result['totalTransactions'] = $dbRead->getRow('totalTransactions');	// Total amount of transactions
		break;
}

$result['errorRead'] = $dbRead->error;
$result['errorTxtRead'] = $dbRead->errorTxt;
echo (json_encode($result));
?>