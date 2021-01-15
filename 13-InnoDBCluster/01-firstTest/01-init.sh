. ./comm.sh

if [ $# -eq 0 ]
then
	rm -rf /home/mysql/data/3310
	rm -rf /home/mysql/data/3320
	rm -rf /home/mysql/data/3330

	mysqld --defaults-file=config/my1.cnf --initialize-insecure
	mysqld --defaults-file=config/my2.cnf --initialize-insecure
	mysqld --defaults-file=config/my3.cnf --initialize-insecure
else
	rm -rf /home/mysql/data/33${1}0
	mysqld --defaults-file=config/my${1}.cnf --initialize-insecure
fi
