-- basic analysis for raw data -- 
SELECT
  MAX(house_num),
  MAX(qu_genre_code),
  MAX(question_code),
  MAX(answer_code),
  MIN(house_num),
  MIN(qu_genre_code),
  MIN(question_code),
  MIN(answer_code),
  COUNT(DISTINCT(house_num)),
  COUNT(DISTINCT(qu_genre_code)),
  COUNT(DISTINCT(question_code)),
  COUNT(DISTINCT(answer_code)),
  SUM(CASE WHEN house_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN qu_genre_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN question_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN answer_code IS NULL THEN 1 ELSE 0 END)
FROM
  processed.profiledata;