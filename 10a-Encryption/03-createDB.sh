mysql -h127.0.0.1 -uroot -P3306 -pmysql <<EOF
create database security;
use security;
create table secret (id int unsigned auto_increment primary key, text blob);
desc secret;
EOF
