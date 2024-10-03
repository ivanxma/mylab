. ./comm.sh

if [ $# -eq 0 ]
then
	mysqld_safe --defaults-file=config/my11.cnf &
	mysqld_safe --defaults-file=config/my22.cnf &
	mysqld_safe --defaults-file=config/my33.cnf &
else
	mysqld_safe --defaults-file=config/my${1}.cnf &
fi
	
