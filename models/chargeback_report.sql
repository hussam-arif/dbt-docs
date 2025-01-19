SELECT *
FROM {{ source('RevenueAnalytics', 'ChargebackReport') }}