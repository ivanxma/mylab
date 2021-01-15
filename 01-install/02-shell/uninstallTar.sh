. ../shell-file.sh

if [ $USER != 'root' ]
then
	echo "Please un-install tar with root"
else
  if [ ! -d $SHELLFOLDER ]
  then
    echo "Not installed in $SHELLFOLDER"
  else
    read -p "Are you sure to Un-install the MySQL Tar installation Y/N? " opt
    if [ $opt == 'Y' ]
    then
      echo "Folder $SHELLFOLDER removed"
      rm -rf $SHELLFOLDER
      if [ -h $SHELLLINK ]
      then
	echo "Link $SHELLLINK removed"
        rm -f $SHELLLINK
      fi
    else
      echo "Aborted"
    fi
  fi
fi

