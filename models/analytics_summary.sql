SELECT 
    ar.external_ref,
    ar.state AS transaction_state,
    ar.amount,
    ar.currency,
    cr.chargeback
FROM {{ source('RevenueAnalytics', 'AcceptanceReport') }} ar
LEFT JOIN {{ source('RevenueAnalytics', 'ChargebackReport') }} cr
ON ar.external_ref = cr.external_ref
WHERE ar.state = 'DECLINED'