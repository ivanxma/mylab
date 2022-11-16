. ./comm.sh

if [ $? -eq 0 ]
then
	echo "starting router...."
	./config/myrouter/start.sh
fi
