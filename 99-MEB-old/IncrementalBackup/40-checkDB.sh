. ./comm.sh

echo "This is the Incremental DB restore "
echo "the world_x DB should have restored"
mysql -uroot -h127.0.0.1 -P3316 -pmysql -e "show databases;"

