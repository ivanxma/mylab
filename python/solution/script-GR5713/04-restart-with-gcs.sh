mysqladmin -uroot -h127.0.0.1 -P3306 shutdown
mysqladmin -uroot -h127.0.0.1 -P3316 shutdown
sleep 5
mysqld --defaults-file=config/myG1.cnf --plugin-dir=lib64/mysql/plugin --plugin-load=group_replication.so --group_replication_bootstrap_group=1 --group-replication_start_on_boot=0 \
	> /home/mysql/data/my.log 2>&1 &
mysqld --defaults-file=config/myG2.cnf --plugin-dir=lib64/mysql/plugin --plugin-load=group_replication.so --group_replication_bootstrap_group=0 --group-replication_start_on_boot=0 \
	> /home/mysql/data2/my.log 2>&1 &

