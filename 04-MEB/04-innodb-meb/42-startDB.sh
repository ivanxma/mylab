. ./comm.sh

if [ $# -ne 0 ]
then
	echo "Usage : $0 "
	exit 1
fi

mysqld_safe --defaults-file=config/my2.cnf > mytest1.out 2>&1 &
mysqld_safe --defaults-file=config/my3.cnf >> mytest1.out 2>&1 &
