. ./comm.sh


mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "

var x = dba.createCluster('mycluster', {exitStateAction:'OFFLINE_MODE',
	consistency:'BEFORE_ON_PRIMARY_FAILOVER',
	expelTimeout:30,
	memberSslMode:'REQUIRED',
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	clearReadOnly:true,
	interactive:false,
	localAddress:'$CLUSTER_HOST:13310',
	autoRejoinTries:120,
	memberWeight:80,
	communicationStack:'XCOM'
	})
x = dba.getCluster()
print(x.status())
"

