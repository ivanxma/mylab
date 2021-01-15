. ./comm.sh

mysql -uroot -h127.0.0.1 -P3306 << EOL

DROP FUNCTION keyring_key_generate;
DROP FUNCTION keyring_key_fetch;
DROP FUNCTION keyring_key_length_fetch;
DROP FUNCTION keyring_key_type_fetch;
DROP FUNCTION keyring_key_store;
DROP FUNCTION keyring_key_remove;
UNINSTALL PLUGIN keyring_udf;

EOL
