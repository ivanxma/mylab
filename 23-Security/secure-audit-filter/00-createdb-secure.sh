. ./comm.sh

rm -rf /home/mysql/data/lab23
mkdir -p /home/mysql/data/lab23


echo "Initialize MySQL DB  ...."
mysqld --defaults-file=config/my1-secure.cnf --initialize --datadir=/home/mysql/data/lab23 --user=mysql 

echo "Setting up ssl rsa ..."
mysql_ssl_rsa_setup -v --datadir=/home/mysql/data/lab23
