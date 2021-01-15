
. ./comm.sh

mysql -uclone_user -pclone -h127.0.0.1 -P3306 << EOL

clone local data directory = '/home/mysql/data/3316';

EOL
