SELECT
   min(len1),
	min(len0),
	min(ind_num),
	min(house_hold),
	min(sex),
	min(marriage),
	min(age),
	min(len7),
	max(len1),
	max(len0),
	max(ind_num),
	max(house_hold),
	max(sex),
	max(marriage),
	max(age),
	max(len7),
	COUNT(DISTINCT(sample_date)),
	COUNT(DISTINCT(house_num)),
	COUNT(DISTINCT(ind_num)),
	COUNT(DISTINCT(house_hold)),
	COUNT(DISTINCT(sex)),
	COUNT(DISTINCT(marriage)),
	COUNT(DISTINCT(age)),
	COUNT(DISTINCT(job_code)),
	SUM(CASE WHEN  sample_date IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  house_num IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  ind_num IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  house_hold IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  sex IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  marriage IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  age IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  job_code IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  sample_date  = '' THEN 1 ELSE 0 END),
	SUM(CASE WHEN  house_num  = '' THEN 1 ELSE 0 END),			   
	SUM(CASE WHEN  job_code  = '' THEN 1 ELSE 0 END)
FROM
    (
    -- 文字列を長さに変換する仮テーブル
    SELECT
        *,
		char_length(sample_date) AS len1,
		char_length(house_num) AS len0,
		char_length(job_code) AS len7
		FROM
        original.tv_sample_p_cv
    ) AS length_table;
    

	
--ジョブコード被り確認
SELECT
	COUNT(job_code)
FROM
	original.tv_sample_p_cv
WHERE
	job_code = unknown7;
	
--NULLデータ確認
SELECT
	*
FROM
	original.tv_sample_p_cv
WHERE
	house_num IS NULL;


-- treat後	

SELECT
    min(sample_date),
    min(len0),
    min(house_hold),
    min(sex),
    min(marriage),
    min(age),
    min(job_code),
    max(sample_date),
    max(len0),
    max(house_hold),
    max(sex),
    max(marriage),
    max(age),
    max(job_code),
	COUNT(DISTINCT(sample_date)),
	COUNT(DISTINCT(house_num)),
  COUNT(DISTINCT(house_hold)),
	COUNT(DISTINCT(sex)),
	COUNT(DISTINCT(marriage)),
	COUNT(DISTINCT(age)),
	COUNT(DISTINCT(job_code)),
	SUM(CASE WHEN  sample_date IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  house_num IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  house_hold IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  sex IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  marriage IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  age IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  job_code IS NULL THEN 1 ELSE 0 END),
	SUM(CASE WHEN  house_num  = '' THEN 1 ELSE 0 END)
FROM
    (
    -- 文字列を長さに変換する仮テーブル
    SELECT
        *,
		char_length(house_num) AS len0
    FROM
        processed.tv_sample_p_cv
    ) AS length_table;