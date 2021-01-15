. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL
status;

create database if not exists mytest;

drop table if exists mytest.mytable;

create table mytest.mytable (
	f1 int not null primary key,
	fgbk varchar(20) character set gbk,
	fgb2312 varchar(20) character set gb2312,
	futf8mb4 varchar(20) character set utf8mb4,
	futf8 varchar(20) character set utf8
)
;

insert into mytest.mytable values (
	1,
	'恭喜发财abc',
	'恭喜发财abc',
	'恭喜发财abc',
	'恭喜发财abc'
);
insert into mytest.mytable values (
	2,
	'chinese',
	'chinese',
	'GIẢI PHÁP CÔNG NGHỆ',
	'GIẢI PHÁP CÔNG NGHỆ'
);

show create table mytest.mytable\G


select fgbk, fgb2312, futf8mb4, futf8
from mytest.mytable;

select length(fgbk), length(fgb2312), length(futf8mb4), length(futf8)
from mytest.mytable;
select char_length(fgbk), char_length(fgb2312), char_length(futf8mb4), char_length(futf8)
from mytest.mytable;

select hex(fgbk), hex(fgb2312), hex(futf8mb4), hex(futf8)
from mytest.mytable;


EOL
