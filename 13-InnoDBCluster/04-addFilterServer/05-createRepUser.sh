
/usr/local/mysql/bin/mysql -uroot -h127.0.0.1 -P3310 -e "drop user repl@'%';"

/usr/local/mysql/bin/mysql -uroot -h127.0.0.1 -P3310 -e "create user repl@'%' identified with mysql_native_password by 'repl';"

/usr/local/mysql/bin/mysql -uroot -h127.0.0.1 -P3310 -e "grant replication slave, BACKUP_ADMIN, CLONE_ADMIN on *.* to repl@'%';"
