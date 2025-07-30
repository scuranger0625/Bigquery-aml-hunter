-- 🎯 練習 8：查每個帳戶的交易金額 P90（第 90 百分位）

SELECT
  Sender_account,  -- 每個發款帳戶（Sender_account）作為分組單位

  -- 使用 APPROX_QUANTILES 計算第 90 百分位數（P90）
  -- 這表示該帳戶 90% 的交易金額都低於這個值
  -- 語法：APPROX_QUANTILES(欄位, 百分位切分數)[OFFSET(n)]
  -- OFFSET(90) = 第 90 百分位
  APPROX_QUANTILES(Amount, 100)[OFFSET(90)] AS p90_amount

FROM `saml_d.aml_transactions`  -- 資料來源表格

-- 對每個帳戶分組，計算個別的 P90 值
GROUP BY Sender_account

-- 將結果依 P90 金額由高到低排序
-- 有助於找出金額異常上限特別高的帳戶（高風險）
ORDER BY p90_amount DESC;
