DROP TABLE IF EXISTS processed.profiledata;

CREATE TABLE processed.profiledata

(
  
	house_num INTEGER,
  
	qu_genre_code INTEGER,
  
	question_code INTEGER,
  
	answer_code INTEGER,
  
	PRIMARY KEY (house_num, qu_genre_code, question_code, answer_code),
--	FOREIGN KEY(house_num) REFERENCES processed.tv_sample_p_cv(house_num),
	FOREIGN KEY(qu_genre_code,question_code,answer_code) REFERENCES processed.profilemaster(qu_genre_code,question_code,answer_code)
	)

DISTRIBUTED BY (house_num, qu_genre_code, question_code, answer_code);



INSERT INTO processed.profiledata

SELECT
  
	TO_NUMBER(house_num, '99999'),
  
	TO_NUMBER(qu_genre_code, '99'),
  
	TO_NUMBER(question_code,'999'),
  
	TO_NUMBER(answer_code,'999')

FROM
  original.profiledata;