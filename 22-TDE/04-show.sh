. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL

use mydb;
call insertmytable(1000);
call insertmytable_enc(1000);
EOL

./xx-show.sh

