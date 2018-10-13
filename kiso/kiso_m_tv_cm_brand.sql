--original基礎集計
SELECT
    MAX(len1)AS max_len1,
    MAX(len2)AS max_len2,
    MAX(len3)AS max_len3,
    MAX(len4)AS max_len4,
    MAX(brand_start)AS max_start,
    MAX(brand_lastup)AS max_lastup,
    MIN(len1)AS min_len1,
    MIN(len2)AS min_len2,
    MIN(len3)AS min_len3,
    MIN(len4)AS min_len4,
    MIN(brand_start)AS min_start,
    MIN(brand_lastup)AS min_lastup,
    COUNT(DISTINCT(brand_code))AS dis_brandcode,
    COUNT(DISTINCT(adv_code))AS dis_advcode,
    COUNT(DISTINCT(brand_kana))AS dis_kana,
    COUNT(DISTINCT(brand_name))AS dis_name,
    COUNT(DISTINCT(brand_start))AS dis_start,
    COUNT(DISTINCT(brand_lastup))AS dis_lastup,
    SUM(CASE WHEN brand_code IS NULL THEN 1 ELSE 0 END)AS null_brandcode,
    SUM(CASE WHEN adv_code IS NULL THEN 1 ELSE 0 END)AS null_adv_code,
    SUM(CASE WHEN brand_kana IS NULL THEN 1 ELSE 0 END)AS null_kana,
    SUM(CASE WHEN brand_name IS NULL THEN 1 ELSE 0 END)AS null_name,
    SUM(CASE WHEN brand_start IS NULL THEN 1 ELSE 0 END)AS null_start,
    SUM(CASE WHEN brand_lastup IS NULL THEN 1 ELSE 0 END)AS null_lastup,    
    SUM(CASE WHEN brand_code = '' THEN 1 ELSE 0 END)AS emp_brandcode,
    SUM(CASE WHEN adv_code = '' THEN 1 ELSE 0 END)AS emp_advcode,
    SUM(CASE WHEN brand_kana = '' THEN 1 ELSE 0 END)AS emp_kana,
    SUM(CASE WHEN brand_name = '' THEN 1 ELSE 0 END)AS emp_name
    		   
FROM
    (
    -- 文字列を長さに変換する仮テーブル
    SELECT
        *,
        char_length(brand_code) AS len1,
        char_length(adv_code) AS len2,
        char_length(brand_kana) AS len3,
        char_length(brand_name) AS len4
    FROM
        original.m_cm_tv_brand
    ) AS length_table;
				   
--processed基礎集計
SELECT
    MAX(len1)AS max_len1,
    MAX(len2)AS max_len2,
    MAX(len3)AS max_len3,
    MAX(len4)AS max_len4,
    MAX(brand_start)AS max_start,
    MAX(brand_lastup)AS max_lastup,
    MIN(len1)AS min_len1,
    MIN(len2)AS min_len2,
    MIN(len3)AS min_len3,
    MIN(len4)AS min_len4,
    MIN(brand_start)AS min_start,
    MIN(brand_lastup)AS min_lastup,
    COUNT(DISTINCT(brand_code))AS dis_brandcode,
    COUNT(DISTINCT(adv_code))AS dis_advcode,
    COUNT(DISTINCT(brand_kana))AS dis_kana,
    COUNT(DISTINCT(brand_name))AS dis_name,
    COUNT(DISTINCT(brand_start))AS dis_start,
    COUNT(DISTINCT(brand_lastup))AS dis_lastup,
    SUM(CASE WHEN brand_code IS NULL THEN 1 ELSE 0 END)AS null_brandcode,
    SUM(CASE WHEN adv_code IS NULL THEN 1 ELSE 0 END)AS null_adv_code,
    SUM(CASE WHEN brand_kana IS NULL THEN 1 ELSE 0 END)AS null_kana,
    SUM(CASE WHEN brand_name IS NULL THEN 1 ELSE 0 END)AS null_name,
    SUM(CASE WHEN brand_start IS NULL THEN 1 ELSE 0 END)AS null_start,
    SUM(CASE WHEN brand_lastup IS NULL THEN 1 ELSE 0 END)AS null_lastup,    
    SUM(CASE WHEN brand_code = '' THEN 1 ELSE 0 END)AS emp_brandcode,
    SUM(CASE WHEN adv_code = '' THEN 1 ELSE 0 END)AS emp_advcode,
    SUM(CASE WHEN brand_kana = '' THEN 1 ELSE 0 END)AS emp_kana,
    SUM(CASE WHEN brand_name = '' THEN 1 ELSE 0 END)AS emp_name
    		   
FROM
    (
    -- 文字列を長さに変換する仮テーブル
    SELECT
        *,
        char_length(brand_code) AS len1,
        char_length(adv_code) AS len2,
        char_length(brand_kana) AS len3,
        char_length(brand_name) AS len4
    FROM
        processed.m_cm_tv_brand
    ) AS length_table;