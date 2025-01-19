select
      count(*) as failures,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_warn,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_error
    from (
      
    
    

select
    external_ref as unique_field,
    count(*) as n_records

from `RevenueAnalytics`.`AcceptanceReport`
where external_ref is not null
group by external_ref
having count(*) > 1



      
    ) dbt_internal_test