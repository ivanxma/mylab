. ./comm.sh
sleep 5

mysqlsh --js --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$CLUSTER_HOST:3306', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'clone', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	localAddress:'$CLUSTER_HOST:13306',
	autoRejoinTries:120,
	memberWeight:20
	})

print(x.status())
"

