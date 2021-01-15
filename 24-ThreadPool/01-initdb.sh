. ./comm.sh

if [ -d /home/mysql/data/lab24 ]
then
	rm -rf /home/mysql/data/lab24
fi
mkdir -p /home/mysql/data-lab/lab24

mysqld --defaults-file=config/my-threadpool.cnf --initialize-insecure --datadir=/home/mysql/data/lab24
