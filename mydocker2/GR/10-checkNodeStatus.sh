docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"

for N in 1 2 3
do 
  if [ "$1" == "" -o "$1" == "$N" ]
  then
  	docker exec -it node$N mysql -uroot -pmypass \
  	-e "SELECT @@hostname, s.member_host, s.member_port, s.member_state, s.member_role, s.member_version FROM performance_schema.replication_group_members s;"
  fi
done
