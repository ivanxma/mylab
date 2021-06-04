. ./comm.sh

if [ $# -eq 0 ]
then
mysqlsh -e "
dba.checkInstanceConfiguration('gradmin:grpass@$CLUSTER_HOST:3310');
dba.checkInstanceConfiguration('gradmin:grpass@$CLUSTER_HOST:3320');
dba.checkInstanceConfiguration('gradmin:grpass@$CLUSTER_HOST:3330');
"

else
SS="3310 3320 3330 3340 3350"
PORT=`echo $SS|cut -f${1} -d\  `

mysqlsh -e "
dba.checkInstanceConfiguration("gradmin:grpass@$CLUSTER_HOST:$PORT");
"


fi


