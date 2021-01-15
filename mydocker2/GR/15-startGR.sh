
docker exec -it node3 mysql -uroot -pmypass \
  -e "STOP GROUP_REPLICATION; START GROUP_REPLICATION;"
