. ./comm.sh

mysql --login-path=testroot --table << EOL

use mysql;
truncate table audit_log_filter;
truncate table audit_log_user;
select audit_log_filter_flush() as 'Result';

EOL

