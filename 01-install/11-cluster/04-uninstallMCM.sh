MCMFOLDER=/home/mysql/mcm/mcm1.4.8
MCMLINK=/home/mysql/mcm/mcm-latest
MCMTAR=/opt/download/mysql/mcm/mcm-1.4.8-linux-glibc2.12-x86-64bit.tar.gz

if [ $USER != 'root' ]
then
	echo "Please un-install tar with root"
else
  if [ ! -d $MCMFOLDER ]
  then
    echo "Not installed in $MCMFOLDER"
  else
    read -p "Are you sure to Un-install the MCM Tar installation Y/N? " opt
    if [ $opt == 'Y' ]
    then
      echo "Folder $MCMFOLDER removed"
      rm -rf $MCMFOLDER
      if [ -h $MCMLINK ]
      then
	echo "Link $MCMLINK removed"
        rm -f $MCMLINK
      fi
    else
      echo "Aborted"
    fi
  fi
fi

