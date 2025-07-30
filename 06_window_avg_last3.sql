-- 🔁 練習 6：每個帳戶最近 3 筆交易的平均金額
SELECT
  Sender_account,  -- 交易來源帳戶
  Time,            -- 交易時間（用來排序）
  Amount,          -- 原始金額

  -- 使用 Window Function 計算該帳戶在這筆交易之前的 2 筆 + 自己的平均
  ROUND(AVG(Amount) OVER (
    PARTITION BY Sender_account          -- 對每個帳戶分組
    ORDER BY Time                        -- 根據交易時間排序
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW  -- 滑動視窗：包含目前這筆與之前兩筆
  ), 2) AS avg_amount_last_3

FROM `saml_d.aml_transactions`

ORDER BY Sender_account, Time;
