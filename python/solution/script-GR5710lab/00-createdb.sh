. ./comm.sh
rm -rf /home/mysql/data
rm -rf /home/mysql/data2
mysqld --initialize-insecure --user=mysql --explicit_defaults_for_timestamp --basedir=/opt/mysql/mysql5710 --datadir=/home/mysql/data
mysqld --initialize-insecure --user=mysql --explicit_defaults_for_timestamp --basedir=/opt/mysql/mysql5710 --datadir=/home/mysql/data2

