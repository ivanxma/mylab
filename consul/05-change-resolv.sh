MYDATE=`date +"%Y%m%d-%H%M%S"`
sudo mv /etc/resolv.conf /etc/resolv.conf.${MYDATE}
sudo cp etc/resolv.conf /etc/resolv.conf
