DROP TABLE IF EXISTS processed.profilemaster;
CREATE TABLE processed.profilemaster
(
  qu_genre_code INT,
  qu_genre CHAR(33),
  question_code INT,
  question CHAR(57),
  question_type CHAR(2),
  answer_code INT,
  answer CHAR(65),
  PRIMARY KEY (qu_genre_code,question_code, answer_code)
)
DISTRIBUTED BY (qu_genre_code,question_code, answer_code);
INSERT INTO processed.profilemaster
SELECT
  TO_NUMBER(qu_genre_code,'99'),
  qu_genre,
  TO_NUMBER(question_code,'999'),
  question,
  question_type,
  TO_NUMBER(answer_code,'999'),
  answer
FROM 
  original.profilemaster;
   