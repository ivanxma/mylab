
. ./comm.sh
rm -rf /home/mysql/data/31a
rm -rf /home/mysql/data/31b

mysqld --defaults-file=config/my1.cnf --initialize-insecure --basedir=$MYSQL_HOME --datadir=/home/mysql/data/31a --user=mysql
mysqld --defaults-file=config/my2.cnf --initialize-insecure --basedir=$MYSQL_HOME --datadir=/home/mysql/data/31b --user=mysql
