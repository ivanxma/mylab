. ./comm.sh

if [ $# -eq 0 ]
then
mysqlsh --js -e "
dba.checkInstanceConfiguration('gradmin:grpass@$CLUSTER_HOST:4440');
dba.checkInstanceConfiguration('gradmin:grpass@$CLUSTER_HOST:4450');
dba.checkInstanceConfiguration('gradmin:grpass@$CLUSTER_HOST:4460');
"

else
SS="4410 4420 4430 4440 4450 4460"
PORT=`echo $SS|cut -f${1} -d\  `

mysqlsh --js -e "
dba.checkInstanceConfiguration("gradmin:grpass@$CLUSTER_HOST:$PORT");
"

fi


