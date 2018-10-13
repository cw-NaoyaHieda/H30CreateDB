--original
SELECT 
	MAX(DISTINCT LENGTH(adv_code)),
	MAX(DISTINCT LENGTH(adv_kana)), 
	MAX(DISTINCT LENGTH(adv_name)), 
	MAX(DISTINCT adv_start),
	MAX(DISTINCT adv_lastup), 	MIN(DISTINCT LENGTH(adv_code)),
	MIN(DISTINCT LENGTH(adv_kana)), 
	MIN(DISTINCT LENGTH(adv_name)), 
	MIN(DISTINCT adv_start),
	MIN(DISTINCT adv_lastup),
	SUM(CASE WHEN adv_code IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_kana IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_name IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_start IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_lastup IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_code = ' ' then 1 ELSE 0 END),
	SUM(CASE WHEN adv_kana = ' ' then 1 ELSE 0 END),
	SUM(CASE WHEN adv_name = ' ' then 1 ELSE 0 END),
	COUNT(DISTINCT adv_code), 
	COUNT(DISTINCT adv_kana), 
	COUNT(DISTINCT adv_name), 
	COUNT(DISTINCT adv_start),
	COUNT(DISTINCT adv_lastup)
FROM 
	original.m_cm_tv_advertiser;
	
--processed
	
SELECT 
	MAX(DISTINCT LENGTH(adv_code)),
	MAX(DISTINCT LENGTH(adv_kana)), 
	MAX(DISTINCT LENGTH(adv_name)), 
	MAX(DISTINCT adv_start),
	MAX(DISTINCT adv_lastup), 
	MIN(DISTINCT LENGTH(adv_code)),
	MIN(DISTINCT LENGTH(adv_kana)), 
	MIN(DISTINCT LENGTH(adv_name)), 
	MIN(DISTINCT adv_start),
	MIN(DISTINCT adv_lastup),
	SUM(CASE WHEN adv_code IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_kana IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_name IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_start IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_lastup IS NULL = TRUE then 1 ELSE 0 END),
	SUM(CASE WHEN adv_code = ' ' then 1 ELSE 0 END),
	SUM(CASE WHEN adv_kana = ' ' then 1 ELSE 0 END),
	SUM(CASE WHEN adv_name = ' ' then 1 ELSE 0 END),
	COUNT(DISTINCT adv_code), 
	COUNT(DISTINCT adv_kana), 
	COUNT(DISTINCT adv_name), 
	COUNT(DISTINCT adv_start),
	COUNT(DISTINCT adv_lastup)

FROM 
	processed.m_cm_tv_advertiser;

																		 							