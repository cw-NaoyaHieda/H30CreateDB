psql -p 5431 -d video -U naoya -f processedsqls/2_preprocess_profiledata.sql

psql -p 5431 -d video -U naoya -f processedsqls/2_preprocess_profilemaster.sql

psql -p 5431 -d video -U naoya -f processedsqls/process_tv_orgn_p_cv.sql

psql -p 5431 -d video -U naoya -f processedsqls/process_tv_p_sample_cv.sql

psql -p 5431 -d video -U naoya -f processedsqls/processed_bancluster_mst.sql

psql -p 5431 -d video -U naoya -f processedsqls/processed_jiten_data.sql

psql -p 5431 -d video -U naoya -f processedsqls/processed_job_mst.sql

psql -p 5431 -d video -U naoya -f processedsqls/processed_m_cm_tv_advertiser.sql

psql -p 5431 -d video -U naoya -f processedsqls/processed_m_cm_tv_brand.sql

psql -p 5431 -d video -U naoya -f processedsqls/processed_sta_mst.sql

psql -p 5431 -d video -U naoya -f processedsqls/processed_tv_program.sql

psql -p 5431 -d video -U naoya -f processedsqls/sub_master.sql

psql -p 5431 -d video -U naoya -f processedsqls/process_tv_play_p_cv.sql
