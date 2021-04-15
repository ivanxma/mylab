. ./comm.sh

mysql -ugradmin -pgrpass -h$SECONDARY -P3340 << EOL

create user if not exists repl@'%' identified by 'repl' REQUIRE SSL ;grant replication slave, BACKUP_ADMIN, CLONE_ADMIN on *.* to repl@'%';

EOL
