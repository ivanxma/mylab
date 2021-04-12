. ./comm.sh

mysql -ugradmin -pgrpass -h$PRIMARY -P3310 << EOL

create user repl@'%' identified with mysql_native_password by 'repl';grant replication client, replication slave on *.* to repl@'%';

EOL
