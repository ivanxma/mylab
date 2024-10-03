./01-initC1RR.sh
./01-initC2RR.sh
sleep 5
./02-startdbC1RR.sh
./02-startdbC2RR.sh
sleep 10
./03-configInstanceC1RR.sh
./03-configInstanceC2RR.sh
./04-checkConfigC1RR.sh
./04-checkConfigC2RR.sh
sleep 10
./05-addC1RR.sh
./05-addC2RR.sh

