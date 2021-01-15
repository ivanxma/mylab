. ./comm.sh
#mysql -uroot -h127.0.0.1 -P3306 -e "create user rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3306 -e "grant replication slave on *.* to rpl_user@'%' identified by 'rpl_pass';"
mysql -uroot -h127.0.0.1 -P3306 -e "grant select on performance_schema.global_variables to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3306 -e "reset master;reset slave;"

#mysql -uroot -h127.0.0.1 -P3316 -e "create user rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3316 -e "grant replication slave on *.* to rpl_user@'%' identified by 'rpl_pass';"
mysql -uroot -h127.0.0.1 -P3316 -e "grant select on performance_schema.global_variables to rpl_user@'%';"
mysql -uroot -h127.0.0.1 -P3316 -e "reset master;reset slave;"
