. ./comm.sh

mysql -uroot -h127.0.0.1 << EOL

grant all on *.* to mydemo@'%' identified by 'mysql';

EOL
