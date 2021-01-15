. ./comm.sh
mysql -t -uroot -h127.0.0.1 -P3306 -pmysql << EOL

use mytest;

select day(txndate), count(*) from mytrans group by day(txndate);


-- alter table mytest.mytrans drop foreign key mytrans_ibfk_1;
alter table mytest.mytrans  partition by range (day(txndate)) ( 
partition p1 values less than (1), 
partition p2 values less than (2), 
partition p3 values less than (3), 
partition p4 values less than (4), 
partition p5 values less than (5), 
partition p6 values less than (6), 
partition p7 values less than (7), 
partition p8 values less than (8), 
partition p9 values less than (9), 
partition p10 values less than (10),
partition pmax values less than (MAXVALUE)
);

commit;
select sleep(5);

use information_schema;
select partition_name, subpartition_name, partition_ordinal_position, partition_expression, table_rows, nodegroup, tablespace_name, partition_comment from partitions where table_name = 'mytrans';

EOL

ls -l ~/data/lab02/mytest

