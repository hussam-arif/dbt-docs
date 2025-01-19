
  create view `revenueanalytics`.`analytics_summary__dbt_tmp`
    
    
  as (
    SELECT 
    ar.external_ref,
    ar.state AS transaction_state,
    ar.amount,
    ar.currency,
    cr.chargeback
FROM `RevenueAnalytics`.`AcceptanceReport` ar
LEFT JOIN `RevenueAnalytics`.`ChargebackReport` cr
ON ar.external_ref = cr.external_ref
WHERE ar.state = 'DECLINED'
  );