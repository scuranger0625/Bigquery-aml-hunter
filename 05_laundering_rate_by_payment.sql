-- 🔍 練習 5：每種付款方式的洗錢交易比例
SELECT
  Payment_type,  -- 付款方式（如現金、轉帳等）

  COUNT(*) AS total_tx,  -- 該付款方式的總交易筆數

  -- 使用 COUNTIF 計算其中是洗錢的交易數
  COUNTIF(Is_laundering = 1) AS laundering_tx,

  -- 計算洗錢比例（百分比格式）
  ROUND(COUNTIF(Is_laundering = 1) * 100.0 / COUNT(*), 2) AS laundering_rate_pct

FROM `saml_d.aml_transactions`

-- 每一種付款方式為一組
GROUP BY Payment_type

-- 將結果依洗錢比例由高到低排序
ORDER BY laundering_rate_pct DESC;
