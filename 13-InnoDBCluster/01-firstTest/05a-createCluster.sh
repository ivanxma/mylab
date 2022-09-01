. ./comm.sh


mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "

var x = dba.createCluster('mycluster', {
	consistency:'BEFORE_ON_PRIMARY_FAILOVER',
	expelTimeout:30,
	memberSslMode:'REQUIRED',
	clearReadOnly:true,
	interactive:false,
	autoRejoinTries:120,
	memberWeight:80
	})
x = dba.getCluster()
print(x.status())
"

