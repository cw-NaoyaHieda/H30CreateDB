DROP TABLE IF EXISTS processed.tv_play_p_cv;
CREATE TABLE processed.tv_play_p_cv
	(
	  action_datetime timestamp,
    action_day_week integer,
    house_num integer,
    tv_num integer,
    station_code integer,--REFERENCES treat.sta_mst(station_code)),
    timeshift_datetime timestamp,
    timeshift_date_week integer ,
    action_date date,
		timeshift_date date,
    PRIMARY KEY (action_datetime, house_num),
    FOREIGN KEY (action_date, house_num) REFERENCES processed.tv_sample_p_cv (sample_date, house_num),
		FOREIGN KEY (station_code) REFERENCES processed.sta_mst (station_code),
		FOREIGN KEY (action_day_week) REFERENCES sub_mst.day_week_mst (day_week)
	)
	distributed by(action_datetime, house_num);

INSERT INTO  processed.tv_play_p_cv
SELECT
	CASE WHEN to_number(action_time,'9999') >= 2500 THEN to_timestamp(action_date||'0'||TRIM(to_char(to_number(action_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(action_time,'9999') >= 2410 THEN to_timestamp(action_date||'00'||TRIM(to_char(to_number(action_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(action_time,'9999') >= 2400 THEN to_timestamp(action_date||'000'|| TRIM(to_char(to_number(action_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(action_date||action_time,'YYYY-MM-DDHH24MI') END AS action_datetime,
	to_number(action_day_week,'9') AS action_day_week,
	to_number(house_num,'99999'),
	to_number(tv_num,'99') AS tv_num,
	to_number(station_code,'9999') AS station_code,
	CASE WHEN to_number(timeshift_time,'9999') >= 2500 THEN to_timestamp(timeshift_date||'0'|| TRIM(to_char(to_number(timeshift_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(timeshift_time,'9999') >= 2410 THEN to_timestamp(timeshift_date||'00'|| TRIM(to_char(to_number(timeshift_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(timeshift_time,'9999') >= 2400 THEN to_timestamp(timeshift_date||'000'|| TRIM(to_char(to_number(timeshift_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(timeshift_date||timeshift_time,'YYYY-MM-DDHH24MI') END AS timeshift_datetime,
	to_number(timeshift_day_week,'9') AS timeshift_date_week,
	to_date(action_date,'YYYY-MM-DD')  AS action_date,
	to_date(timeshift_date,'YYYY-MM-DD') AS timeshift_date
FROM
	original.tv_play_p_cv
WHERE
  house_num IS NOT NULL;



CREATE VIEW processed.tv_play_p_cv_view AS
SELECT
	CASE WHEN to_number(action_time,'9999') >= 2500 THEN to_timestamp(action_date||'0'||TRIM(to_char(to_number(action_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(action_time,'9999') >= 2410 THEN to_timestamp(action_date||'00'||TRIM(to_char(to_number(action_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(action_time,'9999') >= 2400 THEN to_timestamp(action_date||'000'|| TRIM(to_char(to_number(action_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(action_date||action_time,'YYYY-MM-DDHH24MI') END AS action_datetime,
	to_number(action_day_week,'9') AS action_day_week,
	house_num,
	to_number(tv_num,'99') AS tv_num,
	to_number(station_code,'9999') AS station_code,
	CASE WHEN to_number(timeshift_time,'9999') >= 2500 THEN to_timestamp(timeshift_date||'0'||TRIM(to_char(to_number(timeshift_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(timeshift_time,'9999') >= 2410 THEN to_timestamp(timeshift_date||'00'||TRIM(to_char(to_number(timeshift_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(timeshift_time,'9999') >= 2400 THEN to_timestamp(timeshift_date||'000'||TRIM(to_char(to_number(timeshift_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(timeshift_date||timeshift_time,'YYYY-MM-DDHH24MI') END AS timeshift_datetime,
	to_number(timeshift_day_week,'9') AS timeshift_date_week,
	to_date(action_date,'YYYY-MM-DD')  AS action_date
FROM
	original.tv_play_p_cv
WHERE
  house_num IS NULL;
