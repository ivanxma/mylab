. ./comm.sh

#
# Note : setting arbitration as waitexternal is for demonstration ONLY.   
# 
while [ 1 ]
do
	sleep 1
	mcm -e "list sites;"
	if [ $? -eq 0 ]
	then
		break
	fi
done

mcm << EOL

list sites;

create site --hosts=$PRIMARY,$SECONDARY mysite;
add package -b $MYSQL_PATH cluster.pkg;
create cluster -P cluster.pkg --processhosts=ndbmtd@$PRIMARY,ndbmtd@$PRIMARY,mysqld@$PRIMARY,ndb_mgmd@$PRIMARY,ndbapi@*,ndbapi@*,ndbapi@* mycluster1;
-- create cluster -P cluster.pkg --processhosts=ndbd@$PRIMARY,ndbd@$PRIMARY,ndb_mgmd@$PRIMARY,ndbapi@*,ndbapi@*,ndbapi@* mycluster1;

create cluster -P cluster.pkg --processhosts=ndbmtd@$SECONDARY,ndbmtd@$SECONDARY,mysqld@$SECONDARY,ndb_mgmd@$SECONDARY,ndbapi@*,ndbapi@*,ndbapi@* mycluster2;
-- create cluster -P cluster.pkg --processhosts=ndbd@$SECONDARY,ndbd@$SECONDARY,ndb_mgmd@$SECONDARY,ndbapi@*,ndbapi@*,ndbapi@* mycluster2;

set MaxNoOfConcurrentOperations:ndbmtd=100000 mycluster1;
set MaxNoOfConcurrentOperations:ndbmtd=100000 mycluster2;
set Arbitration:ndbmtd=waitexternal mycluster1;
set Arbitration:ndbmtd=waitexternal mycluster2;
set port:mysqld=3316 mycluster1;
set port:mysqld=3316 mycluster2;
set ndb-log-update-as-write:mysqld=off,ndb-log-bin:mysqld=on mycluster1;
set ndb-log-update-as-write:mysqld=off,ndb-log-bin:mysqld=on mycluster2;

get Arbitration:ndbmtd,MaxNoOfConcurrentOperations:ndbmtd mycluster1;
get Arbitration:ndbmtd,MaxNoOfConcurrentOperations:ndbmtd mycluster2;


show status -r mycluster1;
show status -r mycluster2;

EOL

echo 3316 > myport.txt

./21-setRep.sh
