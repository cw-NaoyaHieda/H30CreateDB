DISTRIBUTED BY(house_num);
CREATE TABLE original.t_weblog2(
  house_num CHAR(100),
  ind_num CHAR(100),
  web_date CHAR(100),
  web_start_time CHAR(100),
  pc_flag CHAR(100),
  sp_flag CHAR(100),
  tb_flag CHAR(100),
  url TEXT,
  domain TEXT,
  sub_domain CHAR(100),
  user_agent TEXT,
  referrer TEXT,
  referrer_domain CHAR(100),
  web_title TEXT,
  web_time CHAR(100)
);


-- データを挿入する3
COPY 
  original.t_weblog2
FROM 
  '/home/takut0/data/修正データ2/t_weblog_0002_part_00.tsv' DELIMITER U&'\0009'; 

