DROP TABLE IF EXISTS processed.tv_sample_p_cv;
CREATE TABLE processed.tv_sample_p_cv
	(
	  sample_date date,
    house_num integer,
    house_hold integer,
    sex integer,
    marriage integer,
    age integer,
    job_code integer,
    PRIMARY KEY (sample_date, house_num),
    FOREIGN KEY(house_hold) REFERENCES sub_mst.house_hold_mst(house_hold),
    FOREIGN KEY(job_code) REFERENCES processed.job_mst(job_code)
	)
	DISTRIBUTED BY (sample_date, house_num);
	
INSERT INTO processed.tv_sample_p_cv
SELECT
	to_date(sample_date,'YYYY-MM-DD') AS sample_date,
    to_number(house_num,'99999'),
    house_hold,
    sex,
    marriage,
    age,
    TO_NUMBER(job_code,'99')
FROM
	original.tv_sample_p_cv
WHERE
	house_num IS NOT NULL;
	
