. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL

create database if not exists test;

CREATE TABLE if not exists test.sales ( 
     name VARCHAR(20),  
     price_eur DOUBLE,
     amount INT,
     total_eur DOUBLE generated always AS (price_eur * amount),
     total_usd DOUBLE generated always AS (total_eur * xrate),
     xrate DOUBLE);


CREATE TABLE if not exists test.xmltable (
  username VARCHAR (20) AS (ExtractValue(doc,'/user/username')),
  doc TEXT);

INSERT INTO test.xmltable (doc) VALUES
  ('<user>
    <id>1</id>
    <username>tony</username>
    <name>Tony Stark</name>
    <info>A cool one</info>
  </user>'),
  ('<user>
    <id>2</id>
    <username>ned</username>
    <name>Eddard Stark</name>
    <info>A cold one</info>
  </user>'),
  ('<user>
    <id>3</id>
    <username>berty</username>
    <name>Albert Stark</name>
    <info>A farmer</info>
  </user>');

SELECT ExtractValue(doc,'/user/id')
FROM test.xmltable
WHERE 
  ExtractValue(doc,'/user/username') = 'tony' OR
  ExtractValue(doc,'/user/username') = 'ned' OR
  ExtractValue(doc,'/user/username') = 'berty';

SELECT ExtractValue(doc,'/user/id')
FROM xmltable
WHERE username = 'tony' OR username = 'ned' OR username = 'berty';

EOL
