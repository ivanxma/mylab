. ./comm.sh

if [ $# -ne 0 ]
then
	echo "Usage : $0 "
	exit 1
fi

#mysqld_safe --defaults-file=config/my4.cnf --persisted-globals-load=OFF &
# Note : the mysqld-auto.cnf is not restored in this case!!!
mysqld_safe --defaults-file=config/my4.cnf &
