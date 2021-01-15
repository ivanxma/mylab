. ./comm.sh

if [ $USER != "mysql" ]
then
	echo "Please use mysql as OS user to run the lab"
else

if [ -d /home/mysql/data/lab02 ]; then rm -rf /home/mysql/data/lab02;fi
if [ -d /home/mysql/data/my1 ];then rm -rf /home/mysql/data/my1;fi
if [ -d /home/mysql/data/my2 ];then rm -rf /home/mysql/data/my2;fi
if [ -d /home/mysql/data/my3 ];then rm -rf /home/mysql/data/my3;fi


mkdir -p /home/mysql/data/lab02
mkdir -p /home/mysql/data/my1
mkdir -p /home/mysql/data/my2
mkdir -p /home/mysql/data/my3

mysqld --defaults-file=etc/my.cnf --initialize-insecure 
mysqld --defaults-file=etc/my.cnf --defaults-group-suffix=@my1 --initialize-insecure
mysqld --defaults-file=etc/my.cnf --defaults-group-suffix=@my2 --initialize-insecure
mysqld --defaults-file=etc/my.cnf --defaults-group-suffix=@my3 --initialize-insecure

fi
