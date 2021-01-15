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

UPDATE mytest.jtable 
    SET jcol = JSON_SET(jcol, "$.a", 10, "$.b", "wxyz", "$.c", 1);

SELECT jcol, 
    JSON_STORAGE_SIZE(jcol) AS Size, 
    JSON_STORAGE_FREE(jcol) AS Free 
    FROM mytest.jtable;

UPDATE mytest.jtable 
    SET jcol = JSON_SET(jcol, "$.a", 10, "$.b", "wx", "$.c", 1);

SELECT jcol, 
    JSON_STORAGE_SIZE(jcol) AS Size, 
    JSON_STORAGE_FREE(jcol) AS Free 
    FROM mytest.jtable;

UPDATE mytest.jtable 
    SET jcol = JSON_SET(jcol, "$.a", 10, "$.b", "wx", "$.c", 123, "$.mytext", "hello world, more text expanding size");
SELECT jcol, 
    JSON_STORAGE_SIZE(jcol) AS Size, 
    JSON_STORAGE_FREE(jcol) AS Free 
    FROM mytest.jtable;

UPDATE mytest.jtable SET jcol = '{"a": 10, "b": 1}';
SELECT jcol, 
    JSON_STORAGE_SIZE(jcol) AS Size, 
    JSON_STORAGE_FREE(jcol) AS Free 
    FROM mytest.jtable;

EOL
