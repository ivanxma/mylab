
. ./comm.sh

if [ -r $HOME/mysql-sandboxes/3320/3320.pid ]
then
	Xpid=`sed -n '$ p' $HOME/mysql-sandboxes/3320/3320.pid`
	
	if [ `ps -p $Xpid|grep mysqld|grep -v grep|wc -l` -eq 1 ]
	then
		ps -p $Xpid
		kill -9 $Xpid
		echo "mysqld[$Xpid] is killed"
	fi
fi


