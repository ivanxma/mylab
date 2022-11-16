mv config/myrouter/mysqlrouter.conf config/myrouter/mysqlrouter.conf.bak
cat config/myrouter/mysqlrouter.conf.bak|sed 's/PREFERRED/PASSTHROUGH/g' > config/myrouter/mysqlrouter.conf

