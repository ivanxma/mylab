. ./comm.sh

if [ $USER != "mysql" ]
then
        echo "Please use mysql as OS user to run the lab"
else

if [ -d /home/mysql/data/lab10 ]
then
        rm -rf /home/mysql/data/lab10
fi
mkdir -p /home/mysql/data/lab10
mysqld  --defaults-file=config/my1.cnf --initialize
cat /home/mysql/data/lab10/my.error

fi
