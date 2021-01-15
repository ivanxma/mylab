. ./comm.sh

mysql -t -uroot -h127.0.0.1 << EOL

create database if not exists mytest;

drop table if exists mytest.mytable;

create table if not exists mytest.mytable (i int);

insert into mytest.mytable values (1), (2), (3), (4);

select sum(i) as sum from mytest.mytable;

select i, sum(i) over () as sum from mytest.mytable;

drop table if exists mytest.sales;

CREATE TABLE if not exists mytest.sales(employee VARCHAR(50), mydate DATE, sale INT);
 
INSERT INTO mytest.sales VALUES ('odin', '2017-03-01', 200),
                         ('odin', '2017-04-01', 300),
                         ('odin', '2017-05-01', 400),
                         ('thor', '2017-03-01', 400),
                         ('thor', '2017-04-01', 300),
                         ('thor', '2017-05-01', 500);

SELECT employee, SUM(sale) FROM mytest.sales GROUP BY employee;

SELECT employee, mydate, sale, SUM(sale) OVER (PARTITION BY employee) AS sum FROM mytest.sales;

SELECT employee, MONTHNAME(mydate), sale, SUM(sale) OVER (PARTITION BY MONTH(mydate)) AS sum FROM mytest.sales;

SELECT employee, sale, MONTH(mydate), 
  SUM(sale) OVER (PARTITION by employee ORDER BY MONTH(mydate)) AS cum_sales 
FROM mytest.sales;



EOL
