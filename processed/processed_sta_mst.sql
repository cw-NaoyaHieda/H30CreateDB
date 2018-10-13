DROP TABLE IF EXISTS processed.sta_mst;
CREATE TABLE processed.sta_mst
    (
    station_code int NOT NULL PRIMARY KEY,
    station_jp character(6),
    station_ab character(4)
    )
DISTRIBUTED BY (station_code);

INSERT INTO processed.sta_mst
SELECT
	CAST (station_code AS int),
	station_jp,
	station_ab
FROM
	original.sta_mst;
SELECT * FROM processed.sta_mst;