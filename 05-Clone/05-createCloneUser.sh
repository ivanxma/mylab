. ./comm.sh
mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL
create user clone_user@'localhost' identified by 'clone';

grant backup_admin on *.* to clone_user@'localhost';
EOL


