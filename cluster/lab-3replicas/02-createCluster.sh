. ./comm.sh

#
# Note : setting arbitration as waitexternal is for demonstration ONLY.   
# 

tabs 10
mcm  << EOL

list sites;

create site --hosts=$PRIMARY mysite;
add package -b $MYSQL_PATH cluster.pkg;
create cluster -P cluster.pkg --processhosts=ndbmtd@$PRIMARY,ndbmtd@$PRIMARY,ndbmtd@$PRIMARY,mysqld@$PRIMARY,ndb_mgmd@$PRIMARY,ndbapi@*,ndbapi@*,ndbapi@* mycluster1;


set MaxNoOfConcurrentOperations:ndbmtd=100000,Arbitration:ndbmtd=waitexternal,port:mysqld=3316,NoOfReplicas:ndbmtd=3 mycluster1;

set DataMemory:ndbmtd=60M mycluster1;

get Arbitration:ndbmtd,MaxNoOfConcurrentOperations:ndbmtd,port:mysqld mycluster1;



EOL

./status.sh

echo 3316 > myport.txt
