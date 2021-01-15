if [ $# -eq 1 ]
then
	MYNODE=$1
	MYRUN=0
else
	MYNODE=0
	MYRUN=1
fi

for N in 1 2 3
do

  if [ $MYNODE -eq $N -o $MYRUN -eq 1 ]
  then
    docker run -d --name=node$N --net=groupnet --hostname=node$N \
    -v /home/mysql/data/docker/d$N:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mypass \
    mysql/mysql-server:8.0 \
    --server-id=$N \
    --log-bin='mysql-bin-1.log' \
    --enforce-gtid-consistency='ON' \
    --log-slave-updates='ON' \
    --gtid-mode='ON' \
    --transaction-write-set-extraction='XXHASH64' \
    --binlog-checksum='NONE' \
    --master-info-repository='TABLE' \
    --relay-log-info-repository='TABLE' \
    --plugin-load='group_replication.so' \
    --relay-log-recovery='ON' \
    --group-replication-start-on-boot='OFF' \
    --group-replication-group-name='aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee' \
    --group-replication-local-address="node$N:33061" \
    --group-replication-group-seeds='node1:33061,node2:33061,node3:33061' \
    --loose-group-replication-single-primary-mode='ON' \
    --loose-group-replication-enforce-update-everywhere-checks='OFF'
  fi
done

HEALTHY=`docker ps |grep node1|grep healthy|wc -l`
while [ $HEALTHY -eq 0 ]
do
	sleep 1
	HEALTHY=`docker ps |grep node1|grep healthy|wc -l`
	docker ps|grep node1
done


docker logs node1

docker network inspect groupnet
