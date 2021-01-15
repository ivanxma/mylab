. ../router-file.sh

if [ $USER != 'root' ]
then
	echo "Please un-install tar with root"
else
  if [ ! -d $ROUTERFOLDER ]
  then
    echo "Not installed in $ROUTERFOLDER"
  else
    read -p "Are you sure to Un-install the MySQL Tar installation Y/N? " opt
    if [ $opt == 'Y' ]
    then
      echo "Folder $ROUTERFOLDER removed"
      rm -rf $ROUTERFOLDER
      if [ -h $ROUTERLINK ]
      then
	echo "Link $ROUTERLINK removed"
        rm -f $ROUTERLINK
      fi
    else
      echo "Aborted"
    fi
  fi
fi

