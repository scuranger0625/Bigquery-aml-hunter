-- 從 BigQuery 的資料表中選取所有欄位（* 表示全欄位）
SELECT *

-- 資料來源為 saml_d 資料集中的 aml_transactions 表格
-- 注意：表格名稱要用反引號 ` 括起來，避免和保留字衝突
FROM `saml_d.aml_transactions`

-- 只顯示前 10 筆資料（常用來做預覽）
LIMIT 10;
