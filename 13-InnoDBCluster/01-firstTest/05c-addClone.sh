. ./comm.sh
sleep 5

mysqlsh --uri gradmin:grpass@$CLUSTER_HOST:3310 -e "
x = dba.getCluster()
x.addInstance('gradmin:grpass@$CLUSTER_HOST:3330', {
	recoveryMethod:'clone', 
	autoRejoinTries:120,
	memberWeight:60
	})

print(x.status())
"

