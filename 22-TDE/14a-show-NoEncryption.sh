. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL

use mydb;

select @a := sysdate(6);
call insertmytable(100000);
select @b  := sysdate(6);
select timediff(@b,@a) NoEncrypt1000;
#select * from information_schema.INNODB_SYS_TABLESPACES WHERE compression <> 'NONE'\G
#select name, ((file_size-allocated_size)*100)/file_size as compressed_pct from information_schema.INNODB_SYS_TABLESPACES WHERE compression <> 'NONE';
EOL

