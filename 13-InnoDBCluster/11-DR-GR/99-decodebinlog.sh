MYDATADIR=~/data/$1/
BINLOGFILE=`ls -1ht $MYDATADIR/logbin*|sed -n '1p'`
mysqlbinlog --base64-output=decode-rows $BINLOGFILE
