. ./comm.sh

pkill -9 mysqld

if [ "$HOST1" == "$HOSTNAME" ]
then
  SERVERID=101
fi
if [ "$HOST2" == "$HOSTNAME" ]
then
  SERVERID=201
fi
if [ "$HOST3" == "$HOSTNAME" ]
then
  SERVERID=301
fi

mysqld_safe --defaults-file=config/my1.cnf --server_id=$SERVERID &

	
