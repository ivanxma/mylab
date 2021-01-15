. ./comm.sh


mysql -uroot -h127.0.0.1 -P3306 -e "

select m.* from performance_schema.replication_group_members m left join performance_schema.global_status s on (s.variable_value = m.member_id) ;

 select s.*,m.member_host,m.member_port from performance_schema.global_status s left join performance_schema.replication_group_members m on (s.variable_value = m.member_id) where s.variable_name = 'group_replication_primary_member';

"

mysqlsh << EOL

var mysql=require('mysql');

var s1 = mysql.getClassicSession('root@localhost:3306');
var s2 = mysql.getClassicSession('root@localhost:3316');
var s3 = mysql.getClassicSession('root@localhost:3326');

var x1 = s1.runSql('select @@port,@@super_read_only;');
var x2 = s2.runSql('select @@port,@@super_read_only;');
var x3 = s3.runSql('select @@port,@@super_read_only;');
print("servers [Port, SUPER_READ_ONLY] : ", x1.fetchAll(), x2.fetchAll(), x3.fetchAll());

s1.close();
s2.close();
s3.close();

EOL
