. ./comm.sh

mysqlsh --js << EOF

c1=mysql.getSession('gradmin:grpass@$CLUSTER_HOST:3310')
q1=c1.runSql('select @@gtid_executed;')
r1=q1.fetchAll()
println("GTID on Master : " + r1[0][0])

c2=mysql.getSession('gradmin:grpass@$SECONDARY_HOST:3340')
q2a=c2.runSql('select @@gtid_executed, @@gtid_purged;')
r2a=q2a.fetchAll()
println("GTID executed on Slave : " + r2a[0][0])
println("GTID purged on Slave : " + r2a[0][1])
q2b=c2.runSql('stop group_replication;')
q2b=c2.runSql('set global gtid_purged="' + r1[0][0]+'"')

c2=mysql.getSession('gradmin:grpass@$SECONDARY_HOST:3350')
q2a=c2.runSql('select @@gtid_executed, @@gtid_purged;')
r2a=q2a.fetchAll()
println("GTID executed on Slave : " + r2a[0][0])
println("GTID purged on Slave : " + r2a[0][1])
q2b=c2.runSql('stop group_replication;')
q2b=c2.runSql('set global gtid_purged="' + r1[0][0]+'"')

c2=mysql.getSession('gradmin:grpass@$SECONDARY_HOST:3360')
q2a=c2.runSql('select @@gtid_executed, @@gtid_purged;')
r2a=q2a.fetchAll()
println("GTID executed on Slave : " + r2a[0][0])
println("GTID purged on Slave : " + r2a[0][1])
q2b=c2.runSql('stop group_replication;')
q2b=c2.runSql('set global gtid_purged="' + r1[0][0]+'"')


EOF
