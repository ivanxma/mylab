
docker rm mysqld1
rm -f my.tar.gz
tar -zcvf my.tar.gz myinit/

docker image rm mysqlserver
docker build --tag mysqlserver .

