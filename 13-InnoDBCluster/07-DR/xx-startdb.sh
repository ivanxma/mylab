. ./comm.sh
if [ "$1" == "options" ]
then
	OPTIONS="--persisted-globals-load=OFF"
fi

if [ $# -eq 0 ]
then
	mysqld_safe --defaults-file=config/my1.cnf ${OPTIONS} &
	mysqld_safe --defaults-file=config/my2.cnf ${OPTIONS} &
	mysqld_safe --defaults-file=config/my3.cnf ${OPTIONS} &
else
	mysqld_safe --defaults-file=config/my${1}.cnf ${OPTIONS} &
fi
	
