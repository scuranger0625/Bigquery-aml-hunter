-- 📄 練習 2：條件查詢 - 篩選出所有洗錢交易
-- 說明：從交易紀錄中選出 Is_laundering 為 TRUE 的交易（欄位是 INT64，不是 BOOL）
SELECT *
FROM `saml_d.aml_transactions`
WHERE Is_laundering = 1;


-- ----------------------------------------------

-- 📄 練習 3：排序查詢 - 金額最大的前 10 筆交易
-- 說明：觀察最高金額的交易記錄，找出可能的可疑交易
SELECT *
FROM `saml_d.aml_transactions`
ORDER BY Amount DESC
LIMIT 10;

-- ----------------------------------------------

-- 📄 練習 4：群組統計 - 各付款方式的交易筆數
-- 說明：統計每種 Payment_type 的交易數量，觀察使用頻率
SELECT Payment_type, COUNT(*) AS tx_count
FROM `saml_d.aml_transactions`
GROUP BY Payment_type
ORDER BY tx_count DESC;
