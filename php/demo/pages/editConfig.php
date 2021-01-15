<?
// This page is the configuration editor. It will read the JSON config and allow to chage all the values.
require_once('../config.php');
?>

<!doctype html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>MySQL Live Demo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="shortcut icon" href="../images/mysqlIcon.png">

	<link rel="stylesheet" href="../assets/css/normalize.css">
	<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/css/themify-icons.css">
	<link rel="stylesheet" href="../assets/css/flag-icon.min.css">
	<link rel="stylesheet" href="../assets/css/cs-skin-elastic.css">
	<link rel="stylesheet" href="../assets/scss/style.css">
	<link href="../assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">

	<style>
		.pageFooter {
			position: fixed;
			left: 0;
			bottom: 0;
			width: 100%;
			color: white;
			text-align: center;
			background-color: #778899;
		}
	</style>
</head>
<body>
	<div class="content">
		<div style="position: fixed; top: 20px; right: 100px;">				<!-- fixed button at the top right to send back to the demo page -->
			<button type="button" class="btn btn-success" OnClick='window.location.href="<?echo(rootWeb)?>index.php"'><i class="ti ti-home"></i>&nbsp; Go back to the demo</button>
		</div>
		<div class="row">
			<div class="col-md-8">
<?				foreach ($config['config'] as $key=>$value) { ?>			<!-- Loop via all the demos -->
					<div class="card border border-primary">
						<div class="card-header">
							<div class="row form-group align-items-center">
								<div class="col-md-12"><input type="text" name="[<?echo($key)?>][description]" validation="text" placeholder="Demo description" class="input-lg form-control-lg form-control" value="<?echo ($value['description'])?>"></div>			<!-- Each input has validation, stated in the input field. Text does no require anything -->
							</div>
						</div>
						<div class="card-body">
							<table class="table">
								<tbody>
<?									foreach ($value['servers'] as $key2=>$value2) { ?>								  <!-- Loop through all the servers -->
										<tr>
											<th scope="row">Server</th>
											<td>
												<div class="row form-group">
													<div><input type="text" id="demoDescribtion" name="[<?echo($key)?>][servers][<?echo($key2)?>][ip]" validation="ip" placeholder="IP" class="form-control" value="<?echo($value2['ip'])?>"></div>				 <!-- Validation is for IP addresses -->
												</div>
											</td>
											<td>
												<div class="row form-group">
													<div><input type="text" id="demoDescribtion" name="[<?echo($key)?>][servers][<?echo($key2)?>][port]" validation="port" placeholder="Port" class="form-control" value="<?echo($value2['port'])?>"></div>		<!-- Validation is for IP addresses -->
												</div>
											</td>
										</tr>
<? 									} ?>
									<tr>
										<th scope="row">Router Write</th>											   <!-- The router write and read port -->
										<td>
											<div class="row form-group">
												<div><input type="text" id="demoDescribtion" name="[<?echo($key)?>][router][ip]" validation="ip" placeholder="IP" class="form-control" value="<?echo($value['router']['ip'])?>"></div>
											</div>
										</td>
										<td>
											<div class="row form-group">
												<div><input type="text" id="demoDescribtion" name="[<?echo($key)?>][router][write]" validation="port" placeholder="Port" class="form-control" value="<?echo($value['router']['write'])?>"></div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">Router Read</th>
										<td>
											<div class="row form-group">
												<div><input type="text" id="demoDescribtion" name="[<?echo($key)?>][router][ip]" validation="ip" placeholder="IP" class="form-control" value="<?echo($value['router']['ip'])?>"></div>
											</div>
										</td>
										<td>
											<div class="row form-group">
												<div><input type="text" id="demoDescribtion" name="[<?echo($key)?>][router][read]" validation="port" placeholder="Port" class="form-control" value="<?echo($value['router']['read'])?>"></div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
<? 				} ?>
			</div>
		</div>
	</div>
	<div class="pageFooter">
		2018 Ronen Baram. <span style="font-size: 0.8em;">Distributed under GPLv3. Based on Sufee Admin Dashboard, Jquery, Bootstrap and more.</span>
	</div>


	<script src="../src/jquery-3.3.1.js"></script>

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('input').on('change', function(item) {								// On any change in any of the input fields, an update will be made to the JSON file
				var valid = 0;														// It is wasteful, but we don't really care.
				switch($(item.target).attr('validation')) {							// Check the value entered is valid. Very basic validation! Read the validation type from the validation attribute inside the input element
					case 'text': 													// Text always valid. No check is done (me being lazy...)
						valid = 1;
						break;
					case 'ip': 														// IP needs to be valid though. Thanx stackoverflow for finding easy regex
						if (/^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$/.test(item.target.value)) {
							valid = 1;
						}
						break;
					case "port": 													// Port is only numbers.
						if (/^\d[0-9]*$/.test(item.target.value)) {
							valid = 1;	
						}
				}

				if (valid) {														// If value is valid
					$.ajax({														// Call ajax file editConfigAjax.php
						type: 'GET',
						url: 'editConfigAjax.php',
						data: {keyToUpdate: item.target.name, valueToUpdate: item.target.value},	// Send the key to send and the value. Keys are the names. Read more in editConfigAjax.php
						// success: function(result) {												// Not waiting for success code... It's here for debug only
						// 	console.log(result);
						// }
					});
					$(item.target).addClass('alert-success').removeClass('alert-danger');			// If validate succeed (not the ajax!) turn the input to green (hopefully the ajax will work)
				} else {
					$(item.target).addClass('alert-danger').removeClass('alert-success');			// If validation failed, no ajax will happen and the input field will turn red
				}
			});
		});
	</script>
</body>
</html>