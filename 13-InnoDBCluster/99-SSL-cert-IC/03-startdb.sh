. ./comm.sh

pkill -9 mysqld


if [ $# -eq 0 ]
then
	mysqld_safe --defaults-file=config/my1.cnf &
else
	mysqld_safe --defaults-file=config/my${1}.cnf &
fi
	
