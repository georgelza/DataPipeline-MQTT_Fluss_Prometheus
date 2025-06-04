
/*
    Full Potential IoT Payload

    {
        "ts" : 1729312551000,
        "metadata" : {
            "siteId" : 1009,
            "deviceId" : 1042,
            "sensorId" : 10180,
            "unit" : "Psi",
            "ts_human" : "2024-10-02T00:00:00.869Z",
            "location": {
                "latitude": -26.195246, 
                "longitude": 28.034088
            },
            "deviceType" : "Oil Pump",
        },
        "measurement" : 1013.3997
    }

*/


SET 'sql-client.execution.result-mode' = 'tableau';
SET 'parallelism.default' = '2';
SET 'sql-client.verbose' = 'true';
SET 'execution.runtime-mode' = 'streaming';


-- Unnested North Table in Fluss  -> Flat
-- We're ding this per region to cause a more scale out design.

CREATE OR REPLACE TABLE fluss_catalog.fluss.factory_iot_north_unnested (
     ts                 BIGINT
    ,siteId             INTEGER
    ,deviceId           INTEGER
    ,sensorId           INTEGER
    ,unit               STRING
    ,measurement        DOUBLE
    ,partition_month    STRING                  -- must be provided by upstream or insert logic
    ,ts_wm              AS TO_TIMESTAMP_LTZ(ts, 3)
    ,WATERMARK          FOR ts_wm AS ts_wm - INTERVAL '1' MINUTE
) PARTITIONED BY (partition_month) WITH (
     'bucket.num'                        = '3'
    ,'table.datalake.enabled'            = 'true'
    ,'table.auto-partition.time-unit'    = 'MONTH'
    ,'table.auto-partition.num-retention'= '60'
);

-- ,'table.auto-partition.enabled'      = 'true'

-- Add Partitions, 2023/10 ->

ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202309');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202310');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202311');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202312');

ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202401');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202402');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202403');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202404');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202405');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202406');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202407');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202408');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202509');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202410');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202411');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202412');

ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202501');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202502');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202503');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202504');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202505');
ALTER TABLE fluss_catalog.fluss.factory_iot_north_unnested ADD PARTITION (partition_month = '202506');

-- Unnested South Table in Fluss  -> Flat

CREATE OR REPLACE TABLE fluss_catalog.fluss.factory_iot_south_unnested (
     ts                 BIGINT
    ,siteId             INTEGER
    ,deviceId           INTEGER
    ,sensorId           INTEGER
    ,unit               STRING
    ,ts_human           STRING
    ,latitude           DOUBLE
    ,longitude          DOUBLE
    ,measurement        DOUBLE
    ,partition_month    STRING                  -- must be provided by upstream or insert logic
    ,ts_wm              AS TO_TIMESTAMP_LTZ(ts, 3)
    ,WATERMARK          FOR ts_wm AS ts_wm - INTERVAL '1' MINUTE
) PARTITIONED BY (partition_month) WITH (
     'bucket.num'                        = '3'
    ,'table.datalake.enabled'            = 'true'
    ,'table.auto-partition.time-unit'    = 'MONTH'
    ,'table.auto-partition.num-retention'= '60'
);

-- ,'table.auto-partition.enabled'      = 'true'

-- Add Partitions, 2024/10 ->

ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202509');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202410');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202411');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202412');

ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202501');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202502');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202503');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202504');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202505');
ALTER TABLE fluss_catalog.fluss.factory_iot_south_unnested ADD PARTITION (partition_month = '202506');

-- Unnested East Table in Fluss  -> Flat


CREATE OR REPLACE TABLE fluss_catalog.fluss.factory_iot_east_unnested (
     ts                 BIGINT
    ,siteId             INTEGER
    ,deviceId           INTEGER
    ,sensorId           INTEGER
    ,unit               STRING
    ,ts_human           STRING
    ,latitude           DOUBLE
    ,longitude          DOUBLE
    ,deviceType         STRING
    ,measurement        DOUBLE
    ,partition_month    STRING                  -- must be provided by upstream or insert logic
    ,ts_wm              AS TO_TIMESTAMP_LTZ(ts, 3)
    ,WATERMARK          FOR ts_wm AS ts_wm - INTERVAL '1' MINUTE
) PARTITIONED BY (partition_month) WITH (
     'bucket.num'                        = '3'
    ,'table.datalake.enabled'            = 'true'
    ,'table.auto-partition.time-unit'    = 'MONTH'
    ,'table.auto-partition.num-retention'= '60'
);

-- ,'table.auto-partition.enabled'      = 'true'

-- Add Partitions, 2022/06

ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202205');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202206');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202207');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202208');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202209');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202210');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202211');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202212');

ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202301');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202302');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202303');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202304');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202305');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202306');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202307');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202308');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202309');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202310');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202311');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202312');

ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202401');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202402');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202403');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202404');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202405');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202406');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202407');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202408');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202509');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202410');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202411');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202412');

ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202501');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202502');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202503');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202504');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202505');
ALTER TABLE fluss_catalog.fluss.factory_iot_east_unnested ADD PARTITION (partition_month = '202506');