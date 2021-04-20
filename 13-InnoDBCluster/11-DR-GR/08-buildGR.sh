. ./comm.sh


mysqlsh  << EOF


c1=mysql.getSession('gradmin:grpass@$SECONDARY:3340')
c2=mysql.getSession('gradmin:grpass@$SECONDARY:3350')
c3=mysql.getSession('gradmin:grpass@$SECONDARY:3360')
q1=c1.runSql('select uuid()')
r1=q1.fetchAll()
println("New UUID for group_replication_group_name: " + r1[0][0])

q1a=c1.runSql('set persist group_replication_group_name="' + r1[0][0] + '"')
q1b=c1.runSql('set persist group_replication_group_seeds="$SECONDARY:13350,$SECONDARY:13360"')
q1c=c1.runSql('set persist group_replication_local_address="$SECONDARY:13340"')
q1d=c1.runSql('set persist group_replication_start_on_boot=on')

q2a=c2.runSql('set persist group_replication_group_name="' + r1[0][0] + '"')
q2b=c2.runSql('set persist group_replication_group_seeds="$SECONDARY:13340,$SECONDARY:13360"')
q2c=c2.runSql('set persist group_replication_local_address="$SECONDARY:13350"')
q2d=c2.runSql('set persist group_replication_start_on_boot=on')

q3a=c3.runSql('set persist group_replication_group_name="' + r1[0][0] + '"')
q3b=c3.runSql('set persist group_replication_group_seeds="$SECONDARY:13340,$SECONDARY:13350"')
q3c=c3.runSql('set persist group_replication_local_address="$SECONDARY:13360"')
q3d=c3.runSql('set persist group_replication_start_on_boot=on')

c1.close()
c2.close()
c3.close()



EOF




