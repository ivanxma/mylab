function get_cluster(session, context) {
  if (session) {
    try {
      return dba.getCluster();
    } catch (err) {
      throw "A session to a cluster instance is required: " + err.message
    } 
  } else {
    throw "A session must be established to execute this " + context
  }
}

function cluster_status(session, argv, options) {
  // Gets the cluster using the backend function above
  var cluster = get_cluster(session, "report")
 
  // Prints the Cluster status
  println(cluster.status())
 
  // A report must return a list always
  return {report:[]}
}

function chk_best_server(session, options) {

  if (! session) 
	throw "A session must be established to execute this report";
  
}


function get_best_server(session, argv, options) {


  chk_best_server(session, options)

  x0 = session;
  
  user=argv[0]
  pass=argv[1]
  
  q0 = x0.runSql(" select substring_index(endpoint,':', 1) as host, substring_index(endpoint, ':', -1) as port from mysql_innodb_cluster_metadata.v2_instances") 
  v0 = q0.fetchAll()
  
  var gtid = []
  
  for( i=0;i<v0.length;i++) {
  	sess = mysql.getSession(user + ":" + pass + "@" + v0[i][0] + ":" + v0[i][1])
  	myquery = sess.runSql('select @@gtid_executed;')
  	myvalue = myquery.fetchAll()
  	gtid[i] = myvalue[0][0]
  	sess.close()
  }
  
  println('{')
  println(' "nodes": [')
  
  for (i=0; i<v0.length;i++) {
    
    if (i > 0 ) println(',')
      print('{ "host":"')
        print(v0[i][0] + '", ' )
        print('"port":' + v0[i][1] + ', ')
        print('"gtid":"'+ gtid[i] + '" ')
      print('}')
  
  }
  
  println(']')
  
  var cur_conn=0;
  var isPrimary=false
  var primaryServer = "not found"
  var primaryServerCount = -1
  while (cur_conn < v0.length && !isPrimary) {
    isPrimary=true
    for (i=0;i<v0.length && isPrimary;i++) { 
      if (i != cur_conn) {
        myquery = x0.runSql("select gtid_subset( '" + gtid[i] + "','" +  gtid[cur_conn] + "');")
        myvalue = myquery.fetchAll()
        if (myvalue[0][0] != 1) {
          isPrimary=false;
        }
      }
    }
    if (isPrimary) {
       primaryServer = v0[cur_conn][0] + ":" + v0[cur_conn][1]
       primaryServerCount = cur_conn
    }
    cur_conn++
  }
  
  println(',')
  
  if ( primaryServerCount > -1) {
  println(' "primary": { ')
  println('   "host":"' + v0[primaryServerCount][0] + '",')
  println('   "port":' + v0[primaryServerCount][1] + ',')
  println('   "gtid":"' + gtid[primaryServerCount] + '"')
  println(' }')
  } else {
  println(' { ')
  println('   "host":"notfound",')
  println('   "port":0,')
  println('   "gtid": ')
  println(' }')
  }
  
  println('}')

  return {report:[]}
}

/* Register the MySQL Shell report */
shell.registerReport("idc_status", "print", cluster_status, {brief: "Monitors the status of the cluster where the global session is connected"})


shell.registerReport("idc_servers", "print", 
  get_best_server, {
  brief: "Showing the IDC Best Server - idc_server adminUser, adminPassword",
  	'options': [ ],
        'argc': '2'
   }
 )
