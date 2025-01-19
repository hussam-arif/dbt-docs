
    
    

select
    external_ref as unique_field,
    count(*) as n_records

from `RevenueAnalytics`.`ChargebackReport`
where external_ref is not null
group by external_ref
having count(*) > 1


