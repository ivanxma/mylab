#! /bin/bash
DIRNAME=`dirname $0`
. $DIRNAME/comm.sh
mysql -ugradmin -pgrpass -hsecondary -P6446 -e "select 1;" > /dev/null 2>&1
if [ $? != 0 ]
then
	exit 2
fi
