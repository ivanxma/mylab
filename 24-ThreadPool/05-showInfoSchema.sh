. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

use information_schema;
show tables like 'TP%';

select * from TP_THREAD_GROUP_STATE\G
EOL
