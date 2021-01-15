. ./comm.sh
rm -rf /home/mysql/data
rm -rf /home/mysql/data2
rm -rf /home/mysql/data3
mysqld --initialize-insecure --user=mysql --explicit_defaults_for_timestamp --basedir=$MYSQL_HOME --datadir=/home/mysql/data
mysqld --initialize-insecure --user=mysql --explicit_defaults_for_timestamp --basedir=$MYSQL_HOME --datadir=/home/mysql/data2
mysqld --initialize-insecure --user=mysql --explicit_defaults_for_timestamp --basedir=$MYSQL_HOME --datadir=/home/mysql/data3

