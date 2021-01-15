. ./comm.sh
mysql --login-path=testroot  << EOL1
SELECT audit_log_filter_set_user('audituser1@%', 'all_enabled') AS 'Result';
EOL1


mysql -uaudituser1 -h127.0.0.1 << EOL


drop database if exists auditdb1;

create database auditdb1;

use auditdb1;
create table audittable1 (val int not null primary key);
insert into audittable1 values (1);

select count(*) from audittable1;
select count(*) from mysql.user;
use mysql;
select count(*) from user;

EOL

tail -100 /home/mysql/data/lab23/audit.log
