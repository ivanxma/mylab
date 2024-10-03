. ./comm.sh
$MYSQL_HOME/bin/mysql -t -uroot -h127.0.0.1 -P3306 << EOL

drop database if exists sakila;
source /home/mysql/mylab/download/sakila-db/sakila-schema.sql;
source /home/mysql/mylab/download/sakila-db/sakila-data.sql;
CREATE USER 'demo'@'localhost' IDENTIFIED BY 'MySQL1sGreat!';
GRANT ALL ON sakila.* TO 'demo'@'localhost';
SHOW GRANTS FOR USER 'demo'@'localhost';
EOL
