
docker network rm  groupnet
mkdir -p /home/mysql/data/docker/d1
mkdir -p /home/mysql/data/docker/d2
mkdir -p /home/mysql/data/docker/d3
docker network create --subnet=172.18.0.0/16 groupnet
docker network ls
