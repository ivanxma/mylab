. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL
use szosm;

-- set @localpt=point(22.538741, 113.955730);
set @localpt=point(113.955686, 22.539375);

select id, 
	st_distance_sphere(@localpt, geom)   as mydistance,
	tags, st_astext(geom) 
from nodes 
where 
-- 	st_distance_sphere(@localpt, geom) < 2 AND
 match(tags) against ("+station" IN BOOLEAN MODE) 
order by mydistance 
limit 10;

EOL
