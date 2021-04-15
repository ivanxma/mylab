. ./comm.sh

mysql -ugradmin -pgrpass -h$SECONDARY -P3340 -e "stop replica for channel 'channel1';"
