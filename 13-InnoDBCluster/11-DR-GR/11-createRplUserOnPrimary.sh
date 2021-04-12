. ./comm.sh

mysql -ugradmin -pgrpass -h$PRIMARY -P3310 << EOL

create user if not exists repl@'%' identified with mysql_native_password by 'repl';grant replication client, replication slave on *.* to repl@'%';

EOL
