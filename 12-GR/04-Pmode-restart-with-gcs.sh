. ./comm.sh
./stop.sh
echo "Starting mysqld"
mysqld --defaults-file=config/Pmode/myG1.cnf --plugin-dir=lib/plugin --plugin-load=group_replication.so --group_replication_bootstrap_group=on \
	> /home/mysql/data/my.log 2>&1 &

sleep 5
mysqld --defaults-file=config/Pmode/myG2.cnf --plugin-dir=lib/plugin --plugin-load=group_replication.so \
	> /home/mysql/data2/my.log 2>&1 &

sleep 5
mysqld --defaults-file=config/Pmode/myG3.cnf --plugin-dir=lib/plugin --plugin-load=group_replication.so \
	> /home/mysql/data3/my.log 2>&1 &
