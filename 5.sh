psql -p 5431 video -f processed/0_insert_weblog.sql

psql -p 5431 video -f processed/2_preprocess_t_weblog.sql

psql -p 5431 video -f processed/0_insert_weblog1.sql

psql -p 5431 video -f processed/2_preprocess_t_weblog1.sql

psql -p 5431 video -f processed/0_insert_weblog2.sql

psql -p 5431 video -f processed/2_preprocess_t_weblog2.sql

psql -p 5431 video -f processed/0_insert_weblog3.sql

psql -p 5431 video -f processed/2_preprocess_t_weblog3.sql
