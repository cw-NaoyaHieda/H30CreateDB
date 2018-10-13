DROP TABLE IF EXISTS sub_mst.adv_type_mst;
CREATE TABLE sub_mst.adv_type_mst(
	  adv_type integer,
	  adv_type_name character(6),
    PRIMARY KEY (adv_type)
	)
	DISTRIBUTED BY (adv_type);
INSERT INTO sub_mst.adv_type_mst VALUES (0,'タイムCM');
INSERT INTO sub_mst.adv_type_mst VALUES (1,'タイムCM');
INSERT INTO sub_mst.adv_type_mst VALUES (2,'スポットCM');
INSERT INTO sub_mst.adv_type_mst VALUES (3,'スポットCM');
INSERT INTO sub_mst.adv_type_mst VALUES (4,'スポットCM');

DROP TABLE IF EXISTS sub_mst.day_week_mst;
CREATE TABLE sub_mst.day_week_mst(
	  day_week integer,
	  day_week_name character(1),
    PRIMARY KEY (day_week)
	)
	DISTRIBUTED BY (day_week);
INSERT INTO sub_mst.day_week_mst VALUES (1,'月');
INSERT INTO sub_mst.day_week_mst VALUES (2,'火');
INSERT INTO sub_mst.day_week_mst VALUES (3,'水');
INSERT INTO sub_mst.day_week_mst VALUES (4,'木');
INSERT INTO sub_mst.day_week_mst VALUES (5,'金');
INSERT INTO sub_mst.day_week_mst VALUES (6,'土');
INSERT INTO sub_mst.day_week_mst VALUES (7,'日');


DROP TABLE IF EXISTS sub_mst.data_agg_type_mst;
CREATE TABLE sub_mst.data_agg_type_mst(
	  data_agg_type integer,
	  data_agg_type_name character(6),
    PRIMARY KEY (data_agg_type)
	)
	DISTRIBUTED BY (data_agg_type);
INSERT INTO sub_mst.data_agg_type_mst VALUES (1,'リアルタイム');
INSERT INTO sub_mst.data_agg_type_mst VALUES (9,'タイムシフト');


DROP TABLE IF EXISTS sub_mst.pc_flag_mst;
CREATE TABLE sub_mst.pc_flag_mst(
	  pc_flag integer,
	  pc character(7),
    PRIMARY KEY (pc_flag)
	)
	DISTRIBUTED BY (pc_flag);
INSERT INTO sub_mst.pc_flag_mst VALUES (1,'Windows');
INSERT INTO sub_mst.pc_flag_mst VALUES (2,'Mac');
INSERT INTO sub_mst.pc_flag_mst VALUES (9,'その他');
INSERT INTO sub_mst.pc_flag_mst VALUES (0,'その他');

DROP TABLE IF EXISTS sub_mst.sp_flag_mst;
CREATE TABLE sub_mst.sp_flag_mst(
	  sp_flag integer,
	  sp character(7),
    PRIMARY KEY (sp_flag)
	)
	DISTRIBUTED BY (sp_flag);
INSERT INTO sub_mst.sp_flag_mst VALUES (1,'Android');
INSERT INTO sub_mst.sp_flag_mst VALUES (2,'iPhone');
INSERT INTO sub_mst.sp_flag_mst VALUES (0,'その他');

DROP TABLE IF EXISTS sub_mst.tb_flag_mst;
CREATE TABLE sub_mst.tb_flag_mst(
	  tb_flag integer,
	  tb character(7),
    PRIMARY KEY (tb_flag)
	)
	DISTRIBUTED BY (tb_flag);
INSERT INTO sub_mst.tb_flag_mst VALUES (1,'Android');
INSERT INTO sub_mst.tb_flag_mst VALUES (2,'iPad');
INSERT INTO sub_mst.tb_flag_mst VALUES (0,'その他');

DROP TABLE IF EXISTS sub_mst.sin_toku_mst;
CREATE TABLE sub_mst.sin_toku_mst(
	  sin_toku character(1),
	  sin_toku_naiyou character(7),
    PRIMARY KEY (sin_toku)
	)
	DISTRIBUTED BY (sin_toku);
INSERT INTO sub_mst.sin_toku_mst VALUES ('N','普通');
INSERT INTO sub_mst.sin_toku_mst VALUES ('S','新番');
INSERT INTO sub_mst.sin_toku_mst VALUES ('T','特番');

DROP TABLE IF EXISTS sub_mst.br_format_mst;
CREATE TABLE sub_mst.br_format_mst(
	  br_format integer,
	  br_format_naiyou character(10),
    PRIMARY KEY (br_format)
	)
	DISTRIBUTED BY (br_format);
INSERT INTO sub_mst.br_format_mst VALUES (1,'レギュラー箱');
INSERT INTO sub_mst.br_format_mst VALUES (2,'レギュラー帯');
INSERT INTO sub_mst.br_format_mst VALUES (3,'単発箱');
INSERT INTO sub_mst.br_format_mst VALUES (4,'単発帯');
INSERT INTO sub_mst.br_format_mst VALUES (0,'NHKEテレ:空番組');

DROP TABLE IF EXISTS sub_mst.house_hold_mst;
CREATE TABLE sub_mst.house_hold_mst(
	  house_hold integer,
	  house_hold_naiyou character(6),
    PRIMARY KEY (house_hold)
	)
	DISTRIBUTED BY (house_hold);
INSERT INTO sub_mst.house_hold_mst VALUES (1,'世帯主');
INSERT INTO sub_mst.house_hold_mst VALUES (2,'世帯主件主婦');
INSERT INTO sub_mst.house_hold_mst VALUES (3,'主婦(役割)');
INSERT INTO sub_mst.house_hold_mst VALUES (4,'その他');

