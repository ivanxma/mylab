. ./comm.sh

mysql -uclone_adminuser -h127.0.0.1 -P3316 -pclone << EOL

-- SET GLOBAL clone_valid_donor_list = 'primary:3306';

CLONE INSTANCE FROM clone_remote@primary:3306  identified by 'clone';

EOL
