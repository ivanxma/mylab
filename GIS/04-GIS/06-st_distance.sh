. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL
use hkosm;

set @cityu = point(114.171810, 22.337533);

set @long=x(@cityu);
set @lat=y(@cityu);

select astext(@cityu);

select id, 
	st_distance(point(@long, @lat), geom) *111   as distance,
	st_distance_sphere(point(@long, @lat), geom) as spheredistance,
	tags, astext(geom) 
from nodes 
where MBRContains(envelope(linestring(
	point((@long+(5/111)), (@lat+(5/111))), 
	point((@long-(5/111)), (@lat-(5/111))))), geom) 
AND match(tags) against ("+restaurant" IN BOOLEAN MODE) 
order by distance asc;

EOL
