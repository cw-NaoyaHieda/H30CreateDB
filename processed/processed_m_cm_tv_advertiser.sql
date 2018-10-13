DROP TABLE IF EXISTS processed.m_cm_tv_advertiser;

CREATE TABLE processed.m_cm_tv_advertiser(
	adv_code char(5) primary key,
	adv_kana char(35),
	adv_name char(38),
	adv_start date,
	adv_lastup date
)
	DISTRIBUTED BY(adv_code);

INSERT INTO 
	processed.m_cm_tv_advertiser 
SELECT 
	adv_code,
	adv_kana,
	adv_name,
	TO_DATE( TO_CHAR(adv_start, '99999999'),'YYYYMMDD'), 
	TO_DATE( TO_CHAR(adv_lastup, '99999999'),'YYYYMMDD')
FROM
	original.m_cm_tv_advertiser;
