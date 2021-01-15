. ./comm.sh
mysql --login-path=testroot  << EOL1
SELECT audit_log_filter_set_user('appuser1@%', 'appuser_enable_logging') AS 'Result';
SELECT audit_log_filter_set_user('appuser1@localhost', 'appuser_enable_logging') AS 'Result';
SELECT audit_log_filter_set_user('root@%', 'root_enable_logging') AS 'Result';
SELECT audit_log_filter_set_user('root@localhost', 'root_enable_logging') AS 'Result';
EOL1


mysql -uappuser1 -h127.0.0.1 << EOL


drop database if exists auditdb1;

create database if not exists appdb;

use appdb;
drop table if exists  audittable1;
create table  audittable1 (val int not null primary key);
insert into audittable1 values (1);

select count(*) from audittable1;
use mysql;

select count(*) from mysql.user;

EOL

tail -100 /home/mysql/data/lab23/audit.log
