pkill -9 mysqld
pkill -9 mcmd
pkill -9 ndbd
pkill -9 ndbmtd
pkill -9 ndb_mgmd

rm -rf ~/mcm/mcm_data
rm -rf /tmp/mysql.mycluster*.sock
