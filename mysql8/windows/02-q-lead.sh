. ./comm.sh
# this is to detect the gap between different rows
# 1,2,4,5,6,8,9,10
# The gap is 2&4 and 6&8


mysql -t -uroot -h127.0.0.1 << EOL

create table if not exists mytest.t (i int);
truncate table mytest.t;
insert into mytest.t values (1), (2), (4), (5),(6), (8),(9), (10);

select i, l from
	(select i, lead(i) over (order by i) as l from mytest.t) d
where i + 1 <> l;



EOL
