. ./comm.sh

#
# Note : setting arbitration as waitexternal is for demonstration ONLY.   
# 
# -- set ndb_data_node_neighbour:mysqld:<nodeid for first mysqld>=1,ndb_data_node_neighbour:mysqld:<nodeid for 2nd mysqld>=2 mycluster1;

tabs 15
mcm << EOL

list sites;

create site --hosts=$PRIMARY,$SECONDARY mysite;
add package -b $MYSQL_PATH cluster.pkg;
create cluster -P cluster.pkg --processhosts=ndbmtd@$PRIMARY,ndbmtd@$SECONDARY,mysqld@$PRIMARY,mysqld@$SECONDARY,ndb_mgmd@$PRIMARY,ndb_mgmd@$SECONDARY,ndbapi@*,ndbapi@*,ndbapi@* mycluster1;


set MaxNoOfConcurrentOperations:ndbmtd=100000,Arbitration:ndbmtd=waitexternal,port:mysqld=3316 mycluster1;

get Arbitration:ndbmtd,MaxNoOfConcurrentOperations:ndbmtd mycluster1;

set ndb_fully_replicated:mysqld=1,ndb_read_backup:mysqld=1 mycluster1;

get *:mysqld mycluster1;



EOL

./status.sh

echo 3316 > myport.txt
