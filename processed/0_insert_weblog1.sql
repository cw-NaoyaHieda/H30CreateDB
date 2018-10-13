-- データを挿入する2
COPY 
  original.t_weblog1
FROM 
  '/home/takut0/data/修正データ2/t_weblog_0001_part_00.tsv' DELIMITER U&'\0009'; 

