. ./comm.sh
mysql -uroot -h127.0.0.1 << EOL
set @cityu=point(114.171930,22.337631);
select ST_GeoHash(x(@cityu), y(@cityu), 10);

SELECT ST_LatFromGeoHash('wecpn43qnu');
SELECT ST_LongFromGeoHash('wecpn43qnu');
SELECT AsText(PolygonFromText('POLYGON((10 10,20 10,20 20,10 20))'));

SELECT ST_GeoHash(180,0,10), ST_GeoHash(-180,-90,15);

SELECT ST_LatFromGeoHash(ST_GeoHash(45,-20,10));

SELECT ST_LongFromGeoHash(ST_GeoHash(45,-20,10));

SET @gh = ST_GeoHash(45,-20,10);

SELECT AsText(ST_PointFromGeoHash(@gh,0));

SELECT AsText(ST_PointFromGeoHash('u5r2vty0',0));

SELECT ST_AsGeoJSON(GeomFromText("POINT(11.11111 12.22222)"),2,1);
SELECT ST_AsGeoJSON(GeomFromText("POINT(11.11111 12.22222)"),2,2);
SELECT ST_AsGeoJSON(GeomFromText("POINT(11.11111 12.22222)"),2,3);
SELECT ST_AsGeoJSON(GeomFromText("POINT(11.11111 12.22222)"),2,4);
SELECT ST_AsGeoJSON(GeomFromText("POINT(11.11111 12.22222)"),2,5);

SET @json = '{ "type": "Point", "coordinates": [102.0, 0.0]}';


SELECT AsText(ST_GeomFromGeoJSON(@json,2,4));

SELECT ST_AsText(ST_GeomFromGeoJson(
 '{
 "type": "Feature",
 "properties": {"Location": "Oracle HQ"},
 "geometry":
  {
	 "type": "Point",
 	"coordinates": [-122.262289, 37.530518]
  }
  }'
  ));
SELECT ST_AsGeoJson(ST_GeomFromText("POINT(-0.127676 51.507344)", 4326), 5, 4);


SELECT ST_AsText(ST_GeomFromGeoJson(
    '{
     "type": "LineString",
     "coordinates":
     [
        [30.1904297,69.7181067,1.11],
        [27.8173828,70.2446036,1.12],
        [21.9726563,69.6876184,1.12],
        [18.1054688,68.7204406,1.11],
        [15.9082031,67.5924750,1.12],
        [14.2382813,66.2314575,1.11],
        [13.1835938,65.1091482,1.10],
        [11.9091797,63.6267446,1.10],
        [8.65722660,61.2702328,1.11],
        [7.07519530,58.0080978,1.11]
      ]
    }', 3
    ));
EOL
