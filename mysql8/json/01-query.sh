. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

select JSON_PRETTY('123');
SELECT JSON_PRETTY("[1,3,5]");
SELECT JSON_PRETTY('{"a":"10","b":"15","x":"25"}');
SELECT JSON_PRETTY('["a",1,{"key1": "value1"},"5",     "77" , {"key2":["value3","valueX", "valueY"]},"j", "2"   ]') ;

select JSON_ARRAYAGG(concat(user,'@',host)) from mysql.user;
select group_concat(user) from mysql.user;

select JSON_OBJECTAGG(variable_name, variable_value) from performance_schema.global_variables where variable_name like '%version%';

EOL
