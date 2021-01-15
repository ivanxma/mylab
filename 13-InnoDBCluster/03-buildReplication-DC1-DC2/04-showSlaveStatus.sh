mysql -uroot -h127.0.0.1 -P3340  << EOF

SHOW SLAVE STATUS FOR CHANNEL 'channel1'\G

EOF
