. ./comm.sh

mysql -ugradmin -pgrpass -h$PRIMARY -P3310 -e "stop replica for channel 'channel1';"
