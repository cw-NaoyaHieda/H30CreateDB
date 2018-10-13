DELETE FROM original.tv_orgn_p_cv;
copy original.tv_orgn_p_cv from '/home/naoya/Desktop/H30data_1011/tv_orgn/tv_orgn_p_cv_0000_part_00.csv' with csv;
copy original.tv_orgn_p_cv from '/home/naoya/Desktop/H30data_1011/tv_orgn/tv_orgn_p_cv_0001_part_00.csv' with csv;
copy original.tv_orgn_p_cv from '/home/naoya/Desktop/H30data_1011/tv_orgn/tv_orgn_p_cv_0002_part_00.csv' with csv;
copy original.tv_orgn_p_cv from '/home/naoya/Desktop/H30data_1011/tv_orgn/tv_orgn_p_cv_0003_part_00.csv' with csv;

DELETE FROM original.tv_program;
copy original.tv_program from '/home/naoya/Desktop/H30data_1011/tv_program/tv_program_0000_part_00' with csv;
copy original.tv_program from '/home/naoya/Desktop/H30data_1011/tv_program/tv_program_0001_part_00' with csv;
copy original.tv_program from '/home/naoya/Desktop/H30data_1011/tv_program/tv_program_0002_part_00' with csv;
copy original.tv_program from '/home/naoya/Desktop/H30data_1011/tv_program/tv_program_0003_part_00' with csv;

DELETE FROM original.tv_sample_p_cv;
copy original.tv_sample_p_cv from '/home/naoya/Desktop/H30data_1011/tv_sample/tv_sample_p_cv_0000_part_00.csv' with csv;
copy original.tv_sample_p_cv from '/home/naoya/Desktop/H30data_1011/tv_sample/tv_sample_p_cv_0001_part_00.csv' with csv;
copy original.tv_sample_p_cv from '/home/naoya/Desktop/H30data_1011/tv_sample/tv_sample_p_cv_0002_part_00.csv' with csv;
copy original.tv_sample_p_cv from '/home/naoya/Desktop/H30data_1011/tv_sample/tv_sample_p_cv_0003_part_00.csv' with csv;


DELETE FROM original.m_cm_tv_brand;
copy original.m_cm_tv_brand from '/home/naoya/Desktop/H30data_1011/1011/M_CM_TV_BRAND.csv' with csv;

DELETE FROM original.m_cm_tv_advertiser;
copy original.m_cm_tv_advertiser from '/home/naoya/Desktop/H30data_1011/1011/M_CM_TV_ADVERTISER.csv' with csv;

DELETE FROM original.bancluster_mst;
copy original.bancluster_mst from '/home/naoya/Desktop/H30data_1011/bancluster_mst.csv' with csv;

DELETE FROM original.jiten_data;
copy original.jiten_data from '/home/naoya/Desktop/H30data_1011/1011/jiten_data.csv' with csv;

DELETE FROM original.job_mst;
copy original.job_mst from '/home/naoya/Desktop/H30data_1011/job_mst.csv' with csv;

DELETE FROM original.sta_mst;
copy original.sta_mst from '/home/naoya/Desktop/H30data_1011/sta_mst.csv' with csv;

DELETE FROM original.tv_play_p_cv;
copy original.tv_play_p_cv from '/home/naoya/Desktop/H30data_1011/tv_play/tv_play_p_cv_0000_part_00.csv' with csv;
copy original.tv_play_p_cv from '/home/naoya/Desktop/H30data_1011/tv_play/tv_play_p_cv_0001_part_00.csv' with csv;
copy original.tv_play_p_cv from '/home/naoya/Desktop/H30data_1011/tv_play/tv_play_p_cv_0002_part_00.csv' with csv;
copy original.tv_play_p_cv from '/home/naoya/Desktop/H30data_1011/tv_play/tv_play_p_cv_0003_part_00.csv' with csv;

DELETE original.profiledata;
COPY
  original.profiledata
FROM
  '/home/naoya/Desktop/H30data_1011/ProfileData_2.csv' WITH CSV;

DELETE original.profilemaster;
COPY
  original.profilemaster
FROM
  '/home/naoya/Desktop/H30data_1011/ProfileMaster.csv' WITH CSV;
