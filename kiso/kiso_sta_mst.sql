SELECT
    MAX(LENGTH(station_code))AS code_lengthmax,
    MIN(LENGTH(station_code))AS code_lengthmin,
    MAX(LENGTH(station_jp))AS jp_lengthmax,
    MIN(LENGTH(station_JP))AS jp_lengthmin,
    MAX(LENGTH(station_ab))AS ab_lengthmax,
    MIN(LENGTH(station_ab))AS ab_lengthmin,
    SUM (CASE WHEN station_code IS NULL THEN 1 ELSE 0 END) AS code_nll,
    SUM (CASE WHEN station_jp IS NULL THEN 1 ELSE 0 END) AS jp_null,
    SUM (CASE WHEN station_ab IS NULL THEN 1 ELSE 0 END ) AS ab_null,
    SUM (CASE WHEN station_code = ''  THEN 1 ELSE 0 END) AS code_emp,
    SUM (CASE WHEN station_jp = ' ' THEN 1 ELSE 0 END) AS jp_emp,
    SUM (CASE WHEN station_ab = ' ' THEN 1 ELSE 0 END ) AS ab_emp,
    COUNT(DISTINCT station_code)AS code_dist,
    COUNT(DISTINCT station_jp)AS jp_dist,
    COUNT(DISTINCT station_ab)AS ab_dist
FROM original.sta_mst;

SELECT
    MAX(station_code)AS code_max,
    MIN(station_code)AS code_min,
    MAX(LENGTH(station_jp))AS jp_lengthmax,
    MIN(LENGTH(station_JP))AS jp_lengthmin,
    MAX(LENGTH(station_ab))AS ab_lengthmax,
    MIN(LENGTH(station_ab))AS ab_lengthmin,
    SUM (CASE WHEN station_code IS NULL THEN 1 ELSE 0 END) AS code_nll,
    SUM (CASE WHEN station_jp IS NULL THEN 1 ELSE 0 END) AS jp_null,
    SUM (CASE WHEN station_ab IS NULL THEN 1 ELSE 0 END ) AS ab_null,
    SUM (CASE WHEN station_jp = ' ' THEN 1 ELSE 0 END) AS jp_emp,
    SUM (CASE WHEN station_ab = ' ' THEN 1 ELSE 0 END ) AS ab_emp,
    COUNT(DISTINCT station_code)AS code_dist,
    COUNT(DISTINCT station_jp)AS jp_dist,
    COUNT(DISTINCT station_ab)AS ab_dist
FROM processed.sta_mst;