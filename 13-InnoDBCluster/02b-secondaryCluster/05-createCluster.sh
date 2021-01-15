. ./comm.sh


mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3340', {exitStateAction:'OFFLINE_MODE', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	recoveryMethod:'clone', 
	localAddress:'$SECONDARY_HOST:13340',
	autoRejoinTries:120,
	memberWeight:20
	})
print(x.status())
"
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3350', {exitStateAction:'OFFLINE_MODE', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	recoveryMethod:'clone', 
	localAddress:'$SECONDARY_HOST:13350',
	autoRejoinTries:120,
	memberWeight:20
	})
print(x.status())
"
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3360', {exitStateAction:'OFFLINE_MODE', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	recoveryMethod:'clone', 
	localAddress:'$SECONDARY_HOST:13360',
	autoRejoinTries:120,
	memberWeight:20
	})
print(x.status())
"
echo "Remvoing Cluster member $SECONDARY_HOST:3340/3350/3360"
mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.removeInstance('$SECONDARY_HOST:3360')
x.removeInstance('$SECONDARY_HOST:3350')
x.removeInstance('$SECONDARY_HOST:3340')
print(x.status())
"
echo "finished - Remvoing Cluster member $SECONDARY_HOST:3340/3350/3360"


mysqlsh --uri gradmin:grpass@$SECONDARY_HOST:3340 -e "

var x = dba.createCluster('mycluster', {exitStateAction:'OFFLINE_MODE',
	consistency:'BEFORE_ON_PRIMARY_FAILOVER',
	expelTimeout:30,
	memberSslMode:'REQUIRED',
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	clearReadOnly:true,
	interactive:false,
	localAddress:'$SECONDARY_HOST:13340',
	autoRejoinTries:120,
	memberWeight:80
	})
x = dba.getCluster()
print(x.status())
"

sleep 5

mysqlsh --uri gradmin:grpass@$SECONDARY_HOST:3340 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3350', {exitStateAction:'OFFLINE_MODE', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	recoveryMethod:'incremental', 
	localAddress:'$SECONDARY_HOST:13350',
	autoRejoinTries:120,
	memberWeight:70
	})
print(x.status())
"

sleep 5

mysqlsh --uri gradmin:grpass@$SECONDARY_HOST:3340 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$SECONDARY_HOST:3360', {exitStateAction:'OFFLINE_MODE', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	recoveryMethod:'incremental', 
	localAddress:'$SECONDARY_HOST:13360',
	autoRejoinTries:120,
	memberWeight:60
	})
print(x.status())
"

