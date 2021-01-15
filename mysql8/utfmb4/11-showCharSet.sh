. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

show character set;

show character set like 'gb%';

show collation where charset = 'utfmb4';
show collation where charset like 'gb%';

status;

set names latin1;

status;

set names utf8mb4;

show variables like 'char%';
show variables like 'collation%';
EOL
