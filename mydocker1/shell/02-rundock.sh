
docker rm mys1
docker run  --net groupnet --ip 172.18.0.188 -v /sbin:/sbin:ro -v /bin:/bin:ro -v /lib64:/lib64:ro -v /usr/bin:/usr/bin:ro -v /opt/mysql-commercial-8.0.17-el7-x86_64:/usr/local/mysql:ro -v /opt/mysql-shell-commercial-8.0.17-linux-glibc2.12-x86-64bit:/usr/local/shell:ro  --name mys1   myshell  

