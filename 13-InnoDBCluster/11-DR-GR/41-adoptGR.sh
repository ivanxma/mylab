. ./comm.sh

mysql -uroot -h127.0.0.1 -P3340 -e "
delete from mysql.slave_master_info where channel_name = 'channel1';
"

mysqlsh --js --uri gradmin:grpass@$SECONDARY:3340 << EOL


dba.createCluster('myclusterDR', {adoptFromGR:true, force:true})

EOL
