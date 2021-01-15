<?
// This provides the live log stream (called via stream in scripts.js)
ignore_user_abort(false);

require_once('../config.php');

header('Content-Type: text/event-stream');		// This is setting event stream
header('Cache-Control: no-cache');				// We don't want any caching

$demoID = $_GET['demoID'];
$host = $config['config'][$demoID]['router']['ip'];
$write = $config['config'][$demoID]['router']['write'];
$read = $config['config'][$demoID]['router']['read'];

$delayBetweenUpdates = 50000;					// Setting the delay in microseconds between database reads (and stream updates)
while (1) {
	$dbWrite = new db($host, $write, user, password, 'demo');
	$dbRead = new db($host, $read, user, password, 'demo');

	if (($dbWrite->connected) && ($dbRead->connected)) {		// Only if both read and write connection are running
		$dbRead->query('select t.id as id, u1.name as sender, u2.name as receiver, format(t.amount, 2) as amount, format(t.fee, 2) as fee from transactions t join (users u1, users u2) on (t.sender = u1.id and t.receiver = u2.id) where displayed = 0 order by id limit 1');			// Finding the next transaction that was not displayed yet and select 1
		if ($dbRead->numOfRows != 0) {																	// If there are any (liveLog is quicker then the worker.php that updates the transactions)
			$liveLog = array('id' => $dbRead->getRow('id'), 'sender' => $dbRead->getRow('sender'), 'receiver' => $dbRead->getRow('receiver'), 'amount' => $dbRead->getRow('amount'), 'fee' => $dbRead->getRow('fee'));

			echo "id: ".uniqid()."\n";					// Event ID. Nothing special. We just send it for better comparability. We're not using it.
			echo "event: liveLog\n";					// Event name is liveLog
			echo "data: ".json_encode($liveLog)."\n\n";	// Sending JSON with the id, sender name, receiver name, amount and fee for the live log table
			@ob_flush(); flush();						// Making sure we flush PHP and apache

			$dbWrite->query('update transactions set displayed = 1 where id ='.$dbRead->getRow('id'));		// Update the transaction database table with "displayed = 1" to mark it as read.
		}
	}
	usleep ($delayBetweenUpdates);
}
?>