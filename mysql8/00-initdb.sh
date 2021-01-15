. ./comm.sh

rm -rf /home/mysql/data/mysql8
mkdir -p /home/mysql/data/mysql8

mysqld --initialize-insecure --datadir=/home/mysql/data/mysql8/ --user=mysql
