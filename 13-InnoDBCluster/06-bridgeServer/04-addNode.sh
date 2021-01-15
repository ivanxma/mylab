. ./comm.sh
sleep 5

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$BRIDGE_HOST:3306', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'clone', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	localAddress:'$BRIDGE_HOST:13306',
	autoRejoinTries:120,
	memberWeight:20
	})

x.addInstance('gradmin:grpass@$BRIDGE_HOST:3316', {exitStateAction:'OFFLINE_MODE', 
	recoveryMethod:'clone', 
	ipAllowlist:'$CLUSTER_IPALLOWLIST',
	localAddress:'$BRIDGE_HOST:13316',
	autoRejoinTries:120,
	memberWeight:20
	})

print(x.status())
"

