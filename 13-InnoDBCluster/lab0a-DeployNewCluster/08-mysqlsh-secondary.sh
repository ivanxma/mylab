. ./comm.sh
mysqlsh  --redirect-primary root:welcome1@127.0.0.1:3320 --js -e "var x=dba.getCluster().status();print(x);"
mysqlsh  --redirect-secondary root:welcome1@127.0.0.1:3310 --sql -e "select @@port;"
mysqlsh  --redirect-secondary root:welcome1@127.0.0.1:3320 --sql -e "select @@port;"
