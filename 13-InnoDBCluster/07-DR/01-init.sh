. ./comm.sh

if [ $# -eq 0 ]
then
	rm -rf /home/mysql/data/3340
	rm -rf /home/mysql/data/3350
	rm -rf /home/mysql/data/3360

	mysqld --defaults-file=config/my4.cnf --initialize-insecure
	mysqld --defaults-file=config/my5.cnf --initialize-insecure
	mysqld --defaults-file=config/my6.cnf --initialize-insecure
else
	rm -rf /home/mysql/data/33${1}0
	mysqld --defaults-file=config/my${1}.cnf --initialize-insecure
fi
