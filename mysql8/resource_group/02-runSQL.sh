. ./comm.sh


time mysql -t -uroot -h127.0.0.1 << EOL

SELECT * FROM INFORMATION_SCHEMA.RESOURCE_GROUPS;

-- set resource group rg1;
select benchmark(100000000, concat('hello', 'world') ) from mysql.user;

EOL

time mysql -t -uroot -h127.0.0.1 << EOL2

select /*+ RESOURCE_GROUP(rg1) */ benchmark(100000000, concat('hello', 'world') ) from mysql.user;

EOL2
