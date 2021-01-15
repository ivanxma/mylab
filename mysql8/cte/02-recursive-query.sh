. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 << EOL
WITH RECURSIVE my_cte AS
(
  SELECT 1 AS n
  UNION ALL
  SELECT 1+n FROM my_cte WHERE n<10
)
SELECT * FROM my_cte;

EOL
