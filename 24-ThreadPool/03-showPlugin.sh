. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

show plugins;

select * from information_schema.plugins where plugin_name = 'thread_pool'\G
EOL
