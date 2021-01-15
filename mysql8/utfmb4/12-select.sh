. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

select length(_utf8 'abc');

select length(_utf8mb4 'abc');
select length(_utf8mb4 '恭喜发财');
select length(_gbk '恭喜发财');
EOL
