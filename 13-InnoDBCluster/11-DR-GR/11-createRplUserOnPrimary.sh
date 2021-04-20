. ./comm.sh

mysql -ugradmin -pgrpass -h$PRIMARY -P3310 << EOL

create user if not exists repl@'%' identified by 'repl';
grant replication slave, backup_admin, clone_admin on *.* to repl@'%';
grant select on performance_schema.* to repl@'%';

EOL
