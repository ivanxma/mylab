<?
// ajax call to check server status and send read and write stats if it's online
require_once('../config.php');

$demoID = $_GET['demoID'];
$serverID = $_GET['serverID'];												// Get the server ID to check (0, 1, 2....)
$host = $config['config'][$demoID]['servers'][$serverID]['ip'];				// Get the server IP from the config based on it's ID. This is connecting direct to the server, not the router
$port = $config['config'][$demoID]['servers'][$serverID]['port'];			// And the port
$dblink = new db($host, $port, 'root', '', 'performance_schema');			// Only connect to read port. No need for write port. Use root to connect so it won't change the write/read stats
$result = array();

if ($dblink->connected) {													// If we have connection
	$result['status'] = '1';												// Mark status as "1"
	$result['time'] = date("h:i:s A");										// Collect time in format that fit the graph (see scripts.js)
		// Number of reads (select) for the appUser
	$dblink->query('select COUNT_STAR from events_statements_summary_by_user_by_event_name where EVENT_NAME = "statement/sql/select" and USER = "'.user.'"');
	$result['read'] = $dblink->getRow('COUNT_STAR');

		// Number of writes (insert + update + delete) for the appUser
	$dblink->query('select sum(COUNT_STAR) as COUNT_STAR from 
							(select COUNT_STAR from events_statements_summary_by_user_by_event_name where EVENT_NAME = "statement/sql/insert" and user = "'.user.'"
						union ALL
							select COUNT_STAR from events_statements_summary_by_user_by_event_name where EVENT_NAME = "statement/sql/update" and user = "'.user.'"
						union ALL
							select COUNT_STAR from events_statements_summary_by_user_by_event_name where EVENT_NAME = "statement/sql/delete" and user = "'.user.'") t1;');
	$result['write'] = $dblink->getRow('COUNT_STAR');

		// Number of transaction this servers has (see index.php for explanation)
	$dblink->query('select count(id) as noOfTransactions from demo.transactions');
	$result['noOfTransactions'] = $dblink->getRow('noOfTransactions');
} else {
	$result['status'] = '0';												// Servers is not responding, marked as "0"
}

$result['serverID'] = $serverID;											// Sending the servers ID back for the ajax callback to know which server to update
$result['error'] = $dblink->error;
$result['errorTxt'] = $dblink->errorTxt;

echo (json_encode($result));
?>