-- https://github.com/apache/flink-connector-prometheus/pull/22


-- Flink SQL> CREATE TABLE PromTable (
--    `my_metric_name` STRING,
--    `my_label_1` STRING,
--    `my_label_2` STRING,
--    `sample_value` BIGINT,
--    `sample_ts` TIMESTAMP(3)
-- ) WITH (
--    'connector' = 'prometheus',
--    'metric.endpoint-url' = 'https://aps-workspaces.us-east-1.amazonaws.com/workspaces/redacted/api/v1/remote_write',
--    'metric.name' = 'my_metric_name',
--    'metric.label.keys' = '[my_label_1,my_label_2]',
--    'metric.sample.key' = 'sample_value',
--    'metric.sample.timestamp' = 'sample_ts'
-- );


SET 'sql-client.execution.result-mode' = 'tableau';
SET 'parallelism.default' = '2';
SET 'sql-client.verbose' = 'true';
SET 'execution.runtime-mode' = 'streaming';

CREATE TABLE hive_catalog.prometheus.PromTable (
   sensorid         STRING,
   siteId           STRING,
   deviceId         STRING,
   measurement      BIGINT,
   ts               TIMESTAMP(3)
 )
 WITH (
   'connector'               = 'prometheus',
   'metric.endpoint-url'     = 'prometheus:9090/api/v1/write',
   'metric.name'             = 'sensorid',
   'metric.label.keys'       = '[siteId,deviceId]',
   'metric.sample.key'       = 'measurement',
   'metric.sample.timestamp' = 'ts'
 );

-- Test:
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 60, TIMESTAMP '2025-05-12 12:21:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 62, TIMESTAMP '2025-05-12 12:22:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 64, TIMESTAMP '2025-05-12 12:23:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 63, TIMESTAMP '2025-05-12 12:24:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 64, TIMESTAMP '2025-05-12 12:25:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 65, TIMESTAMP '2025-05-12 12:26:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 66, TIMESTAMP '2025-05-12 12:27:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 65, TIMESTAMP '2025-05-12 12:28:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 64, TIMESTAMP '2025-05-12 12:29:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 63, TIMESTAMP '2025-05-12 12:30:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 63, TIMESTAMP '2025-05-12 12:31:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 62, TIMESTAMP '2025-05-12 12:32:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 62, TIMESTAMP '2025-05-12 12:33:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 60, TIMESTAMP '2025-05-12 12:34:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 58, TIMESTAMP '2025-05-12 12:35:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 57, TIMESTAMP '2025-05-12 12:36:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 57, TIMESTAMP '2025-05-12 12:37:00.000');
-- INSERT INTO hive_catalog.prometheus.PromTable VALUES ('10221', '101', '1031', 58, TIMESTAMP '2025-05-12 12:38:00.000');


CREATE TABLE hive_catalog.prometheus.factory_iot_south (
   sensorid         STRING,
   siteId           STRING,
   deviceId         STRING,
   deviceType       STRING,
   measurement      BIGINT,
   ts               TIMESTAMP(3)
 )
 WITH (
   'connector'               = 'prometheus',
   'metric.endpoint-url'     = 'prometheus:9090/api/v1/write',
   'metric.name'             = 'sensorid',
   'metric.label.keys'       = '[siteId,deviceId,deviceType]',
   'metric.sample.key'       = 'measurement',
   'metric.sample.timestamp' = 'ts'
 );