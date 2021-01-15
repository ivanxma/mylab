. ./comm.sh

echo "This is the FULL DB restore without the incremental changes"
echo "the world_x DB is not htheere"
mysql -uroot -h127.0.0.1 -P3316 -pmysql -e "show databases;"

