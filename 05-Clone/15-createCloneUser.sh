. ./comm.sh

# please note that the clone_admin is created in this empty database
# however, the 3306 has clone_user (but 3306 does not have clone_adminuser
# right after cloning, we can check the SELECT user,host from mysql.user
#

mysql -uroot -h127.0.0.1 -P3316 -pmysql << EOL
drop user clone_adminuser@'localhost';
create user clone_adminuser@'localhost' identified by 'clone';
grant clone_admin  on *.* to clone_adminuser@'localhost';
SET GLOBAL clone_valid_donor_list = 'primary:3306';

EOL

mysql -uroot -h127.0.0.1 -P3306 -pmysql << EOL
drop user clone_remote@'%';
create user clone_remote@'%' identified by 'clone';

grant backup_admin on *.* to clone_remote@'%';
EOL


