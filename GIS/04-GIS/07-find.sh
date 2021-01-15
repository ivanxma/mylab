. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL
use hkosm;

set @cityu=point(114.171930,22.337631);

select id, 
	st_distance(@cityu, geom) *111   as mydistance,
	tags, astext(geom) 
from nodes 
where 
	st_distance(@cityu, geom) *111 < 1
AND match(tags) against ("+school" IN BOOLEAN MODE) 
order by mydistance ;

EOL
