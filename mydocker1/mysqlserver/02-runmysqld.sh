
rm -rf /home/mysyql/data/docker/3306
rm -rf /tmp/11
mkdir /tmp/11

docker rm mysqld1
docker run -d --net groupnet --ip 172.18.0.11 --user 1000  -v /tmp/11:/tmp -v /home/mysql/data/docker:/data -v /sbin:/sbin:ro -v /bin:/bin:ro -v /lib64:/lib64:ro -v /usr/bin:/usr/bin:ro -v /opt/mysql-commercial-8.0.17-el7-x86_64:/usr/local/mysql:ro -v /opt/mysql-shell-commercial-8.0.17-linux-glibc2.12-x86-64bit:/usr/local/shell:ro  --name mysqld1   -it mysqlserver  

