if [ $# -ne 3 ]
then
	echo "Usage : `basename $0` <arg1> <arg2> <arg3>"
	echo "`basename $0` <mysqld-auto.cnf> <the static option> <Value>"
	echo "e.g. `basename $0` /var/lib/mysql/mysqld-auto.cnf group_replication_start_on_boot ON"
	exit
fi
PVARFILE=$1
OPTION=$2
VALUE=$2

if [ ~ -r ${PVARFILE}-ori ]
then
  cp ${PVARFILE} ${PVARFILE}-ori
fi

XX=`jq ".mysql_server.mysql_server_static_options.${OPTION}.Value" ${PVARFILE}`  
if [ "${XX}" != "null" ]
then
  eval jq '.mysql_server.mysql_server_static_options.${OPTION}.Value=\"${VALUE}\"' ${PVARFILE}-ori  > ${PVARFILE}
else
  echo "Invalid option"
fi
	
