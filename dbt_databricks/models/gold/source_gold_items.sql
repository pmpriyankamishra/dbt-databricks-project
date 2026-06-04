with dedup_query as (
    select 
    *,ROW_NUMBER() OVER (PARTITION BY id ORDER BY updateDate DESC) AS dedupliation_id
    from {{ source('source', 'items') }}
)
select id,name,category,updateDate from dedup_query where dedupliation_id = 1