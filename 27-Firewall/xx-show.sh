. ./comm.sh
mysql -uroot -h127.0.0.1 --table << EOL

use sakila;
\! echo "List of users in MySQL Enterprise Firewall list";
select userhost, mode from information_schema.mysql_firewall_users WHERE USERHOST='demo@localhost';
\! echo "Allow list per user in MySQL Enteprise Firewall list"; 
SELECT USERHOST, RULE FROM INFORMATION_SCHEMA.MYSQL_FIREWALL_WHITELIST
       WHERE USERHOST = 'demo@localhost';
\! echo "Firewall status"; 
show variables like '%mysql_firewall%';
\! echo "Firewall statistics"; 
show global status like 'Firewall%';
EOL

