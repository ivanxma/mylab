. ./comm.sh

MYDIR=`pwd`
PGM=`basename $0`

mysqlsh --js -i << EOL1
dba.configureLocalInstance('root:welcome1@localhost:3310', {clusterAdmin:"gr_user@'%'",clusterAdminPassword:"gr_pass"});
dba.configureLocalInstance('root:welcome1@localhost:3320', {clusterAdmin:"gr_user@'%'",clusterAdminPassword:"gr_pass"});
dba.configureLocalInstance('root:welcome1@localhost:3330', {clusterAdmin:"gr_user@'%'",clusterAdminPassword:"gr_pass"});
EOL1

# add extra privileges
mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 -e " grant SELECT on sys.* to gr_user@'%' with grant option;reset master;reset slave;"
mysql -uroot -h127.0.0.1 -P3320 -pwelcome1 -e " grant SELECT on sys.* to gr_user@'%' with grant option;reset master;reset slave;"
mysql -uroot -h127.0.0.1 -P3330 -pwelcome1 -e " grant SELECT on sys.* to gr_user@'%' with grant option;reset master;reset slave;"


for i in `ls -1 $HOME/data/sandbox/*/*.cnf`
do
	cat myGR.cnf >> $i
done
