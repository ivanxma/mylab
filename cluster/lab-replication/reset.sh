DIRNAME=`dirname $0`
if [ $DIRNAME == "." ]
then
	DIRNAME=`pwd`
fi
. ./comm.sh
pkill -9 mysqld
pkill -9 mcmd
pkill -9 ndbd
pkill -9 ndbmtd
pkill -9 ndb_mgmd

rm -rf ~/mcm/mcm_data
rm -rf /tmp/mysql.mycluster*.sock
if [ $# -gt 0 ]
then
	if [ $1=="ALL"  -o $1=="all" ]
	then
		ssh $SECONDARY "$DIRNAME/reset.sh"
	fi
fi
