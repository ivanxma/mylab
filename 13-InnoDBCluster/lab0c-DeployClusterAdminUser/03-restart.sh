PGM=`basename $0`
. ./comm.sh
mysqlsh -f stop.sc
mysqlsh -f start.sc

