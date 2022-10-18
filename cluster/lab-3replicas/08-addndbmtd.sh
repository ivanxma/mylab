. ./comm.sh

mcm << EOL

add process -R ndbmtd@primary,ndbmtd@primary,ndbmtd@primary 
mycluster1;

set DataMemory:ndbmtd=60M mycluster1;
set MaxNoOfConcurrentOperations:ndbmtd:4=100000,Arbitration:ndbmtd:4=waitexternal  mycluster1;
set MaxNoOfConcurrentOperations:ndbmtd:5=100000,Arbitration:ndbmtd:5=waitexternal  mycluster1;
set MaxNoOfConcurrentOperations:ndbmtd:6=100000,Arbitration:ndbmtd:6=waitexternal  mycluster1;
EOL

mcm -e "stop cluster mycluster1;"
mcm -e "start cluster mycluster1;"

ndb_desc -c primary:1186 -d test -p mytable


mysql -uroot -h127.0.0.1 -P3316 -e "alter table test.mytable reorganize partition;"
mysql -uroot -h127.0.0.1 -P3316 -e "alter table test.mytable2 reorganize partition;"
mysql -uroot -h127.0.0.1 -P3316 -e "optimize table test.mytable;"
mysql -uroot -h127.0.0.1 -P3316 -e "optimize table test.mytable2;"

ndb_desc -c primary:1186 -d test -p mytable
