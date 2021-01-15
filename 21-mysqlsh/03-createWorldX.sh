. ./comm.sh

mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 < /opt/download/world_x-db/world_x.sql
mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 -e "use world_x;show tables;"
mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 -e "use world_x;select 'city', count(*) from city;"
mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 -e "use world_x;select 'country', count(*) from country;"
mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 -e "use world_x;select 'countryinfo', count(*) from countryinfo;"
mysql -uroot -h127.0.0.1 -P3310 -pwelcome1 -e "use world_x;select 'countrylanguage', count(*) from countrylanguage;"

