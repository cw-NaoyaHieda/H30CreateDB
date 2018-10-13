DROP TABLE IF EXISTS processed.job_mst;
CREATE TABLE processed.job_mst
    (
    job_code int NOT NULL PRIMARY KEY,
    job varchar(20)
    )
DISTRIBUTED BY (job_code);

INSERT INTO processed.job_mst
SELECT
	CAST (job_code AS int),
	job
FROM
	original.job_mst;
SELECT * FROM processed.job_mst;