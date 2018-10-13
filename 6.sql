-- Table: add_data.performer

DROP TABLE IF EXISTS add_data.performer;

CREATE TABLE add_data.performer
(
    housou_time character(10),
    naiyou text,
    ch text,
    date character(10)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default
DISTRIBUTED RANDOMLY
;

ALTER TABLE add_data.performer
    OWNER to naoya;


COPY add_data.performer FROM '/home/naoya/Desktop/syutuenzyouhou/syutuen.csv' WITH csv;


DROP TABLE IF EXISTS add_data.performer2;

CREATE TABLE add_data.performer2
(
    program_name_crow text,
    br_start_datetime_crow timestamp without time zone,
    day_week "char",
    station_jp_crow character(10),
    regular text,
    guest text,
    koe text,
    other text,
    chara text,
    PRIMARY KEY (program_name_crow, br_start_datetime_crow, station_jp_crow)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default
DISTRIBUTED BY (program_name_crow, br_start_datetime_crow, station_jp_crow)
;

ALTER TABLE add_data.performer2
    OWNER to naoya;

INSERT INTO add_data.performer2
SELECT
  split_part(naiyou, SUBSTR(date,1,4)||'年'||
  CASE WHEN to_number(SUBSTR(date,5,1),'9') = 0 THEN SUBSTR(date,6,1) ELSE SUBSTR(date,5,2) END
  ||'月'||
  CASE WHEN to_number(SUBSTR(date,7,1),'9') = 0 THEN SUBSTR(date,8,1) ELSE SUBSTR(date,7,2) END
  ||'日' ,1),
  to_timestamp(date||split_part(housou_time,'〜',1),'YYYYmmddHH24:MI'),
  split_part(split_part(naiyou,'日（',2),'）',1),
  CASE WHEN to_number(split_part(ch,'=',2),'9') = 4 THEN 'TBS'
       WHEN to_number(split_part(ch,'=',2),'9') = 6 THEN '日本テレビ'
       WHEN to_number(split_part(ch,'=',2),'9') = 8 THEN 'フジテレビ'
       WHEN to_number(split_part(ch,'=',2),'99') = 10 THEN 'テレビ朝日'
       WHEN to_number(split_part(ch,'=',2),'99') = 12 THEN 'テレビ東京'
       ELSE NULL END,
  split_part(split_part(naiyou,'【レギュラー出演】',2),'【',1),
  split_part(split_part(naiyou,'【ゲスト】',2),'【',1),
  split_part(split_part(naiyou,'【声の出演】',2),'【',1),
  split_part(split_part(naiyou,'【その他】',2),'【',1),
  split_part(split_part(naiyou,'【キャラクター】',2),'【',1)
FROM
  add_data.performer;

DROP TABLE IF EXISTS add_data.performer;
ALTER TABLE add_data.performer2 RENAME TO performer;

DROP TABLE IF EXISTS add_data.top10_rating_tv_tmp;
CREATE TABLE add_data.top10_rating_tv_tmp(
        program_name_crow character(50),
        station_jp_crow character(6),
        br_date_crow character(40),
        br_time_crow character(30),
        rating real,
        pg_jenre_crow character(20),
        rank_group integer,
        rank integer,

        primary key(pg_jenre_crow, rank_group, rank)
)
distributed by(pg_jenre_crow, rank_group, rank);

COPY add_data.top10_rating_tv_tmp FROM '/home/naoya/Desktop/get_top10_sityou/top10_2018.csv' WITH CS$
COPY add_data.top10_rating_tv_tmp FROM '/home/naoya/Desktop/get_top10_sityou/top10_2017.csv' WITH CS$

