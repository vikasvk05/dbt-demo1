
-- {{ config(alias='sessions') }}

{{ config(
    materialized="incremental",
    partition_by={
      "field": "dt",
      "data_type": "date"
    }
) }}

-- SELECT * FROM `learning-gcp-self-test.Leaning_bq.us_emp_data`


-- Query using jinja template --

with source as (

    select * from {{ source('learning', 'customer1') }}
)
select 
    *
from source --where dt='2023-04-22'