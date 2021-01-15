. ./comm.sh
mysql -t -uroot -h127.0.0.1 << EOL

grant all on *.* to myuser@'%' identified by 'myuser';

EOL
