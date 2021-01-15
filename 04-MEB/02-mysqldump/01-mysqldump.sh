. ./comm.sh

if [ ! -d ~/dump ]
then
	mkdir ~/dump
fi

rm ~/dump/mydump.sql



echo "********************************************"
echo "dumping....."
time mysqldump -uroot -pmysql -h127.0.0.1 -P3306 --all-databases --set-gtid-purged=auto --triggers --routines --events --single-transaction > ~/dump/mydump.sql

echo "********************************************"
ls -lh ~/dump/mydump.sql
echo "********************************************"

head ~/dump/mydump.sql


