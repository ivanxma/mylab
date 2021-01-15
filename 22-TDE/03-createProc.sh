. ./comm.sh

$MYSQL_HOME/bin/mysql -uroot  -h127.0.0.1 -P3306 << EOL

use mydb;
drop procedure if exists insertmytable;

delimiter //

create procedure insertmytable (
	IN mycount int
)
BEGIN
	DECLARE x  INT;
	DECLARE y  INT;
        DECLARE str  VARCHAR(255);
        SET x = 1;

	select ifnull(max(f1),0) into y from mydb.mytable;
        WHILE x  <= mycount DO
		insert into mydb.mytable (f1, f2,f3) values (x + y, repeat('x',20), repeat('y',20));

                SET  x = x + 1; 
        END WHILE;

END //

create procedure insertmytable_enc (
	IN mycount int
)
BEGIN
	DECLARE x  INT;
	DECLARE y  INT;
        DECLARE str  VARCHAR(255);
        SET x = 1;

	select ifnull(max(f1),0) into y from mydb.mytable;
        WHILE x  <= mycount DO
		insert into mydb.mytable_enc (f1, f2,f3) values (x + y, repeat('x',20), repeat('y',20));

                SET  x = x + 1; 
        END WHILE;

END //
EOL
