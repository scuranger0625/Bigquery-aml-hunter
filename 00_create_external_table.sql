-- 建立或更新 BigQuery 外部表：連結 GCS 上的 AML 交易 parquet 資料
CREATE OR REPLACE EXTERNAL TABLE `saml_d.aml_transactions`
OPTIONS (
  -- 指定檔案格式為 Parquet（適合結構化、大型資料）
  format = 'PARQUET',

  -- 指定 GCS 上的檔案位置（可用萬用字元）
  uris = ['gs://saml-d/SAML-D.parquet']
);
