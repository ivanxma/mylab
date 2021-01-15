. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL


create database if not exists mytest;

CREATE TABLE if not exists mytest.jtable (jcol JSON);

truncate table mytest.jtable;



INSERT INTO mytest.jtable VALUES
    ('{"a": 10, "b": "wxyz", "c": "[true, false]"}');

SELECT jcol, 
    JSON_STORAGE_SIZE(jcol) AS Size, 
    JSON_STORAGE_FREE(jcol) AS Free 
    FROM mytest.jtable;

select jcol->"$.a",jcol->>"$.a", jcol->"$.b", jcol->>"$.b" from mytest.jtable;


EOL
