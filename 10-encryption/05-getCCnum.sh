mysql --login-path=root -h127.0.0.1 <<EOF

select priv_key into @priv from test.mykey where kid=1;
select custid, firstname, lastname, telno, asymmetric_decrypt('RSA', unhex(ccnum), @priv) from test.customer;

EOF
