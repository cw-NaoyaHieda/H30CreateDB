SELECT
AX(len0),
MAX(len1),
MAX(cm_start_time),
MAX(len2),
MAX(len3),
MAX(len4),
MAX(cm_time),
MIN(len0),
MIN(len1),
MIN(cm_start_time),
MIN(len2),
MIN(len3),
MIN(len4),
MIN(cm_time),
COUNT(DISTINCT(station_code)),
COUNT(DISTINCT(cm_date)),
COUNT(DISTINCT(cm_start_time)),
COUNT(DISTINCT(adv_type)),
COUNT(DISTINCT(adv_code)),
COUNT(DISTINCT(brand_code)),
COUNT(DISTINCT(cm_time)),
SUM(CASE WHEN station_code IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN cm_date IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN cm_start_time IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN adv_type IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN adv_code IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN brand_code IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN cm_time IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN station_code='' THEN 1 ELSE 0 END),
SUM(CASE WHEN cm_date='' THEN 1 ELSE 0 END),
SUM(CASE WHEN adv_type='' THEN 1 ELSE 0 END),
SUM(CASE WHEN adv_code='' THEN 1 ELSE 0 END),
SUM(CASE WHEN brand_code='' THEN 1 ELSE 0 END)
FROM
(
    -- 文字列を長さに変換する仮テーブル
    SELECT
        *,
		    char_length(station_code) AS len0,
		    char_length(cm_date) AS len1,
		    char_length(adv_type) AS len2,
		    char_length(adv_code) AS len3,
		    char_length(brand_code) AS len4
    FROM
        original.jiten_data
    ) AS length_table;
			   
-- 以下前処理済みデータ			   
SELECT
MAX(station_code),
MAX(cm_date),
MAX(cm_start_time),
MAX(adv_type),
MAX(len0),
MAX(len1),
MAX(cm_time),
MIN(station_code),
MIN(cm_date),
MIN(cm_start_time),
MIN(adv_type),
MIN(len0),
MIN(len1),
MIN(cm_time),
COUNT(DISTINCT(station_code)),
COUNT(DISTINCT(cm_date)),
COUNT(DISTINCT(cm_start_time)),
COUNT(DISTINCT(adv_type)),
COUNT(DISTINCT(adv_code)),
COUNT(DISTINCT(brand_code)),
COUNT(DISTINCT(cm_time)),
SUM(CASE WHEN station_code IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN cm_date IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN cm_start_time IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN adv_type IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN adv_code IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN brand_code IS NULL THEN 1 ELSE 0 END),
SUM(CASE WHEN cm_time IS NULL THEN 1 ELSE 0 END)
FROM
(
    -- 文字列を長さに変換する仮テーブル
    SELECT
        *,
		    char_length(adv_code) AS len0,
		    char_length(brand_code) AS len1
    FROM
        processed.jiten_data
    ) AS length_table;