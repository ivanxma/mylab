#! /bin/bash

if [ ! -r /myinit/myinit.done ]
then
	echo "First Booting..."
fi
touch /myinit/myinit.done

