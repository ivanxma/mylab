. ./comm.sh

echo "Distance between TKO MTR Station from CityU"

mysql -uroot -h127.0.0.1 << EOL


set @tko = point(114.259885, 22.307485);
set @cityu = point(114.171810, 22.337533);
select distance(@tko, @cityu) * 110;
select st_distance(@tko, @cityu) * 110;
select st_distance_sphere(@tko, @cityu) ;


EOL
