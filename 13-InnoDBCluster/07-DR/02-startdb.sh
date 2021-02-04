. ./comm.sh

if [ $# -eq 0 ]
then
	mysqld_safe --defaults-file=config/my4.cnf &
	mysqld_safe --defaults-file=config/my5.cnf &
	mysqld_safe --defaults-file=config/my6.cnf &
else
	mysqld_safe --defaults-file=config/my${1}.cnf &
fi
	
