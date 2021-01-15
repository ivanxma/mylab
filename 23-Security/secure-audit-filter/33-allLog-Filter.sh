
. ./comm.sh

mysql --login-path=testroot --table << EOL

-- create user audituser1@'%';
 -- grant all on *.* to audituser1@'%';

-- SELECT audit_log_filter_set_filter('all_enabled', '{ "filter": { "log": true } }') AS 'Result';
SELECT audit_log_filter_set_filter('all_disabled', '{ "filter": { "log": false } }') AS 'Result';

SELECT audit_log_filter_set_filter('all_enabled', '{ "filter": { "log": true ,
    "class": [
      { "name": "connection" },
      { "name": "general" },
      { "name": "table_access" }
    ]
} }') AS 'Result';


EOL



