. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL

use mydb;

select @b  := sysdate(6);
call insertmytable_enc(100000);
select @c  := sysdate(6);
select timediff(@c, @b) Encrypted1000;
#select * from information_schema.INNODB_SYS_TABLESPACES WHERE compression <> 'NONE'\G
#select name, ((file_size-allocated_size)*100)/file_size as compressed_pct from information_schema.INNODB_SYS_TABLESPACES WHERE compression <> 'NONE';
EOL

