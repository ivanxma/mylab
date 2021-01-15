. ./comm.sh

mysqlbackup --port=3306 --host=127.0.0.1 --protocol=tcp --user=root --password=mysql --backup-dir=/home/mysql/backup/full --backup-image=myimage.img  --with-timestamp  --compress --encrypt --key-file=myhexfile  backup-to-image
