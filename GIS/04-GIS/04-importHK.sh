. ./comm.sh
mysql -uroot -h127.0.0.1 -e "create database if not exists hkosm;"
./bulkDB.pl hk.osm hkosm

mysql -uroot -h127.0.0.1 -e "alter table hkosm.nodes add column tags text, add fulltext index(tags);"
mysql -uroot -h127.0.0.1 -e "use hkosm;update nodes set tags=(SELECT group_concat( concat(k, '=', v) SEPARATOR ',') from nodetags where nodetags.id=nodes.id group by nodes.id);"
