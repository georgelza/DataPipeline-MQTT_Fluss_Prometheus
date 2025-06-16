

SET 'parallelism.default'    = '2';
SET 'sql-client.verbose'     = 'true';
SET 'execution.runtime-mode' = 'streaming';


--- Push Data to Prometheus ---

SET 'pipeline.name' = 'Push North 101 metrics to factory_iot_unnested';

INSERT INTO fluss_catalog.fluss.factory_iot_unnested
(ts, siteId, deviceId, sensorId, unit, ts_human, longitude, latitude, deviceType, measurement, partition_month)
SELECT
     ts                                                 AS ts
    ,metadata.siteId                                    AS siteId
    ,metadata.deviceId                                  AS deviceId
    ,metadata.sensorId                                  AS sensorId
    ,metadata.unit                                      AS unit
    ,CAST(NULL AS STRING)                               AS ts_human
    ,CAST(NULL AS DOUBLE)                               AS longitude
    ,CAST(NULL AS DOUBLE)                               AS latitude   
    ,CAST(NULL AS STRING)                               AS deviceType
    ,measurement                                        AS measurement
    ,DATE_FORMAT(TO_TIMESTAMP_LTZ(ts, 3), 'yyyyMM')     AS partition_month
FROM hive_catalog.mqtt.factory_iot_101;


SET 'pipeline.name' = 'Push South 102 metrics to factory_iot_unnested';

INSERT INTO fluss_catalog.fluss.factory_iot_unnested
(ts, siteId, deviceId, sensorId, unit, ts_human, longitude, latitude, deviceType, measurement, partition_month)
SELECT
     ts                                             AS ts
    ,metadata.siteId                                AS siteId
    ,metadata.deviceId                              AS deviceId
    ,metadata.sensorId                              AS sensorId
    ,metadata.unit                                  AS unit
    ,metadata.ts_human                              AS ts_human
    ,metadata.location.longitude                    AS longitude
    ,metadata.location.latitude                     AS latitude    
    ,CAST(NULL AS STRING)                           AS deviceType
    ,measurement                                    AS measurement
    ,DATE_FORMAT(TO_TIMESTAMP_LTZ(ts, 3), 'yyyyMM') AS partition_month
FROM hive_catalog.mqtt.factory_iot_102;


SET 'pipeline.name' = 'Push East 103 metrics to factory_iot_unnested';

INSERT INTO fluss_catalog.fluss.factory_iot_unnested
(ts, siteId, deviceId, sensorId, unit, ts_human, longitude, latitude, deviceType, measurement, partition_month)
SELECT
     ts                                             AS ts
    ,metadata.siteId                                AS siteId
    ,metadata.deviceId                              AS deviceId
    ,metadata.sensorId                              AS sensorId
    ,metadata.unit                                  AS unit
    ,metadata.ts_human                              AS ts_human
    ,metadata.location.longitude                    AS longitude
    ,metadata.location.latitude                     AS latitude    
    ,metadata.deviceType                            AS deviceType
    ,measurement                                    AS measurement
    ,DATE_FORMAT(TO_TIMESTAMP_LTZ(ts, 3), 'yyyyMM') AS partition_month
FROM hive_catalog.mqtt.factory_iot_103;


SET 'pipeline.name' = 'Push North 104 metrics to factory_iot_unnested';

INSERT INTO fluss_catalog.fluss.factory_iot_unnested
(ts, siteId, deviceId, sensorId, unit, ts_human, longitude, latitude, deviceType, measurement, partition_month)
SELECT
     ts                                             AS ts
    ,metadata.siteId                                AS siteId
    ,metadata.deviceId                              AS deviceId
    ,metadata.sensorId                              AS sensorId
    ,metadata.unit                                  AS unit
    ,metadata.ts_human                              AS ts_human
    ,metadata.location.longitude                    AS longitude
    ,metadata.location.latitude                     AS latitude    
    ,metadata.deviceType                            AS deviceType
    ,measurement                                    AS measurement
    ,DATE_FORMAT(TO_TIMESTAMP_LTZ(ts, 3), 'yyyyMM') AS partition_month
FROM hive_catalog.mqtt.factory_iot_104;


SET 'pipeline.name' = 'Push South 105 metrics to factory_iot_unnested';

INSERT INTO fluss_catalog.fluss.factory_iot_unnested
(ts, siteId, deviceId, sensorId, unit, ts_human, longitude, latitude, deviceType, measurement, partition_month)
SELECT
     ts                                             AS ts
    ,metadata.siteId                                AS siteId
    ,metadata.deviceId                              AS deviceId
    ,metadata.sensorId                              AS sensorId
    ,metadata.unit                                  AS unit
    ,metadata.ts_human                              AS ts_human
    ,metadata.location.longitude                    AS longitude
    ,metadata.location.latitude                     AS latitude    
    ,metadata.deviceType                            AS deviceType
    ,measurement                                    AS measurement
    ,DATE_FORMAT(TO_TIMESTAMP_LTZ(ts, 3), 'yyyyMM') AS partition_month
FROM hive_catalog.mqtt.factory_iot_105;


SET 'pipeline.name' = 'Push East 106 metrics to factory_iot_unnested';

INSERT INTO fluss_catalog.fluss.factory_iot_unnested
(ts, siteId, deviceId, sensorId, unit, ts_human, longitude, latitude, deviceType, measurement, partition_month)
SELECT
     ts                                             AS ts
    ,metadata.siteId                                AS siteId
    ,metadata.deviceId                              AS deviceId
    ,metadata.sensorId                              AS sensorId
    ,metadata.unit                                  AS unit
    ,metadata.ts_human                              AS ts_human
    ,metadata.location.longitude                    AS longitude
    ,metadata.location.latitude                     AS latitude    
    ,metadata.deviceType                            AS deviceType
    ,measurement                                    AS measurement
    ,DATE_FORMAT(TO_TIMESTAMP_LTZ(ts, 3), 'yyyyMM') AS partition_month
FROM hive_catalog.mqtt.factory_iot_106;