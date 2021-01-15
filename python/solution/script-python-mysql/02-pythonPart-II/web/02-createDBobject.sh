. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 << EOL

create database if not exists pycon2016tw;
-- use pycon2016tw;

drop table if exists pycon2016tw.my_user;
CREATE TABLE if not exists pycon2016tw.my_user (
  user_id integer NOT NULL AUTO_INCREMENT,
  user_username VARCHAR(30) NULL,
  user_password VARCHAR(30) NULL,
  PRIMARY KEY (user_id)
);


drop procedure if exists pycon2016tw.sp_user;
DELIMITER $$
CREATE PROCEDURE pycon2016tw.sp_user(
    IN p_username VARCHAR(30),
    IN p_password VARCHAR(30)
)
BEGIN
    if ( select exists (select 1 from my_user where user_username = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into my_user
        (
            user_username,
            user_password
        )
        values
        (
            p_username,
            p_password
        );
     
    END IF;
END$$
DELIMITER ;

drop procedure if exists pycon2016tw.sp_logon;
DELIMITER $$
CREATE PROCEDURE pycon2016tw.sp_logon(
    IN p_username VARCHAR(30),
    IN p_password VARCHAR(30)
)
BEGIN
    if ( select not exists (select 1 from my_user where user_username = p_username) ) THEN
     
        select 'Username Not Exists !!';
    ELSE
    if ( select not exists (select 1 from my_user where user_username = p_username and user_password = p_password )) THEN
     
        select 'Incorrect Password !!';
    END IF;
    END IF;
END$$
DELIMITER ;

EOL
