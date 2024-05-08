
ssh mysql@$CLUSTER_HOST "/usr/local/mysql/bin/mysql -uroot -h127.0.0.1 -P3310 -e \"drop user repl@'%';\""

ssh mysql@$CLUSTER_HOST "/usr/local/mysql/bin/mysql -uroot -h127.0.0.1 -P3310 -e \"create user repl@'%' identified by 'repl';\""

ssh mysql@$CLUSTER_HOST "/usr/local/mysql/bin/mysql -uroot -h127.0.0.1 -P3310 -e \"grant replication slave on *.* to repl@'%';\""
