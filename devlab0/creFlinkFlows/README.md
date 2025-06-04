
# Data Flows

1. 1.creCat.sql

    Will create the Hive & Fluss catalog.

    - hive_catalog
    - iot database inside hive_catalog
    - prometheus database inside hive_catalog
    - fluss_catalog

2. 2.creSource.sql

    - Create 2 flink tables, sourced using kafka connector from 3 x topics.
    - Create for each table above an unnested version.
    - populated unnested target table with data from source.

3.  3.1.crePromTarget.sql

    - Create one target table used to sink to prometheus
    - Create 3 insert jobs, sourced from the 3 unnested tables, inserting into prometheus target
  
4.  3.2.creFlussTarget.sql

    Create our Fluss Target tables
    Execute the insert jobs, seleccting from hive source tables (nested and unnested versions).

5. 4.runLakehouse.bsh
 
   Initiate ./bin/lakehouse.sh sync script, this is the job that moves our data from Fluss tables on the tablet servers down to the configured lakehouse persistent storage.



## Fluss SQL/Partitioning examples 

### Primary key and log based tables, manual and auto partitioned.

Notes 

- re Primary Key and Log based tables, partitioned and not, using auto or manual partition adding.
- The Partitioned by (<VALUE>) must be a STRING.
- The <VALUE> can also not be calculated as part of the create table, hint, calculate the value in the insert statement.
  
-- Basic PK Table
```sql
CREATE TABLE my_pk_table (
  shop_id BIGINT,
  user_id BIGINT,
  num_orders INT,
  total_amount INT,
  PRIMARY KEY (shop_id, user_id) NOT ENFORCED
) WITH (
  'bucket.num' = '4'
);

-- Partitioned PK Table
CREATE TABLE my_part_pk_table (
  dt STRING,
  shop_id BIGINT,
  user_id BIGINT,
  num_orders INT,
  total_amount INT,
  PRIMARY KEY (dt, shop_id, user_id) NOT ENFORCED
) PARTITIONED BY (dt);

-- Add Partitions, or
ALTER TABLE my_part_pk_table ADD PARTITION (dt = '2025-03-05');
-- or
ALTER TABLE my_part_pk_table ADD PARTITION (dt = '20250305');  -- if format = yyyyMMdd


-- Auto Partitioned PK Table
CREATE TABLE my_auto_part_pk_table (
  dt STRING,
  shop_id BIGINT,
  user_id BIGINT,
  num_orders INT,
  total_amount INT,
  PRIMARY KEY (dt, shop_id, user_id) NOT ENFORCED
) PARTITIONED BY (dt) WITH (
  'bucket.num' = '4',
  'table.auto-partition.enabled' = 'true',
  'table.auto-partition.time-unit' = 'day'
);

-- Basic Log Table
CREATE TABLE my_log_table (
  order_id BIGINT,
  item_id BIGINT,
  amount INT,
  address STRING
) WITH (
  'bucket.num' = '8'
);

-- Partitioned Log table
CREATE TABLE my_part_log_table (
  order_id BIGINT,
  item_id BIGINT,
  amount INT,
  address STRING,
  dt STRING
) PARTITIONED BY (dt);

-- Add Partitions, or
ALTER TABLE my_part_log_table ADD PARTITION (dt = '2025-03-05');

-- Auto Partitioned Log Table
CREATE TABLE my_auto_part_log_table (
  order_id BIGINT,
  item_id BIGINT,
  amount INT,
  address STRING,
  dt STRING
) PARTITIONED BY (dt) WITH (
  'bucket.num' = '8',
  'table.auto-partition.enabled' = 'true',
  'table.auto-partition.time-unit' = 'hour'
);

-- Show/Display partitions for a table
SHOW PARTITIONS my_part_pk_table;
SHOW PARTITIONS my_auto_part_pk_table;
SHOW PARTITIONS my_part_log_table;
SHOW PARTITIONS my_auto_part_log_table;


-- to pipeline the data to lakehouse add the following to the create table.ABORT
'table.datalake.enabled' = 'true'
```
