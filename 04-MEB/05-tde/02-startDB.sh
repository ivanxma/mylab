. ./comm.sh

if [ $# -ne 0 ]
then
	echo "Usage : $0 "
	exit 1
fi

mysqld_safe --defaults-file=config/my1.cnf &
sleep 5
mysqld_safe --defaults-file=config/my2.cnf &
sleep 5
mysqld_safe --defaults-file=config/my3.cnf &
sleep 5
