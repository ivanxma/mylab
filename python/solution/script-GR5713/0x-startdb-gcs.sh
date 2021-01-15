
if [ "$1" == "3306" ]
then
	mysqladmin -uroot -h127.0.0.1 -P3306 shutdown
fi
if [ "$1" == "3316" ]
then
	mysqladmin -uroot -h127.0.0.1 -P3316 shutdown
fi

sleep 5
if [ "$1" == "3306" ]
then
	mysqld --defaults-file=config/myG1.cnf > /home/mysql/data/my.log --group_replication_bootstrap_group=0 --group_replication_start_on_boot=1 2>&1 &
fi

if [ "$1" == "3316" ]
then
	mysqld --defaults-file=config/myG2.cnf > /home/mysql/data2/my.log --group_replication_bootstrap_group=0 --group_replication_start_on_boot=1 2>&1 &
fi
