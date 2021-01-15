./00-createdb.sh
sleep 2
./01-startdb.sh
sleep 2
./02-mysqlupgrade.sh
sleep 2
./03-createRpl.sh
sleep 2
./04-Pmode-restart-with-gcs.sh
sleep 5
./xx-chkgcs.sh 3306

./06-check.sh
