docker logs node1
echo "Hit <ENTER> to continue"
read
docker exec -it node1 mysql -uroot -pmypass \
  -e "SELECT * FROM performance_schema.replication_group_members;" 
