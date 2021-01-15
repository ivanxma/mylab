. ./comm.sh
mysql --login-path=testroot  << EOL1
SELECT audit_log_filter_set_user('appuser1@%', 'abort_dml_on_bank_account') AS 'Result';
EOL1


mysql -uappuser1 -h127.0.0.1 << EOL


drop database if exists finance;

create database if not exists finance;

use finance;
drop table if exists  bank_account;
create table  bank_account (val int not null primary key);
EOL


mysql -uappuser1 -h127.0.0.1 -e " select count(*) from finance.bank_account;"
mysql -uappuser1 -h127.0.0.1 -e " select 'Trying to insert finance.bank_account is blocked...' as msg;"

mysql -uappuser1 -h127.0.0.1 << EOL
insert into finance.bank_account values (1);
insert into finance.bank_account values (2);
EOL


