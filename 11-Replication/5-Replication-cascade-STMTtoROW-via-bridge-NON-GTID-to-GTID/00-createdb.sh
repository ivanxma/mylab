
. ./comm.sh
rm -rf /home/mysql/data/31a
rm -rf /home/mysql/data/31b
rm -rf /home/mysql/data/31c

mysqld --defaults-file=config/my1a.cnf --initialize-insecure --basedir=$MYSQL_HOME --datadir=/home/mysql/data/31a --user=mysql
mysqld --defaults-file=config/my2a.cnf --initialize-insecure --basedir=$MYSQL_HOME --datadir=/home/mysql/data/31b --user=mysql
mysqld --defaults-file=config/my3a.cnf --initialize-insecure --basedir=$MYSQL_HOME --datadir=/home/mysql/data/31c --user=mysql
