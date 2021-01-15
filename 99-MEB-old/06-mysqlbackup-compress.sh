. ./comm.sh
mysqlbackup --port=3306 --host=127.0.0.1 --protocol=tcp --user=root -pmysql --backup-dir=/home/mysql/backup/full --with-timestamp --backup-image=image3306-compressed.img --compress backup-to-image


ls -l ~/backup/full/*/*.img|more
