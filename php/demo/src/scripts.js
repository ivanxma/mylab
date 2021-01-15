// This is the main JavaScript file.

// Initializing few variables we need globally across the page
var topDogsChart;
var serverCharts = [];
var serverStatusAndStats = [];

jQuery(document).ready(function($) {
	// Calculate the size of the page on reload. We only need to deal with height. Width is managed by bootstrap grid
	var windowHeight = $(window).height() - $('#header').height();		// Height of the page minus the header
	$('.topCard').height(Math.floor(windowHeight * 0.42));				// Height of the top windows (live log and top dog chart)
	$('.bottomCard').height(Math.floor(windowHeight * 0.44));			// Height of the bottom charts (servers stats)

	$('#stopAllAjaxOnPageHack').on('click', function() {				// When hitting on the amount of transaction widget (in the header), all ajax calls will be stopped
		for (var i = 1; i < 99999; i++) {								// This is an Easter egg. This is how you clear all setInterval on a page.
        	window.clearInterval(i);
        }
        console.log('Stopped all setInterval on page!');
	});


	var worker;
	var liveLog;
	$('#stream').on('change', function() {														// When the worker switch is changed...
		if ($('#stream').prop('checked')) {														// If it's moved into "on" position
			
			if(typeof(EventSource) !== "undefined") {											// If server of browser doesn't support SSE, send an error
				worker = new EventSource("./pages/worker.php?demoID=" + $("#demoID").val());	// Start a stream to the worker.php (create new transactions)
				liveLog = new EventSource("./pages/liveLog.php?demoID=" + $("#demoID").val());	// Start a stream for the live log.
				
				worker.addEventListener('streamRunning', function(e) {									// This is the dummy data from worker.php. Only blinking the LED.
					$('#switchHandleLed').css('background-color', 'red').css('opacity', 1).animate({	// If there's no blink it means that there's no new data.
						opacity: 0
					},500);
				});

				liveLog.addEventListener('liveLog', function(e) {										// Dealing with new live log from liveLog.php
					var data = JSON.parse(e.data);														// Adding new lines to the top of the tables
					$('#liveLog').prepend('<tr><th scope="row">' + data.sender + '</td><td>' + data.receiver + '</td><td>' + data.amount + '</td><td>' + data.fee + '</td></tr>');
					$('#liveLog').children().slice(20).remove();										// Removing all lines from line 20 onwards (can't be seen anymore anyway)
				});																						// Keep this element small (memory wise)
			} else {
				document.documentElement.innerHTML = "Sorry, your browser does not support server-sent events...";		// If the browser doesn't support web streams.
			}
		} else {
			worker.close();					// If the worker switch moved to "off", stop both streams.
			liveLog.close();				// And make sure the LED is white.
			$('#switchHandleLed').stop().css('background-color', 'white').css('opacity', '1');
		}
	});

	var ctx = $("#topDogs");								// Create the top dogs bubble chart.
	topDogsChart = new Chart(ctx, {
		type: 'bubble',
		data: {												// 10 datasets. Allow for different colors.
			datasets: [{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			},
			{
				data: []
			}]
		},
		options: {
			maintainAspectRatio: false,							// Making it possible to make the graph in such a way it fills the space, otherwise it'll be smaller due to aspect ratio.
			responsive: true,									// Make the graph change it size when the container resize
			legend: {
				display: false									// Don't display the datasets labels. We don't need them and it'll look stupid
			},
			title: {
				display: true,									// Show the graph title
				text: 'Top Dogs'
			},
			scales: {
				yAxes: [{
					scaleLabel: {
						display: true,							// Show the X axes label and set to "sent" (aka money was sent)
						labelString: 'Sent'
					}
				}],
				xAxes: [{
					scaleLabel: {
						display: true,							// Show the Y axes label and set to "receive" (aka money was sent)
						labelString: 'Received'
					}
				}]
			}
		}
	});

	// Dynamically, based on the number of servers in the config file, build the servers stats graphs
	config.config[$('#demoID').val()].servers.forEach(function(e, index) {				// Iterate over all the servers in the config file
		serverStatusAndStats[index] = '{"time": 0, "read": 0, "write": 0}';				// Initiate the last stats value for each server (so we can calc difference for each read)
		var ctx = $('#serverGraph' + index);											// Create graph and link to the element ID on the page (index.php)
		serverCharts[index] = new Chart(ctx, {
			type: 'line',
			data: {
				datasets: [																// 2 datasets for writes and reads
					{
						label: "Writes",
						backgroundColor: 'rgb(255, 0, 0)',								// Red
						borderColor: 'rgb(, 0, 0)'
						// lineTension: 0,
					} , {
						label: "Reads",
						backgroundColor: 'rgb(0, 0, 255)',								// Blue
						borderColor: 'rgb(0, 0, 0)'
						// lineTension: 0,
					}
				]
			},
			options: {
				maintainAspectRatio: false,
				responsive: true,
				legend: {
					display: false
				},
				scales: {
					yAxes: [
						{
							ticks: {
								beginAtZero: true										// Start at zero rather then min. Looks much nicer
							},
							stacked: true 												// Stacked graph; reads are on top of writes
						}
					],
					xAxes: [
						{
							type: "time",												// X axis is time based, we have to provide each point as {x or t: time, y: value}
							time: {
								unit: 'second',											// Units to parse for the x or t input
								parser: 'h:mm:ss a'										// Format for x or t, example: "03:48:17 AM"
							},
							stacked: true,
							display: false												// Don't display time labels. It has no meaning for us
						}
					]
				}
			}
		})
	});

/*************************************************************************************************************************************/
/*
/*	ajax call to update the top dog graph. Will be called every 1.5 seconds.
/*	Has three elements:
/*		- setInterval: to call the ajax function every certain amount of time
/*		- topDogsUpdateAjax: ajax call to /pages/ajax.php. This is async, so there's a call back to deal with the result
/*		- topDogsUpdate: callback from ajax call
/*
/*************************************************************************************************************************************/
	setInterval(topDogsUpdateAjax, 1500);
	function topDogsUpdateAjax() {
		if ($('#stream').prop('checked')) {										// We call the ajax only if the worker is on "on"
			$.ajax({
				type: 'POST',
				url: './pages/ajax.php?demoID=' + $("#demoID").val(),
				data: {'data': '{"facility": "topDogUpdate"}'},
				success: function(result) {										// On ajax success, call the callback function topDogsUpdate and send the ajax result to it
					topDogsUpdate(result);
				}
			});
		}
	}

	function topDogsUpdate(result) {											// Call back from ajax
		result = JSON.parse(result);
		var pointSmall = 1;														// We want to have different circle sizes based on how much fee they paid
		var pointLarge = 20;													// Since the circle size within the graph is NOT scaled (read Chart.js docs)
		var feeMin = parseFloat(result.feeMin);									// So it's pixel size. 1 pixel will be minimum fee paid (top 10) and 20 will be the max
		var feeMax = parseFloat(result.feeMax);

		result.topDogs.forEach(function(e, index) {								// Iterate over the 10 top dogs and calc the size of the circle based on how much they paid.
			rad = Math.floor(5 + (parseFloat(e.fee) - feeMin) * ((pointLarge - pointSmall) / (feeMax - feeMin)));		// Size. In pixels
			topDogsChart.data.datasets[index].label = e.name;															// Name of this "dog"
			topDogsChart.data.datasets[index].backgroundColor = stringToColour(e.name);									// Set a random background color based on the name
			topDogsChart.data.datasets[index].data[0] = {x: parseFloat(e.received), y: parseFloat(e.sent), r: rad};		// How much they sent and receive
		});

		topDogsChart.update();													// Updating the top dog graph with the current data, with animation.
	}

	function stringToColour(str) {												// Function to convert a string (name in this case) to a hex color to use as a bubble color.
  		var hash = 0;
  		for (var i = 0; i < str.length; i++) {
    		hash = str.charCodeAt(i) + ((hash << 5) - hash);
  		}
  		var colour = '#';
  		for (var i = 0; i < 3; i++) {
    		var value = (hash >> (i * 8)) & 0xFF;
    		colour += ('00' + value.toString(16)).substr(-2);
  		}
  		return colour;
	}

/*************************************************************************************************************************************/
/*
/*	ajax call to update the header widgets
/*	Has three elements:
/*		- setInterval: to call the ajax function every certain amount of time
/*		- headerWidgetsUpdateAjax: ajax call to /pages/ajax.php. This is async, so there's a call back to deal with the result
/*		- headerWidgetsUpdate: callback from ajax call
/*
/*************************************************************************************************************************************/

	setInterval(headerWidgetsUpdateAjax, 1000);
	function headerWidgetsUpdateAjax() {
		if ($('#stream').prop('checked')) {										// We call the ajax only if the worker is on "on"
			$.ajax({
				type: 'POST',
				url: './pages/ajax.php?demoID=' + $("#demoID").val(),
				data: {'data': '{"facility": "headerWidgetsUpdate"}'},
				error: function(result) {										// Sometimes the call will fail due to server going away. That's ok, we just log it and move on.
					console.log('ajax failed. Probably due to server going away. All good, will try again...');
				},
				success: function(result) {										// On ajax success, call the callback function headerWidgetsUpdate and send the ajax result to it
					headerWidgetsUpdate(result);
				}
			});
		}
	}

	function headerWidgetsUpdate(result) {										// Call back from ajax
		result = JSON.parse(result);
		$('#widgetBalance').html(result.sumBalance + '$');						// Update the total balance widget
		$('#widgetFees').html(result.sumFee + '$');								// Update the total fees widget
		$('#widgetUsers').html(result.totalUsers);								// Update the total users widget
		$('#widgetTransactions').html(result.totalTransactions);				// Update the total transactions widget
	}

/*************************************************************************************************************************************************/
/*
/*	ajax call to update the servers stat graphs (bottom part of the page)
/*	Has three elements:
/*		- setInterval: to call the ajax function every certain amount of time
/*		- updateServersStatusAndGraphsAjax: ajax call to /pages/serverStatusAjax.php. This is async, so there's a call back to deal with the result
/*		- updateServersStatusAndGraphs: callback from ajax call
/*
/*************************************************************************************************************************************************/

	setInterval(updateServersStatusAndGraphsAjax, 1300);
	function updateServersStatusAndGraphsAjax() {
		config.config[$('#demoID').val()].servers.forEach(function(e, index) {										// Fire few ajax calls in parallel, based on the number of servers.
			$.ajax({																								// Each server has it's own ajax call.
				type: 'POST',
				url: './pages/serverStatusAjax.php?demoID=' + $("#demoID").val() + '&serverID=' + index,			// Sending the server ID along with the demoID
				error: function(result) {																			// Sometimes the call will fail due to server going away. That's ok, we just log it and move on.
					console.log('ajax failed. Probably due to server going away. All good, will try again...');
				},
				success: function(result) {																			// On ajax success, call the callback function updateServersStatusAndGraphs and send the ajax result to it
					updateServersStatusAndGraphs(result);
				}
			})
		})
	}

	function updateServersStatusAndGraphs(result) {											// Call back from ajax
		result = JSON.parse(result);														// Record the server ID. ajax calls can come in different order then they were fired due to the async
		var index = result.serverID;														// manner of ajax. This will make sure we update the correct graph. index will now point to the correct graph
		if (result.status == 0) {															// If server status is "0", that means OFFLINE
			$('#serverGraphText' + index).text('OFFLINE');									// Change the text header to "OFFLINE"
			$('#serverGraphText' + index).css('color', 'red');								// In Red text
			$('#serverGraph' + index).fadeOut('slow');										// Hide the graph itself (no graph appear if the server is OFFLINE)
			$('#serverGraphTextNoOfTransactions' + index).fadeOut();						// The text with the number of transactions in the graph header will be hidden as well.
			serverStatusAndStats[index] = '{"time": 0, "read": 0, "write": 0}';				// Server previous stats will zero, so when the graph comes back it will be fresh
			serverCharts[index].data.datasets.forEach(function(dataset) {					// Zero all the datasets for this graph, to make it fresh when it comes back
				dataset.data = [];
			});
			serverCharts[index].update();													// Even thought the graph is not displayed, update it with no dataset will clean it
		}																					// When it re-appear, it will be clean.

		if (result.status == 1) {															// If servers is ONLINE
			$('#serverGraphText' + index).html('Online');									// Change the text header to "Online"
			$('#serverGraphText' + index).css('color', 'green');							// In Green text
			if ($('#stream').prop('checked')) {												// Only if the worker switch is on (AND the server is online):
				$('#serverGraph' + index).css('display', 'block');							// Show the graph
				$('#serverGraphTextNoOfTransactions' + index).fadeIn();						// Show the "No of transaction text" and update the current count
				$('#serverGraphTextNoOfTransactions' + index).html('No of transactions: ' + result.noOfTransactions);

				var serverStats = JSON.parse(serverStatusAndStats[index]);					// Read the previous stats from the global variable into temp variable
				serverStatusAndStats[index] = '{"time": "' + result.time + '", "read": ' + result.read + ', "write": ' + result.write + '}';	// Update the global variable with the current stats

				if (serverStats.time != 0) {												// If previous reading was not zero (meaning it was only initiated or hidden)
					var read = (result.read - serverStats.read);							// Calc the difference between provisos and current reads and writes
					var write = (result.write - serverStats.write);

					serverCharts[index].data.datasets.forEach(function(dataset) {			// Update the graph dataset
						if (dataset.data.length > 19) {										// If there are 20 or more datapoints, delete the oldest one to keep the graph with max 20 points (live graph)
							dataset.data.shift();
						}
						if (dataset.label == 'Writes') {									// Update the writes dataset
							dataset.data.push(JSON.parse('{"t": "'+result.time+'", "y": '+write+'}'));
						}
						if (dataset.label == 'Reads') {										// Update the reads dataset
							dataset.data.push(JSON.parse('{"t": "'+result.time+'", "y": '+read+'}'));
						}
					});

					var graphMax = [];														// This variable will hold the max point of ALL the graphs (not just the current one)
																							// This will allow us to scale ALL graphs to the same scale. Looks better.
					serverCharts.forEach(function(graphObj) {								// Reads ALL the stats graphs on the page
						for (var i = 0; i < graphObj.data.datasets[0].data.length; i++) {	// Iterate through both datasets (write and read) and sum write + reads in graphMax array
							graphMax.push(graphObj.data.datasets[0].data[i]["y"] + graphObj.data.datasets[1].data[i]["y"]);
						};
					});

					graphMax = Math.max(...graphMax);										// Finding max. This is a workaround to use with Math.max and arrays

					serverCharts.forEach(function(graphObj) {								// Setting the max + 10% for all graphs to make it pretty.
						graphObj.options.scales.yAxes[0].ticks.max = Math.floor(graphMax * 1.1);
						graphObj.update();													// Updating ALL the graphs with the new scale. The actual graph that had the datasets update
					});																		// Will also update with the new datasets, so no need to update it separately.
				}
			} else {																		// if the worker switch is OFF
				$('#serverGraph' + index).fadeOut('slow');									// Hide the graph
				$('#serverGraphTextNoOfTransactions' + index).fadeOut();					// Hide the text
				serverStatusAndStats[index] = '{"time": 0, "read": 0, "write": 0}';			// Reset previous reading for this server
				serverCharts[index].data.datasets.forEach(function(dataset) {				// Empty the graph datasets
					dataset.data = [];
				});
				serverCharts[index].update();												// Update the graph with empty datasets (clean the graph)
			}
		}
	}
});