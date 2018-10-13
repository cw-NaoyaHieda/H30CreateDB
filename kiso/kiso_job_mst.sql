SELECT
    MAX(LENGTH(job_code))AS job_code_lengthmax,
	MIN(LENGTH(job_code))AS job_code_lengthmin,
    MAX(LENGTH(job))AS job_max,
	MIN(LENGTH(job))AS job_min,
    SUM (CASE WHEN job_code IS NULL THEN 1 ELSE 0 END) AS job_code_nll,
    SUM (CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS job_null,
	SUM (CASE WHEN job_code = ' ' THEN 1 ELSE 0 END) AS job_code_emp,
    SUM (CASE WHEN job = ' ' THEN 1 ELSE 0 END) AS job_emp,
    COUNT(DISTINCT job_code)AS job_code_dist,
    COUNT(DISTINCT job)AS job_dist
FROM original.job_mst;

SELECT
    MAX(job_code)AS job_code_max,
	MIN(job_code)AS job_code_min,
    MAX(LENGTH(job))AS job_max,
	MIN(LENGTH(job))AS job_min,
    SUM (CASE WHEN job_code IS NULL THEN 1 ELSE 0 END) AS job_code_nll,
    SUM (CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS job_null,
    COUNT(DISTINCT job_code)AS job_code_dist,
    COUNT(DISTINCT job)AS job_dist
FROM processed.job_mst;