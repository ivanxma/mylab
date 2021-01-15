. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL

alter instance rotate innodb master key;

EOL
