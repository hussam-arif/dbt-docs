
  create view `revenueanalytics`.`acceptance_report__dbt_tmp`
    
    
  as (
    SELECT 
    external_ref,
    state,
    CASE 
        WHEN currency = 'MXN' THEN amount / JSON_EXTRACT(rates, '$.MXN')
        WHEN currency = 'CAD' THEN amount / JSON_EXTRACT(rates, '$.CAD')
        WHEN currency = 'EUR' THEN amount / JSON_EXTRACT(rates, '$.EUR')
        WHEN currency = 'SGD' THEN amount / JSON_EXTRACT(rates, '$.SGD')
        WHEN currency = 'AUD' THEN amount / JSON_EXTRACT(rates, '$.AUD')
        WHEN currency = 'GBP' THEN amount / JSON_EXTRACT(rates, '$.GBP')
        ELSE amount / JSON_EXTRACT(rates, '$.USD') -- Default to USD
    END AS amount_usd,
    currency,
    DATE_FORMAT(STR_TO_DATE(date_time, '%Y-%m-%dT%H:%i:%sZ'), '%Y-%m-%d %H:%i:%s') AS date_time
FROM `RevenueAnalytics`.`AcceptanceReport`
  );