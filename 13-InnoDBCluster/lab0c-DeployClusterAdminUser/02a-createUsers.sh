. ./comm.sh

MYDIR=`pwd`
PGM=`basename $0`

mysqlsh -i << EOL1
dba.configureInstance('root:welcome1@localhost:3310', {clusterAdmin:"gr_user@'%'",clusterAdminPassword:"gr_pass"});
dba.configureInstance('root:welcome1@localhost:3320', {clusterAdmin:"gr_user@'%'",clusterAdminPassword:"gr_pass"});
dba.configureInstance('root:welcome1@localhost:3330', {clusterAdmin:"gr_user@'%'",clusterAdminPassword:"gr_pass"});
EOL1

for i in `ls -1 $HOME/data/sandbox/*/*.cnf`
do
	cat myGR.cnf >> $i
done
