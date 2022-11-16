. ./comm.sh


if [ "$HOST2" == "" ]
then
	export HOST2=$HOSTNAME
fi
if [ "$HOST3" == "" ]
then
	export HOST3=$HOSTNAME
fi


mysqlsh --uri gradmin:grpass@workshop20:3310 -e "
x = dba.getCluster()

x.addInstance('gradmin:grpass@$HOST2:3310', {exitStateAction:'OFFLINE_MODE',
        recoveryMethod:'incremental',
        autoRejoinTries:120,
	memberSslMode:'VERIFY_CA', 
        memberWeight:70
        })
x.addInstance('gradmin:grpass@$HOST3:3310', {exitStateAction:'OFFLINE_MODE',
        recoveryMethod:'incremental',
        autoRejoinTries:120,
	memberSslMode:'VERIFY_CA', 
        memberWeight:70
        })
print(x.status())
"

