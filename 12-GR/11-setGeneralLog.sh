. ./comm.sh

if [ $# -eq 0 ]
then
	VALUE=ON
else
	VALUE=$1
fi

mysql -uroot -h127.0.0.1 -P3306 -e "set global general_log='$VALUE';"
mysql -uroot -h127.0.0.1 -P3316 -e "set global general_log='$VALUE';"
mysql -uroot -h127.0.0.1 -P3326 -e "set global general_log='$VALUE';"
