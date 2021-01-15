rm -rf /tmp/digest.out
rm -rf /tmp/sign.out

mysql --login-path=root <<EOF
-- Digest type; can be 'SHA224', 'SHA256', 'SHA384', or 'SHA512' instead
SET @dig_type = 'SHA512';

SET @priv1 = load_file('/var/lib/mysql/.private_key');
select priv_key into @priv from test.mykey;
set @algo = 'RSA';

set @dig = create_digest(@dig_type, repeat('aaa',4096));
set @sig = asymmetric_sign(@algo, @dig, @priv, @dig_type);

select length(@dig), length(@sig);

select hex(@dig) into outfile '/tmp/digest.out';
select hex(@sig) into outfile '/tmp/sign.out';

EOF

echo "************************************"
echo "Press <Enter> to login as separate process and load the digest and signature for verification"
echo "************************************"
read

mysql --login-path=root <<EOF
select pub_key into @pub from test.mykey;
SET @dig_type = 'SHA512';

set @digx= load_file('/tmp/digest.out');
set @sigx = load_file('/tmp/sign.out');
set @dig = unhex(left(@digx,length(@digx)-1));
set @sig = unhex(left(@sigx,length(@sigx)-1));
set @algo = 'RSA';

select asymmetric_verify(@algo, @dig, @sig, @pub, @dig_type);

EOF
