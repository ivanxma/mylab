. ./comm.sh
mysql -uroot -h127.0.0.1 -pmysql << EOL

select concat('checksum tables ' , table_name, ';') from information_schema.tables where table_schema = 'test';
checksum tables test.mytable;
EOL
