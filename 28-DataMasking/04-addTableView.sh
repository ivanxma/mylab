. ./comm.sh
$MYSQL_HOME/bin/mysql -t -udemo -h127.0.0.1 -pMySQL1sGreat! -P3306 << EOL
use sakila;
create table sakila.payment_cc (
 payment_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
 cc_id CHAR(16) NOT NULL,
 last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY  (payment_id),
 KEY idx_fk_payment_id (payment_id),
 CONSTRAINT fk_payment FOREIGN KEY (payment_id) REFERENCES payment (payment_id) ON DELETE RESTRICT ON UPDATE CASCADE
 );
 
 INSERT INTO sakila.payment_cc select payment_id, cast(gen_range(200000000000,299999999999) as char), last_update
 from payment where amount >10;
 
 CREATE VIEW sakila.vm_payment as select p.payment_id, customer_id, rental_id, amount, mask_pan(pcc.cc_id) as masked_cc, p.last_update from payment p, payment_cc pcc where p.payment_id = pcc.payment_id;

EOL
