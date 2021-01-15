. ./comm.sh
mysql -uroot -h127.0.0.1 -e "create database if not exists szosm;"
./bulkDB.pl sz.osm szosm

mysql -uroot -h127.0.0.1 -e "alter table szosm.nodes add column tags text;"
mysql -uroot -h127.0.0.1 -e "alter table szosm.nodes add fulltext index ft_index(tags) with parser ngram;"
mysql -uroot -h127.0.0.1 -e "use szosm;update nodes set tags=(SELECT group_concat( concat(k, '=', v) SEPARATOR ',') from nodetags where nodetags.id=nodes.id group by nodes.id);"
