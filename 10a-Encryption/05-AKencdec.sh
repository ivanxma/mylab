mysql -t -h127.0.0.1 -uroot -P3306 -pmysql <<EOF
SET @algo = 'RSA'; -- can be 'DSA' or 'DH' instead;
SET @key_len = 1024; -- Minimum key length in bits; make larger for stronger keys;
SET @priv = CREATE_ASYMMETRIC_PRIV_KEY(@algo, @key_len);
SET @pub = CREATE_ASYMMETRIC_PUB_KEY(@algo, @priv);

select @priv;
select @pub;

select pow(2,10);
select pow(2,10-3);
select (length(ASYMMETRIC_ENCRYPT(@algo, 'my dark secret', @pub)));

SET @algo = 'RSA';
SET @key_len = 4096; -- limit is 16,384 bits
SET @priv = CREATE_ASYMMETRIC_PRIV_KEY(@algo, @key_len);
SET @pub = CREATE_ASYMMETRIC_PUB_KEY(@algo, @priv);

select pow(2,12);
select pow(2,12-3);
select (length(ASYMMETRIC_ENCRYPT(@algo, 'my dark secret', @pub)));

use security;
insert into secret (text) values ('The secret sauce is there is no secret sauce!');
select * from secret;
update secret set text = ASYMMETRIC_ENCRYPT(@algo, text, @pub) where id = 1;
select * from secret;
select id, hex(text) from secret;

insert into secret (text) values (ASYMMETRIC_ENCRYPT(@algo, 'The secret sauce is there is no secret sauce!', @pub));
select id, substr(hex(text), 1,40) from secret;

select id, ASYMMETRIC_DECRYPT(@algo, text, @priv) from secret;

EOF
