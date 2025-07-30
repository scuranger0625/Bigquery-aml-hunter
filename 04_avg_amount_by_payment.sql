-- 🔢 練習 4：各付款方式的平均金額（四捨五入至小數點第 2 位）

-- 選取兩個欄位：付款方式與平均金額（取至小數第 2 位）
SELECT
  Payment_type,  -- 各筆交易的付款方式欄位（如信用卡、現金等）

  -- 使用 AVG() 計算該付款方式所有交易的平均金額
  -- 使用 ROUND(..., 2) 將結果四捨五入至小數點第 2 位
  ROUND(AVG(Amount), 2) AS avg_amount

-- 指定查詢的資料來源表格
FROM `saml_d.aml_transactions`

-- 將資料依付款方式進行群組
-- 每一種付款方式會是一組（例如：現金、轉帳、信用卡）
GROUP BY Payment_type

-- 將結果依平均金額從大到小排序，方便觀察高金額付款方式
ORDER BY avg_amount DESC;
