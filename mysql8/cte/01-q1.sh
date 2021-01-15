
. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 << EOL

WITH cte1(txt) AS (SELECT "This "),
     cte2(txt) AS (SELECT CONCAT(cte1.txt,"is a ") FROM cte1),
     cte3(txt) AS (SELECT "nice query" UNION
                   SELECT "query that rocks" UNION
                   SELECT "query"),
     cte4(txt) AS (SELECT concat(cte2.txt, cte3.txt) FROM cte2, cte3)
SELECT MAX(txt), MIN(txt) FROM cte4;


WITH cte1(txt) AS (SELECT "This "),
     cte2(txt) AS (SELECT CONCAT(cte1.txt,"is a ") FROM cte1),
     cte3(txt) AS (SELECT "nice query" UNION
                   SELECT "query that rocks" UNION
                   SELECT "query"),
     cte4(txt) AS (SELECT concat(cte2.txt, cte3.txt) FROM cte2, cte3)
SELECT txt FROM cte4;

EOL
