DROP TABLE IF EXISTS processed.tv_program;
CREATE TABLE processed.tv_program
	(
		station_code integer,
		program_code character(4),
		program_day_week integer,
		program_date date,
		program_start_time timestamp,
		program_time integer,
		program_end_time timestamp,
		ban_code1 integer,
		ban_code2 integer,
		ban_code3 character(3),
		sin_toku character(1),
		br_format integer,
		final_code integer,
		program_name character(41),
		program_name_kana character(20),
		PRIMARY KEY(station_code, program_code, program_date),
		FOREIGN KEY(ban_code1, ban_code2, ban_code3) REFERENCES processed.bancluster_mst(ban_code1, ban_code2, ban_code3),
		FOREIGN KEY(station_code) REFERENCES processed.sta_mst(station_code),
		FOREIGN KEY(sin_toku) REFERENCES sub_mst.sin_toku_mst(sin_toku),
		FOREIGN KEY(br_format) REFERENCES sub_mst.br_format_mst(br_format)
	);
	
INSERT INTO processed.tv_program
SELECT 
	TO_NUMBER(station_code, '9999'),
	program_code,
	TO_NUMBER(program_day_week, '9'),
	TO_DATE(program_date, 'YYYY-MM-DD'),
	TO_TIMESTAMP(
		CASE WHEN program_start_time >= 2400 THEN TO_DATE(program_date, 'YYYY-MM-DD') + 1  WHEN program_start_time < 2400 THEN TO_DATE(program_date, 'YYYY-MM-DD') END || 
		TO_CHAR(CASE WHEN program_start_time >= 2400 THEN program_start_time - 2400 WHEN program_start_time < 2400 THEN program_start_time END, 'FM0000'),
		'YYYY-MM-DDHH24MI'
	),
	program_time,
	TO_TIMESTAMP(
		CASE WHEN progmra_end_time >= 2400 THEN TO_DATE(program_date, 'YYYY-MM-DD') + 1  WHEN progmra_end_time < 2400 THEN TO_DATE(program_date, 'YYYY-MM-DD') END || 
		TO_CHAR(CASE WHEN progmra_end_time >= 2400 THEN progmra_end_time - 2400 WHEN progmra_end_time < 2400 THEN progmra_end_time END, 'FM0000'),
		'YYYY-MM-DDHH24MI'
	),
	TO_NUMBER(ban_code1, '9'),
	TO_NUMBER(ban_code2, '99'),
	ban_code3,
	CASE WHEN sin_toku IS NULL THEN 'N' ELSE sin_toku END,
	CASE WHEN br_format IS NULL THEN 0 ELSE TO_NUMBER(br_format, '9') END,
	CASE WHEN final_code IS NULL THEN 0 ELSE TO_NUMBER(final_code, '9') END,
	program_name,
	program_name_kana
FROM
	original.tv_program
WHERE
	program_name != '空き';
	
	
DROP VIEW IF EXISTS processed.tv_program_view;
CREATE VIEW processed.tv_program_view AS
SELECT
	*
FROM
	original.tv_program
WHERE
	program_name = '空き';