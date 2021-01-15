. ./comm.sh
mysql -uroot --table -h127.0.0.1 << EOL

show plugins;
show variables like '%keyring%';

EOL
