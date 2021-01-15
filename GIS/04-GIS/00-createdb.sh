
. ./comm.sh
rm -rf /home/mysql/data/04
mysqld --defaults-file=config/my.cnf --initialize-insecure --basedir=$MYSQL_HOME --datadir=$DATADIR -v --user=mysql 
