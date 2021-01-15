
SELECT table_schema,table_name AS "Table", ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)" FROM information_schema.TABLES where ROUND(((data_length + index_length) / 1024 / 1024), 2)  > 0  ORDER BY (data_length + index_length) DESC;
