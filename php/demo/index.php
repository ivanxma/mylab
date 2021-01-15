<?
require_once('./config.php');
require_once('./src/include.php');

// check if a demo was chosen. Demo ID is automatically picked from the config JSON file. Demo ID "-1" means no demo was selected. Allow to empty the page.
if (isset($_GET['demoID'])) {
	$demoID = $_GET['demoID'];
} else {
	$demoID = -1;
}
?>

<!doctype html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MySQL Live Demo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="shortcut icon" href="images/mysqlIcon.png">

	<link rel="stylesheet" href="assets/css/normalize.css">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/themify-icons.css">
	<link rel="stylesheet" href="assets/css/flag-icon.min.css">
	<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
	<link rel="stylesheet" href="assets/scss/style.css">
	<link href="assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">

	<link rel="stylesheet" href="src/style.css">
</head>
<body>
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<header id="header" class="header">
			<div class="header-menu">
				<div class="col-md-3">
					<div class="header-left">
						<!-- Select element to chose the demo. Will reload the page when changes -->
						<select name="demoID" id="demoID" class="form-control" OnChange='window.location = "<?echo(rootWeb)?>index.php?demoID=" + document.getElementById("demoID").options[document.getElementById("demoID").selectedIndex].value'>
							<option value="-1">Please choose demo...</option>
<?
							foreach ($config['config'] as $key => $value) { ?>
								<option value="<?echo($key)?>" <?if ($key == $demoID) echo ('selected')?>><?echo($value['description'])?></option>');
<?							} ?>
							<option disabled role=separator></option>
							<option value="-999" style="color: red;">Edit config file</option>
						</select>
					</div>
				</div>

<?				if ($demoID == -1) {				// If demo ID is -1 don't go any further, leaving just the demo selection.
					exit();
				} elseif ($demoID == -999) {		// If ID = -999 takes to the configuration editor
					echo ('<script>window.location.href = "pages/editConfig.php"</script>');
				} else {															// Setup the application use and database. Has to happen here to avoid conflicts on Multi Master clusters
					$demoID = $_GET['demoID'];
					$host = $config['config'][$demoID]['router']['ip'];				// Get the router IP and write ports from the config.
					$port = $config['config'][$demoID]['router']['write'];
					$databaseSetupResult = databaseSetup($host, $port);				// Run the setup function from include.php. Result will be either "ok" or an error message.
					if ($databaseSetupResult != 'ok') { ?>
						<div class="content mt-3">
							<div class="row">
								<div class="col-md-9">
									<div class="alert alert-danger" role="alert" OnClick='window.location.href = "index.php?demoID=" + document.getElementById("demoID").options[document.getElementById("demoID").selectedIndex].value'>		 <!-- If result from setup is not "ok", showing warning message with ability to click -->
										<h4 class="alert-heading">DATABASE SETUP FAILED!</h4>		<!-- on it to reload the page and try the setup again 								 -->
										<p>Error: <?echo($databaseSetupResult)?></p>
										<hr>
										<p class="mb-0">Please try again by clicking this notice.</p>
									</div>
								</div>
							</div>
						</div>
<?						exit();
					}
				}
 ?>

				<div class="col-md-1">												<!-- The worker switch on and off -->
					Worker: 
					<label class="switch switch-text switch-success switch-pill">
						<input type="checkbox" class="switch-input" id="stream">
						<span data-on="On" data-off="Off" class="switch-label"></span>
						<span class="switch-handle" id="switchHandleLed"></span>
					</label>
				</div>

				<div class="col-md-2">												<!-- Showing total balance of all the users -->
					<div class="stat-widget-one">
						<div class="stat-icon dib"><i class="ti-money text-success border-success"></i></div>
						<div class="stat-content dib">
							<div class="stat-text">Balance</div>
							<div class="stat-digit" id="widgetBalance"></div>
						</div>
					</div>
				</div>
				<div class="col-md-2">												<!-- Showing the amount of fees we collected -->
					<div class="stat-widget-one">
						<div class="stat-icon dib"><i class="ti-money text-primary border-primary"></i></div>
						<div class="stat-content dib">
							<div class="stat-text">Fees</div>
							<div class="stat-digit" id="widgetFees"></div>
						</div>
					</div>
				</div>
				<div class="col-md-2">												<!-- Showing the number of users we have -->
					<div class="stat-widget-one">
						<div class="stat-icon dib"><i class="ti-user text-warning border-warning"></i></div>
						<div class="stat-content dib">
							<div class="stat-text">Users</div>
							<div class="stat-digit" id="widgetUsers"></div>
						</div>
					</div>
				</div>
				<div class="col-md-2">												<!-- Showing the amount of transaction. It's shortened otherwise it overflows -->
					<div class="stat-widget-one">
						<div class="stat-icon dib"><i class="ti-credit-card text-danger border-danger" id="stopAllAjaxOnPageHack"></i></div>
						<div class="stat-content dib">
							<div class="stat-text">Trans</div>
							<div class="stat-digit" id="widgetTransactions"></div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- End of header -->

		<div class="content mt-3">
			<div class="row">
				<div class="col-sm-6 col-lg-6">										<!-- The main live log (transactions) window -->
					<div class="card topCard">
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th scope="col" style="width: 35%">Sender</th>
										<th scope="col" style="width: 35%">Receiver</th>
										<th scope="col" style="width: 10%">Amount</th>
										<th scope="col" style="width: 10%">Fee</th>
									</tr>
								</thead>
								<tbody id="liveLog">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--/.col-->

				<div class="col-sm-6 col-lg-6">										<!-- The main top dogs graph window -->
					<div class="card topCard">
						<div class="card-body">
							<canvas id="topDogs"></canvas>
						</div>

					</div>
				</div>
				<!--/.col-->
				</div>

				<div class="row">													<!-- Creating number of graphs depend on the setup. More then 4 graphs will overflow! -->
<?					$numberOfGraphs = count($config['config'][$demoID]['servers']);
					foreach ($config['config'][$demoID]['servers'] as $key=>$value) { ?>
						<div class="col-lg-<?echo(12/$numberOfGraphs)?> col-md-<?echo(12/$numberOfGraphs)?>">
							<div class="card bottomCard">
								<div class="card-header">
									<?echo ($value['ip'])?> (Port: <?echo ($value['port'])?>), <span style="color: red;" id="serverGraphText<?echo($key)?>">OFFLINE</span><br />
										<!-- The following text shows the amount of transactions each servers has. In normal operation they all suppose to show the same number -->
										<!-- But when servers is in recovery mode, it'll show how it catches up. -->
									<span style="display: none;" class="serverGraphTextNoOfTransactions" id="serverGraphTextNoOfTransactions<?echo($key)?>"></span>
								</div>
								<div class="card-body">
									<canvas id="serverGraph<?echo($key)?>" style="display: none;"></canvas>
								</div>
							</div>
						</div>
<?					} ?>
				</div>
			</div>
		</div>
	<div class="pageFooter">
		2018 Ronen Baram. <span style="font-size: 0.8em;">Distributed under GPLv3. Based on Sufee Admin Dashboard, Jquery, Bootstrap and more.</span>
	</div>

	<!-- <script src="assets/js/vendor/jquery-2.1.4.min.js"></script> -->
	<script src="src/jquery-3.3.1.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="src/Chart.bundle.min.js"></script>
	<script src="src/scripts.js"></script>

	<script type="text/javascript">
		// we need this so the scripts in scripts.js can use the configuration for the current setup.
		var config = JSON.parse('<?echo(json_encode($config))?>');
	</script>
</body>
</html>
