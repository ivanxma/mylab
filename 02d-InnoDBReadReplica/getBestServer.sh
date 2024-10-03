# Only valid for InnoDB Cluster meta data v2 (8.0.19+)
#
. ./comm.sh


if [ $# -le 2 ]
then
	echo "$0 <server> <user> <password> <show>"
	echo "<server> : host:port"
	echo "<user> : The user name to connect"
	echo "<password : The password to connect"
	echo "<output type> : json | text"
	exit
fi

if [ $# -eq 3 ]
then
	OTYPE='json'
else
	OTYPE=$4
fi

SERVER=$1
USER=$2
PASS=$3

if [ $OTYPE != 'json' || $OTYPE != 'text' ]
then
	echo "<output type> can only be 'json' or 'text'"
	exit
fi

mysqlsh --js << EOF

x0 = mysql.getSession("${USER}:${PASS}@${SERVER}" ) 

q0 = x0.runSql("select substring_index(endpoint,':', 1), substring_index(endpoint, ':', -1) as host from v2_instances;")
v0 = q0.fetchAll()

var gtid = []

for( i=0;i<v0.length;i++) {
	sess = mysql.getSession("${USER}:${PASS}@" + v0[i][0] + ":" + v0[i][1])
	myquery = sess.runSql('select @@gtid_executed;')
	myvalue = myquery.fetchAll()
	gtid[i] = myvalue[0][0]
	sess.close()
}

if ( $OTYPE == 'text') 
  println("GTIDs")
if ( $OTYPE == 'json') {
  println('{')
  println(' "nodes": [')
}

for (i=0; i<v0.length;i++) {
  
  if ( $OTYPE == 'text') 
    println(v0[i][0] + ":" + v0[i][1] + " ===> ", gtid[i])

  if ( $OTYPE == 'json')  {
    if (i > 0 ) println(',')
    print('"{ host":"')
      print(v0[i][0] + '", ' )
      print('"port":' + print(v0[i][1] + ', ')
      print('"gtid":"'+ gtid[i]) + '" }')
    print('}')
  }

}
if ( $OTYPE == 'json') println(']')

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

if ($OTYPE == 'text' ) {
println("Primary Server : ", primaryServer)
println("Primary Server ID: ", primaryServerCount)
println("GTID : " + gtid[primaryServerCount])
}

if ($OTYPE == 'json') {
println(',')

if ( primaryServerCount > -1) {
println(' " primary: { ')
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
}

EOF
