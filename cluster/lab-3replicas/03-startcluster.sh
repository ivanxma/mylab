DIRNAME=`dirname $0`
. $DIRNAME/comm.sh
mcm << EOL

start cluster mycluster1;

EOL

./status.sh

mysql -t -uroot -h127.0.0.1 -P3316 -e " select * from ndbinfo.memoryusage;"
ndb_mgm -e "all report memory"
