-- basic analysis for raw data -- 
SELECT
  MAX(qu_genre_code),
  MAX(qu_genre_len),
  MAX(question_code),
  MAX(question_len),
  MAX(question_type_len),
  MAX(answer_code),
  MAX(answer_len),
  MIN(qu_genre_code),
  MIN(qu_genre_len),
  MIN(question_code),
  MIN(question_len),
  MIN(question_type_len),
  MIN(answer_code),
  MIN(answer_len),
  COUNT(DISTINCT(qu_genre_code)),
  COUNT(DISTINCT(qu_genre)),
  COUNT(DISTINCT(question_code)),
  COUNT(DISTINCT(question)),
  COUNT(DISTINCT(question_type)),
  COUNT(DISTINCT(answer_code)),
  COUNT(DISTINCT(answer)),
  SUM(CASE WHEN qu_genre_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN qu_genre IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN question_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN question IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN question_type IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN answer_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN answer IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN qu_genre_code='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN qu_genre='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN question_code='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN question='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN question_type='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN answer_code='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN answer='' THEN 1 ELSE 0 END)
FROM(
  -- 文字列を長さに変換する仮テーブル --
  SELECT
    *,
    CHAR_LENGTH(qu_genre) AS qu_genre_len, 
    CHAR_LENGTH(question) AS question_len,
    CHAR_LENGTH(question_type) AS question_type_len,
    CHAR_LENGTH(answer) AS answer_len
  FROM
    processed.profilemaster
    ) AS length_table;