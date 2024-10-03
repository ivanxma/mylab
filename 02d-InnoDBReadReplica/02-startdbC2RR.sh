. ./comm.sh

if [ $# -eq 0 ]
then
	mysqld_safe --defaults-file=config/my44.cnf &
	mysqld_safe --defaults-file=config/my55.cnf &
	mysqld_safe --defaults-file=config/my66.cnf &
else
	mysqld_safe --defaults-file=config/my${1}.cnf &
fi
	
