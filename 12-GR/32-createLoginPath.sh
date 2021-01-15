. ./comm.sh
PGM=`basename $0`

mysql_config_editor set --login-path=gr3306 -uroot -h127.0.0.1 -P3306
mysql_config_editor set --login-path=gr3316 -uroot -h127.0.0.1 -P3316
mysql_config_editor set --login-path=gr3326 -uroot -h127.0.0.1 -P3326

if [ $# -eq 1 ]
then
	ssh secondary "cd `pwd`;./$PGM secondary"
fi
