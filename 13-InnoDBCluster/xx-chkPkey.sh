. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 -pmysql -e "
SELECT t.table_schema, t.table_name 
FROM information_schema.tables t     LEFT JOIN 
  (SELECT table_schema, table_name                
	FROM information_schema.statistics                
	GROUP BY table_schema, table_name, index_name                
	HAVING SUM(CASE                    
	   WHEN non_unique = 0 AND nullable != 'YES'                    
	      THEN 1 ELSE 0 END) = COUNT(*)               
   ) puks     
   ON t.table_schema = puks.table_schema         
   AND t.table_name = puks.table_name WHERE puks.table_name IS NULL     
   AND t.table_type = 'BASE TABLE'     
   AND t.table_schema NOT IN ('mysql', 'sys', 'performance_schema', 'information_schema')
;
"
