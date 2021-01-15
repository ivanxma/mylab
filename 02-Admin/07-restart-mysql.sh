. ./comm.sh

# The 'restart' command is new command from MySQL 8.0
# 	It works with mysqld_safe or systemd to start MySQL Daemon
#	If mysqld is started using 'mysqld' on its own, the "restart" command does not work.
#
mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL
restart;
EOL
