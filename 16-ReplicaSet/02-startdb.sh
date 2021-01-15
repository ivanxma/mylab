. ./comm.sh

if [ $# -eq 0 ]
then
	mysqld_safe --defaults-file=config/my1.cnf &
	mysqld_safe --defaults-file=config/my2.cnf &
	mysqld_safe --defaults-file=config/my3.cnf &
else
	mysqld_safe --defaults-file=config/my${1}.cnf &
fi
	
