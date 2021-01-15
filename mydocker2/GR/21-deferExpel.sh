for N in 1 2 3
do docker exec -it node$N mysql -uroot -pmypass \
  -e "SET GLOBAL group_replication_member_expel_timeout=300;" \
  -e "SHOW VARIABLES WHERE Variable_name = 'hostname' " \
  -e "OR Variable_name='group_replication_member_expel_timeout';";
done
