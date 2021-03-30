. ./comm.sh

mcm << EOL

add process -R ndbmtd@$PRIMARY,ndbmtd@$PRIMARY 
mycluster1;

set DataMemory:ndbmtd=60M:3,DataMemory:ndbmtd=60M mycluster1;
set MaxNoOfConcurrentOperations:ndbmtd:3=100000,Arbitration:ndbmtd:4=waitexternal  mycluster1;
EOL

mcm -e "stop cluster mycluster1;"
mcm -e "start cluster mycluster1;"

ndb_desc -c $PRIMARY:1186 -d test -p mytable


mysql -uroot -h127.0.0.1 -P3316 -e "alter table test.mytable reorganize partition;"
mysql -uroot -h127.0.0.1 -P3316 -e "alter table test.mytable2 reorganize partition;"
mysql -uroot -h127.0.0.1 -P3316 -e "optimize table test.mytable;"
mysql -uroot -h127.0.0.1 -P3316 -e "optimize table test.mytable2;"

ndb_desc -c $PRIMARY:1186 -d test -p mytable
