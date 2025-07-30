-- 🕒 練習 9 修正版：從純時間欄位中擷取交易時段
SELECT
  EXTRACT(HOUR FROM PARSE_TIME('%H:%M:%S', Time)) AS tx_hour,  -- 使用 PARSE_TIME 將字串轉換為 TIME

  COUNT(*) AS total_tx,
  COUNTIF(Is_laundering = 1) AS laundering_tx,
  ROUND(COUNTIF(Is_laundering = 1) * 100.0 / COUNT(*), 2) AS laundering_rate_pct

FROM `saml_d.aml_transactions`

GROUP BY tx_hour
ORDER BY tx_hour;
