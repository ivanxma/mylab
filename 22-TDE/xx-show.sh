. ./comm.sh
mysql -uroot -h127.0.0.1 --table << EOL

use mydb;

select * from information_schema.INNODB_TABLESPACES WHERE FILE_SIZE <> ALLOCATED_SIZE\G

select name, file_size, 
	allocated_size, 
	((cast(file_size as signed) - cast(allocated_size as SIGNED))*100)/file_size as compressed_pct from information_schema.INNODB_TABLESPACES WHERE FILE_SIZE <> ALLOCATED_SIZE;

select table_schema, table_name, create_options from information_schema.tables
where create_options like '%ENCRYPTION="Y"%';

show variables like '%encrypt%';
show variables like '%keyring%';
EOL

