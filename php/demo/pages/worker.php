<?
ignore_user_abort(false);				// This is very important! PHP will keep running scripts even if the browser goes away. For our scripts, with while(1)... That's not good.
										// This setting will only work if the script actually try to write something to the browser (flush). Otherwise, use the /stat url to find out
										// the script PID and kill it. Or run pkill -9 -u apache to kill all running scripts (won't kill apache main process)

require_once('../config.php');

header('Content-Type: text/event-stream');		// This is setting event stream
header('Cache-Control: no-cache');				// We don't want any caching

$demoID = $_GET['demoID'];
$host = $config['config'][$demoID]['router']['ip'];
$write = $config['config'][$demoID]['router']['write'];
$read = $config['config'][$demoID]['router']['read'];

$streamReport = 0;								// This is just a simple counter. Every few new transactions, we send an event to show the blinking switch LED (done in scripts.js)

while (1) {
	$dbWrite = new db($host, $write, user, password, 'demo');				// Try to connect to the router write port.
	$dbRead = new db($host, $read, user, password, 'demo');					// Try to connect to the router read port.
	$dbRead1 = new db($host, $read, user, password, 'demo');				// We don't need this connection. It's here ONLY to break the symmetry of 2 connection every time. The graphs looks
																			// Better that way when there are 2 servers only because of the round robin

	if (($dbWrite->connected) && ($dbRead->connected)) {					// Only if both available will start hammering away
		if (rand(0, 3) == 1) {												// 1 in 4 chance this round will create new user: to add some interest to the demo
				// Choosing random first and last names from the common names table based on position. Nothing too fancy. The common names table is created at setup at the sql import
				// And then set an initial wealth for this use based on random percent from the wealthiest user.
			$dbRead->query('select floor(1 + rand() * (select max(position) from names where type = 1)) as position');					// First name
			$position = $dbRead->getRow('position');
			$query = $dbRead->paramQuery('select name as firstName from names where position = (%d - 1) and type = 1', [$position]);
			$dbRead->query($query);
			$firstName = $dbRead->getRow('firstName');

			$dbRead->query('select floor(1 + rand() * (select max(position) from names where type = 2)) as position');					// Last name
			$position = $dbRead->getRow('position');
			$query = $dbRead->paramQuery('select name as lastName from names where position = (%d - 1) and type = 2', [$position]);
			$dbRead->query($query);
			$lastName = $dbRead->getRow('lastName');

			$dbRead->query('select max(balance) as totalBalance from users');															// Finds what is the maximum amount the users have
			$newBalance = $dbRead->getRow('totalBalance');																				// to make sure new users may be as rich to start with

			$query = $dbWrite->paramQuery('insert into users (name, balance) values ("%S %S", floor(rand() * %f))', [$firstName, $lastName, $newBalance]);
			$dbWrite->query($query);
		}

		// The following queries are choosing a random sender and receiver. I wish I could say I'm smart enough to come up with this query, but I didn't...
		// It's actually Jan Kneschke (http://jan.kneschke.de/projects/mysql/order-by-rand/) work. If the webpage is not available, I've added the pdf to /doc
		// It allows to choose a random rows while keeping load low and hander "holes" (since the id auto_increment is not sequential)
		$dbRead->query('select id from users order by rand() limit 1');
		$sender = $dbRead->getRow('id');
		do {													// Choosing the receiver, making sure it's not the same as the sender.
			$dbRead->query('select id from users order by rand() limit 1');
			$receiver = $dbRead->getRow('id');
		} while ($sender == $receiver);

		$dbRead->query('select balance from users where id = '.$sender);					// checking how much money the sender has. He can't send more then he have.
		$senderBalance = $dbRead->getRow('balance');

		$amountPlusFee = rand(1, floor($senderBalance));									// Getting some random amount the sender will send (including fee)
		$fee = $amountPlusFee * (rand(1, 100) / 10000);										// Calculate some random fee up to 1% fee.

		$query = 'start transaction;';														// Write the transaction in the transaction list, move the money from one account the other
		$query .= $dbWrite->paramQuery('insert into transactions (sender, receiver, amount, fee) values (%d, %d, %f, %f);', [$sender, $receiver, $amountPlusFee - $fee, $fee]);
		$query .= $dbWrite->paramQuery('update users set balance = balance - %f, sent = sent + %f, fee = fee + %f where id = %d;', [$amountPlusFee, $amountPlusFee, $fee, $sender]);
		$query .= $dbWrite->paramQuery('update users set balance = balance + %f, received = received + %f where id = %d;', [$amountPlusFee - $fee, $amountPlusFee - $fee, $receiver]);
		$query .= 'commit;';

		$dbWrite->multi_query($query);

		if ($streamReport >= 5) {						// If this is the 5th run (or more) - send a dummy event (just to blink the LED on the worker switch)
			echo "id: ".uniqid()."\n";					// Event ID. Nothing special. We just send it for better comparability. We're not using it.
			echo "event: streamRunning\n";				// Name of the event
			echo "data: 1\n\n";							// dummy data
			@ob_flush(); flush();						// Making sure we flush PHP and apache
			$streamReport = 0;
		}
		$streamReport++;
 	}
	usleep (200000);
}
?>