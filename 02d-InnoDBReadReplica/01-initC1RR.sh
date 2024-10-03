. ./comm.sh

if [ $# -eq 0 ]
then
     for i in {1..3};
     do 	     
	rm -rf /home/mylab/data/44${i}0
	mysqld --defaults-file=config/my${i}${i}.cnf --initialize-insecure
     done
else
	rm -rf /home/mylab/data/44${1}0
	mysqld --defaults-file=config/my${1}${1}.cnf --initialize-insecure
fi
