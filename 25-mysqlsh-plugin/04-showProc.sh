. ./comm.sh
mysqlsh --uri root@localhost:33100 -i -e "\show proc"
mysqlsh --uri root@localhost:33100 -i -e "\show sessions"

