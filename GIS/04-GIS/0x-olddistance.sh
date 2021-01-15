. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL
use hkosm;

set @long=114.17220;
set @lat=22.33684;

select id, slc( @lat, @long, y(geom), x(geom))*1000 as distance_in_meters, 
	tags, astext(geom) 
from nodes 
where MBRContains(envelope(linestring(
	point((@long+(20/111)), (@lat+(20/111))), 
	point((@long-(20/111)), (@lat-(20/111))))), geom) 
AND match(tags) against ("+school" IN BOOLEAN MODE) 
order by distance_in_meters limit 10;


EOL

