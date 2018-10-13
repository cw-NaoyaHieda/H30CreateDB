DROP TABLE IF EXISTS processed.jiten_data;
CREATE TABLE processed.jiten_data
	(
		station_code integer,
		cm_date date,
		cm_start_time timestamp,
		adv_type integer,
		adv_code character(5),
		brand_code character(8),
		cm_time integer,
		PRIMARY KEY(station_code, cm_start_time),
		FOREIGN KEY(station_code) REFERENCES processed.sta_mst(station_code),
		FOREIGN KEY(adv_type) REFERENCES sub_mst.adv_type_mst(adv_type),
		FOREIGN KEY(adv_code) REFERENCES processed.m_cm_tv_advertiser(adv_code),
		FOREIGN KEY(brand_code) REFERENCES processed.m_cm_tv_brand(brand_code)
	)
DISTRIBUTED BY (station_code, cm_start_time);



	
INSERT INTO processed.jiten_data
SELECT 
	TO_NUMBER(station_code, '9999999999999999999999999999'),
	cm_date_tmp,
	TO_TIMESTAMP(TO_CHAR(cm_date_tmp, 'YYYYMMDD') || cm_start_time_char, 'YYYYMMDDHH24MISS'),
	TO_NUMBER(adv_type, '9'),
	adv_code,
	brand_code,
	cm_time
FROM
(
	SELECT *,
		CASE WHEN 
				cm_start_time >= 240000 THEN TO_DATE('20' || cm_date, 'YYYY-MM-DD')+1
			ELSE 
				TO_DATE('20' || cm_date, 'YYYY-MM-DD') 
			END AS cm_date_tmp,
		TO_CHAR(CASE WHEN cm_start_time >= 240000 THEN cm_start_time-240000 ELSE cm_start_time END, 'FM000000') AS cm_start_time_char
	FROM 
		original.jiten_data
)
	AS jiten_data_tmp;
