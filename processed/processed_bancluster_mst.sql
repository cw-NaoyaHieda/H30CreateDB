DROP TABLE IF EXISTS processed.bancluster_mst;
CREATE TABLE processed.bancluster_mst
	(ban_code1 integer,
	 ban_code2 integer,
	 ban_code3 character(3),
	 ban_name  character(31),
	 PRIMARY KEY (ban_code1, ban_code2, ban_code3)
	)
DISTRIBUTED BY (ban_code1,ban_code2,ban_code3);

INSERT INTO processed.bancluster_mst
	SELECT
		TO_NUMBER(ban_code1,'9'),
		TO_NUMBER(ban_code2,'99'),
		ban_code3,
		ban_name
	FROM
		original.bancluster_mst;