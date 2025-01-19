SELECT *
FROM {{ source('RevenueAnalytics', 'AcceptanceReport') }}