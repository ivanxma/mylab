read -p "Launch MySQL Workbench and turn on recording mode for demo user. When recording mode is applied, only then press any key to continue."
mysql -udemo -h127.0.0.1 -P3306 -p <<EOL
use sakila;
select * from customer limit 10;
select * from payment limit 5;
EOL
./xx-show.sh
