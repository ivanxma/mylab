. ./comm.sh
#
# drop the hello database first
#
. ./02-dropHello.sh

#
# Search the last dump folder
#
DUMPFOLDER=`ls -1t /home/mysql/shelldump/|sed -n '1 p'`

#
# remove the load progress status file - so that always reload possible.
#
rm -f /home/mysql/shelldump/${DUMPFOLDER}/load-progress*.json


#
# loadDump the file 
#
mysqlsh --uri root:mysql@127.0.0.1 << EOF

util.loadDump('/home/mysql/shelldump/${DUMPFOLDER}', {threads:4})

EOF
