PGM=`basename $0`
. ./comm.sh
mysqlsh --js -f stop.sc
mysqlsh --js -f start.sc

