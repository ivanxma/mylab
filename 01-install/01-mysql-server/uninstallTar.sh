. ../server-file.sh

if [ $USER != 'root' ]
then
	echo "Please un-install tar with root"
else
  if [ ! -d $TARFOLDER ]
  then
    echo "Not installed in $TARFOLDER"
  else
    read -p "Are you sure to Un-install the MySQL Tar installation Y/N? " opt
    if [ $opt == 'Y' ]
    then
      echo "Folder $TARFOLDER removed"
	# intention to specify the full name in rm -rf to avoid empty folder name or any "/" folder.   
      rm -rf /opt/mysql-commercial-8.0.21-el7-x86_64
      if [ -h /usr/local/mysql ]
      then
	echo "Link /usr/local/mysql removed"
        rm -f /usr/local/mysql
      fi
    else
      echo "Aborted"
    fi
  fi
fi

