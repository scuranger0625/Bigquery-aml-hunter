-- 📉 練習 7：每個帳戶最近 5 筆交易金額的變異係數（CV）

SELECT
  Sender_account,
  Time,
  Amount,

  -- 最近 5 筆的平均金額
  ROUND(AVG(Amount) OVER (
    PARTITION BY Sender_account
    ORDER BY Time
    ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
  ), 2) AS avg_amt_5,

  -- 最近 5 筆的標準差
  ROUND(STDDEV(Amount) OVER (
    PARTITION BY Sender_account
    ORDER BY Time
    ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
  ), 2) AS std_amt_5,

  -- 變異係數 = 標準差 / 平均（小心除以 0）
  SAFE_DIVIDE(
    STDDEV(Amount) OVER (
      PARTITION BY Sender_account
      ORDER BY Time
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ),
    AVG(Amount) OVER (
      PARTITION BY Sender_account
      ORDER BY Time
      ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    )
  ) AS cv_amt_5

FROM `saml_d.aml_transactions`

ORDER BY Sender_account, Time;
