<?
// Main class to connect to databases
class db {
	public $mysqli;					// Holds the MySQL connection
	public $connected = 0;			// Mark if server is connected on not
	public $numOfRows = 0;			// Holds the number of rows following a query
	public $rows;					// Holds the actual result
	public $error = 0;				// Holds the error number is any
	public $errorTxt = '';			// Holds the error text is any

	public function __construct($host, $port, $user, $password, $database) {					// Will try to connect to the database
		$this->mysqli = new mysqli($host, $user, $password, $database, $port);
		if ($this->mysqli->connect_errno) {														// Cannot connect
			$this->connected = 0;																// Mark as not connected
			$this->error = $this->mysqli->connect_errno;
			$this->errorTxt = $this->mysqli->connect_error;
			error_log('Cannot connect to MySQL with error '.$this->mysqli->connect_errno.': '.$this->mysqli->connect_error);	// Write to the https error log
		} else {
			$this->connected = 1;																// Mark as connected.
		}
	}

	public function __destruct() {																// When object no longer needed, will close the database connection
		$this->mysqli->close();																	// Act as responsible citizen
		$this->connected = 0;
	}

	public function query($query) {										// Method to query the database
		$result = $this->mysqli->query($query);							// Run the query (no protection here! It's a demo app, not expecting SQL injection. DON'T DO THIS IN PRODUCTION!)
		if ($this->mysqli->errno != 0) {								// If something went wrong
			$this->error = $this->mysqli->errno;
			$this->errorTxt = $this->mysqli->error;
			error_log('MySQL error: '.$this->mysqli->error.' | Query: '.$query);
			if (!$this->mysqli->ping()) {								// Try to see if the server is still there (ping will try to check connection to the database)
				$this->connected = 0;									// If this fails - the database is gone.
			}
		} else {														// All good, query went through
			$this->error = 0;
			$this->rows = array();										// Empty $rows if it had anything from before
			if ($result !== TRUE) {										// Fetch result set if there's one.
				$this->numOfRows = $result->num_rows;					// Read the number of rows in the result set
				if ($result->num_rows > 0) {							// If there are any rows,
					while($row = $result->fetch_assoc()) {				// array $rows will include the full result set for reuse
						$this->rows[] = $row;
					}
				}
			$result->free();											// It's a common sense to free the result set buffer
			}
		}
	}

	public function multi_query($query) {								// Method to run multiply queries at once, delimiter by ";"
		$query = 'start transaction; '.$query. 'commit;';				// Open a transaction, queries and then commit
		if (!$this->mysqli->multi_query($query)) {						// Run the queries, if something went wrong,
			error_log('MySQL error: '.$this->mysqli->error.' | Query: '.$query);
			if (!$this->mysqli->ping()) {								// Try to see if the server is still there
				$this->connected = 0;	
			}
		}
		while ($this->mysqli->more_results()) {							// After multi_query ALWAYS run this otherwise nothing else will work for this connection anymore!
			$this->mysqli->next_result();								// Reading and cleaning all the results from all the queries
		}
	}

	public function getRow($key, $row = 0) {							// Method to quickly fetch an element from the result set, based on it's name. If not second parameter
		return $this->rows[$row][$key];									// Is send, it will read the first row (great for one row results)
	}

		// Method to allow write quires in a nicer way. Will take a text and convert it to proper formatted query
		// Example: paramQuery('update table set a = %d, b = %s, c = %f where id = %d', [$int, $string, $float, $integer])
	public function paramQuery($query, $paramaters) {
			$query = str_replace('%s', '"%s"', $query);					// Adding quotes ("") around text parameters.
			$query = str_replace('%S', '%s', $query);					// If there's a need to use % for wildcard (in LIKE etc), send %S but then add quotes
																		// (eg.: "select * from a where id like "%%%S%%"" to be parsed as "select * from a where id like "%<partOfTxt>%")
			$query = vsprintf($query, $paramaters);						// parameters substitution
		return $query;
	}
}

// This function runs before anything else to initiate the database for the demo. It runs at the start of index.php to make sure no conflicts can happen from multiply connection to a Multi Master cluster (all other clusters won't have an issue...)
function databaseSetup($host, $port) {
	$sucess = 'ok';																									// Carry success code throughout the setup process
	$mysqli = new mysqli($host, 'root', '', '', $port);																// Trying to connect to the router write port. As root.
	if ($mysqli->connect_errno) {																					// If cannot connect, report back (this will show a big warning)
		error_log('Setup: Cannot connect to MySQL with error: '.$mysqli->connect_error);
		$sucess = 'Cannot connect to '.$host.' Port '.$port.' with error: '.$mysqli->connect_error;
	} else {																										// Connection succeeded.
		$reuslt = $mysqli->query('select * from demo.users');														// Try to check if can query demo.users table, that's the end result.
		if (($mysqli->errno != 0) || ($reuslt->num_rows < 20)) {													// If we can't or if it has less then the 20 initial users, run the setup
			error_log('Setup: Cannot select from demo.users. Running setup...');

			$mysqli->query('create user if not exists '.user.'@"%" identified with mysql_native_password by "'.password.'"');		// Create the appUser
			if ($mysqli->errno != 0) 
				$sucess = 'Cannot create user. Error: '.$this->msyqli->error;

			if ($sucess == 'ok')
				$mysqli->query('grant all privileges on *.* to '.user.'@"%"');

			if ($sucess == 'ok')
				$mysqli->query('create database if not exists demo');						// Create the demo database
			if ($mysqli->errno != 0)
				$sucess = 'Cannot create database. Error: '.$this->msyqli->error;

			if ($sucess == 'ok') {
				$mysqli->select_db('demo');													// Import create.sql which includes the tables definition and the common names table.
				$sqlSource = file_get_contents('src/create.sql');
				$mysqli->multi_query($sqlSource);
				while ($mysqli->more_results()) {											// As mentioned, this HAS to be done after multi queries.
					$mysqli->next_result();
				}

				for ($i = 0; $i < 20; $i++) {												// Create initial 20 users with max of 1,000$ initial money (random percent of 1,000$)
					$query = 'select floor(1 + rand() * (select max(position) from names where type = 1)) into @position; select name from names where position = @position - 1 and type = 1 into @firstName;';
					$query .= 'select floor(1 + rand() * (select max(position) from names where type = 2)) into @position; select name from names where position = @position - 1 and type = 2 into @surName;';
					$query .= 'insert into users (name, balance) values (concat(@firstName, " ", @surName), floor(rand() * 1000));';
					$mysqli->multi_query($query);
					while ($mysqli->more_results()) {										// As mentioned, this HAS to be done after multi queries.
						$mysqli->next_result();
					}
				}
			}

			$mysqli->close();

			$mysqli = new mysqli($host, user, password, 'demo', $port);						// Try to connect with the appUser
			$reuslt = $mysqli->query('select * from users');								// Check if the setup process completed successfully
			if (($mysqli->errno != 0) || ($reuslt->num_rows == 0)) {						// If not, report back (will show warning)
				$sucess = 'Something went wrong with the setup process... Tried to read the demo.users tables but I could not!<br />This is beyond my abilities to fix!';
			}

			$mysqli->close();
		}
	}
	return $sucess;
}
