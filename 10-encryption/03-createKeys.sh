rm -rf ~/.public.key
rm -rf ~/.private.key
mysql --login-path=root -h127.0.0.1 <<EOF

-- Encryption algorithm; can be 'DSA' or 'DH' instead
SET @algo = 'RSA';
-- Minimum key length in bits; make larger for stronger keys
SET @key_len = 4096;

-- Create private key
SET @priv = CREATE_ASYMMETRIC_PRIV_KEY(@algo, @key_len);
-- Derive corresponding public key from private key, using same algorithm
SET @pub = CREATE_ASYMMETRIC_PUB_KEY(@algo, @priv);

-- select @priv, @pub \G
select length(@priv), length(@pub);
select @pub into OUTFILE '~/.public.key';
select @priv into OUTFILE '~/.private.key';
drop table if exists test.mykey;
create table test.mykey (kid int not null primary key, priv_key varchar(4096), pub_key varchar(4096)) engine=memory;
insert into test.mykey values (1, @priv,@pub);
EOF

ls -l ~/.public.key ~/.private.key
