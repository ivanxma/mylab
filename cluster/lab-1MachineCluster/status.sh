. ./comm.sh
tabs 10
mcm  -e "show status -r mycluster1;"
mcm  -e "show status -b mycluster1;"

if [ `mcm  -e "show status -r mycluster1;"|grep mysqld|grep running|wc -l` -gt 0 ] 
then 
	mysql -uroot -h127.0.0.1 -P3316 -e "select * from ndbinfo.memoryusage;"
	ndb_desc -c $PRIMARY:1186 -d test -p mytable
	ndb_desc  -c $PRIMARY:1186 -d test -p mytable2
fi

