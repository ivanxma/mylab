. ./comm.sh

if [ $# -eq 0 ]
then
mysqlsh -e "
dba.checkInstanceConfiguration('gradmin:grpass@$SECONDARY_HOST:3340');
dba.checkInstanceConfiguration('gradmin:grpass@$SECONDARY_HOST:3350');
dba.checkInstanceConfiguration('gradmin:grpass@$SECONDARY_HOST:3360');
"

else
SS="3310 3320 3330 3340 3350"
PORT=`echo $SS|cut -f${1} -d\  `

mysqlsh -e "
dba.checkInstanceConfiguration("gradmin:grpass@$SECONDARY_HOST:$PORT");
"


fi


