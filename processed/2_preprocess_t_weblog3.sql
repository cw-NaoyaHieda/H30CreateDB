INSERT INTO processed.t_weblog
SELECT
  TO_NUMBER(house_num,'99999'),
  TO_DATE(web_date,'YYYY-MM-DD'),
  CASE
   WHEN to_number(web_start_time,'999999') >= 250000
    THEN to_timestamp(web_date||'0'||TRIM(to_char(to_number(web_start_time,'999999') - 240000,'99999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN to_number(web_start_time,'999999') >= 241000 AND to_number(web_start_time,'999999') < 250000
    THEN to_timestamp(web_date||'00'||TRIM(to_char(to_number(web_start_time,'999999') - 240000,'9999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN to_number(web_start_time,'999999') >= 240100 AND to_number(web_start_time,'999999') < 241000
    THEN to_timestamp(web_date||'000'|| TRIM(to_char(to_number(web_start_time,'999999') - 240000,'999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN to_number(web_start_time,'999999') >= 240010 AND to_number(web_start_time,'999999') < 240100
    THEN to_timestamp(web_date||'0000'||TRIM(to_char(to_number(web_start_time,'999999') - 240000,'99')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN to_number(web_start_time,'999999') >= 240000 AND to_number(web_start_time,'999999') < 240010
    THEN to_timestamp(web_date||'00000'|| TRIM(to_char(to_number(web_start_time,'999999') - 240000,'9')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   ELSE to_timestamp(web_date||web_start_time,'YYYY-MM-DDHH24MISS') END AS web_start_datetime,
  TO_NUMBER(pc_flag,'9'),
  TO_NUMBER(sp_flag,'9'),
  TO_NUMBER(tb_flag,'9'),
  url,
  domain,
  sub_domain,
  user_agent,
  referrer,
  referrer_domain,
  web_title,
  TO_NUMBER(web_time,'9999')
FROM
  original.t_weblog3;

DROP TABLE original.t_weblog3;
