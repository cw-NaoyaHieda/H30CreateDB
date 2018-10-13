DROP TABLE IF EXISTS processed.m_cm_tv_brand;
CREATE TABLE processed.m_cm_tv_brand
	(
    brand_code CHARACTER(8),
    adv_code CHARACTER(5),
    brand_kana CHARACTER(53),
    brand_name CHARACTER(57),
    brand_start DATE,
    brand_lastup DATE,
	primary key(brand_code),
    foreign key(adv_code) REFERENCES processed.m_cm_tv_advertiser (adv_code)
    )
DISTRIBUTED BY (brand_code);

INSERT INTO processed.m_cm_tv_brand
SELECT
    brand_code,
    adv_code,
    brand_kana,
    brand_name,
    to_date(to_char(brand_start, 'FM9999999999'), 'YYYYMMDD'),
    to_date(to_char(brand_lastup, 'FM9999999999'), 'YYYYMMDD')
FROM
    original.m_cm_tv_brand;