NDBFOLDER=/opt/mysql-cluster-commercial-8.0.25-el7-x86_64
NDBLINK=/home/mysql/mcm/cluster-latest
NDBTAR=/opt/download/mysql/ndb/mysql-cluster-commercial-8.0.25-el7-x86_64.tar.gz

if [ $USER != 'root' ]
then
	echo "Please un-install tar with root"
else
  if [ ! -d $NDBFOLDER ]
  then
    echo "Not installed in $NDBFOLDER"
  else
    read -p "Are you sure to Un-install the NDB Tar installation Y/N? " opt
    if [ $opt == 'Y' ]
    then
      echo "Folder $NDBFOLDER removed"
      rm -rf $NDBFOLDER
      if [ -h $NDBLINK ]
      then
	echo "Link $NDBLINK removed"
        rm -f $NDBLINK
      fi
    else
      echo "Aborted"
    fi
  fi
fi

