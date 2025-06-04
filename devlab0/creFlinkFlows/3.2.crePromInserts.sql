

SET 'sql-client.execution.result-mode' = 'tableau';
SET 'parallelism.default' = '2';
SET 'sql-client.verbose' = 'true';
SET 'execution.runtime-mode' = 'streaming';


--- Push Data to Prometheus ---

SET 'pipeline.name' = 'Push North metrics to PromTable';

INSERT INTO hive_catalog.prometheus.PromTable
SELECT
     CAST(sensorId AS "STRING")     AS sensorId
    ,CAST(siteId AS "STRING")       AS siteId
    ,CAST(deviceId AS "STRING")     AS deviceId
    ,measurement                    AS measurement
    ,ts_wm                          AS ts
FROM fluss_catalog.fluss.factory_iot_north_unnested;

-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 60, TIMESTAMP '2025-05-12 12:21:00.000');
