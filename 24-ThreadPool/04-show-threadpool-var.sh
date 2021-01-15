. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

show variables like 'thread%';
EOL
