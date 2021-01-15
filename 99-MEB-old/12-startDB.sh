. ./comm.sh

if [ $# -ne 0 ]
then
	echo "Usage : $0 "
	exit 1
fi

mysqld --defaults-file=config/my2.cnf > mytest1.out 2>&1 &
