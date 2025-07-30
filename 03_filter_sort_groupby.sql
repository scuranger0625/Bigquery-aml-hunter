-- 📊 查詢整體洗錢比例
SELECT
  COUNT(*) AS total_tx,  -- 所有交易總數
  COUNTIF(Is_laundering = 1) AS laundering_tx,  -- 符合洗錢條件的筆數
  ROUND(COUNTIF(Is_laundering = 1) * 100.0 / COUNT(*), 2) AS laundering_rate_pct  -- 百分比計算
FROM `saml_d.aml_transactions`;
