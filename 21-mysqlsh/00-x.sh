. ./comm.sh

mysqld --initialize-insecure --datadir=/home/mysql/data/lab21
mysqld --defaults-file=config/my.cnf &


mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 << EOL

install plugin mysqlx soname 'mysqlx.so';
show plugins;

EOL
mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 << EOL2

-- show plugins;
CREATE USER IF NOT EXISTS mysqlxsys@localhost IDENTIFIED BY 'password' ACCOUNT LOCK;
GRANT SELECT ON mysql.user TO mysqlxsys@localhost;
GRANT SUPER ON *.* TO mysqlxsys@localhost;

EOL2
