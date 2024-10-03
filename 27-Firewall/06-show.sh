mysql -udemo -h127.0.0.1 -P3306 -p <<EOL
use sakila;
select * from customer limit 10;
select * from payment limit 5;
EOL
