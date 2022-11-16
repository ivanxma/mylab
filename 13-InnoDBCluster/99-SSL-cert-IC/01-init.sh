. ./comm.sh

if [ $# -eq 0 ]
then
	rm -rf /home/mysql/data/3310

	mysqld --defaults-file=config/my1.cnf --initialize-insecure
else
	rm -rf /home/mysql/data/33${1}0
	mysqld --defaults-file=config/my${1}.cnf --initialize-insecure
fi
