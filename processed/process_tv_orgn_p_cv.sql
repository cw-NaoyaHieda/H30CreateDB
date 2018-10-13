DROP TABLE IF EXISTS processed.tv_orgn_p_cv;
CREATE TABLE processed.tv_orgn_p_cv
(
    br_start_datetime timestamp,
    br_end_datetime timestamp,
    br_day_week integer,
    house_num integer ,
    station_code integer,
    tv_num integer,
    data_agg_type integer,
    dataseq integer,
    br_date date,

    primary key(br_start_datetime, br_end_datetime, house_num, station_code, tv_num, data_agg_type, dataseq)
    --foreign key(station_code) REFERENCES processed.station_mst (station_code)
    -- foreign key(house_num) REFERENCES processed.tv_sample_p_cv (house_num)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default
DISTRIBUTED BY (br_start_datetime, br_end_datetime, house_num, station_code, tv_num, data_agg_type, dataseq)
;

INSERT INTO  processed.tv_orgn_p_cv
SELECT
	CASE WHEN to_number(start_time,'9999') >= 2500 THEN to_timestamp(br_date||'0'||TRIM(to_char(to_number(start_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(start_time,'9999') >= 2410 THEN to_timestamp(br_date||'00'||TRIM(to_char(to_number(start_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(start_time,'9999') >= 2400 THEN to_timestamp(br_date||'000'|| TRIM(to_char(to_number(start_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(br_date||start_time,'YYYY-MM-DDHH24MI') END AS br_start_datetime,
	CASE WHEN to_number(end_time,'9999') >= 2500 THEN to_timestamp(br_date||'0'||TRIM(to_char(to_number(end_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(end_time,'9999') >= 2410 THEN to_timestamp(br_date||'00'||TRIM(to_char(to_number(end_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(end_time,'9999') >= 2400 THEN to_timestamp(br_date||'000'|| TRIM(to_char(to_number(end_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(br_date||end_time,'YYYY-MM-DDHH24MI') END AS br_end_datetime,
	to_number(br_day_week,'9'),
	to_number(house_num,'99999'),
	to_number(station_code,'9999'),
	to_number(tv_num,'99'),
	to_number(data_agg_type,'99'),
  to_number(dataseq, '9999'),
	--ROW_NUMBER() OVER (PARTITION BY br_date, start_time, house_num, station_code, tv_num, data_agg_type ORDER BY data_agg_type ASC) AS dataseq,
	TO_DATE(br_date,'YYYY-MM-DD')
FROM
	original.tv_orgn_p_cv
WHERE house_num IS NOT NULL;

CREATE VIEW processed.tv_orgn_p_cv_view AS
SELECT
	CASE WHEN to_number(start_time,'9999') >= 2500 THEN to_timestamp(br_date||'0'||TRIM(to_char(to_number(start_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(start_time,'9999') >= 2410 THEN to_timestamp(br_date||'00'||TRIM(to_char(to_number(start_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(start_time,'9999') >= 2400 THEN to_timestamp(br_date||'000'|| TRIM(to_char(to_number(start_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(br_date||start_time,'YYYY-MM-DDHH24MI') END AS br_start_datetime,
	CASE WHEN to_number(end_time,'9999') >= 2500 THEN to_timestamp(br_date||'0'||TRIM(to_char(to_number(end_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(end_time,'9999') >= 2410 THEN to_timestamp(br_date||'00'||TRIM(to_char(to_number(end_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(end_time,'9999') >= 2400 THEN to_timestamp(br_date||'000'|| TRIM(to_char(to_number(end_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(br_date||end_time,'YYYY-MM-DDHH24MI') END AS br_end_datetime,
	to_number(br_day_week,'9') AS br_day_week,
	house_num,
	to_number(station_code,'9999') AS station_code,
	to_number(tv_num,'99') AS tv_num,
	to_number(data_agg_type,'99') AS data_agg_type,
	ROW_NUMBER() OVER (PARTITION BY br_date, start_time, house_num, station_code, tv_num, data_agg_type ORDER BY data_agg_type ASC) AS dataseq,
	TO_DATE(br_date,'YYYY-MM-DD')
FROM
	original.tv_orgn_p_cv
WHERE house_num IS NULL;
