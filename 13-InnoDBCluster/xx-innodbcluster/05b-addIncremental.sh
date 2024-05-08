. ./comm.sh



mysqlsh --js --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$CLUSTER_HOST:3320', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'incremental', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	localAddress:'$CLUSTER_HOST:13320',
	autoRejoinTries:120,
	memberWeight:70
	})
print(x.status())
"

