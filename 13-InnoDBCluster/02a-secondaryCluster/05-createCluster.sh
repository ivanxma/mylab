. ./comm.sh


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
	recoveryMethod:'incremental', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
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
	recoveryMethod:'incremental', 
	localAddress:'$SECONDARY_HOST:13360',
	autoRejoinTries:120,
	memberWeight:60
	})
print(x.status())
"

