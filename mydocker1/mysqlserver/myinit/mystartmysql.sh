#! /bin/bash


./myinit.sh
echo "initialize database"

/usr/local/mysql/bin/mysqld --defaults-file=/myinit/config/my1.cnf --initialize-insecure



/usr/local/mysql/bin/mysqld_safe --defaults-file=/myinit/config/my1.cnf  

