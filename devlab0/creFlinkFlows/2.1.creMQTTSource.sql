

CREATE OR REPLACE TABLE hive_catalog.mqtt.factory_iot_101 (
    ts          BIGINT,
    metadata    ROW<
        siteId      INTEGER,
        deviceId    INTEGER,
        sensorId    INTEGER,
        unit        STRING,
        ts_human    STRING,
        location ROW<
            latitude    DOUBLE,
            longitude   DOUBLE>,
        deviceType  STRING>,
    measurement DOUBLE,
    ts_WM AS TO_TIMESTAMP(FROM_UNIXTIME(CAST(`ts` AS BIGINT) / 1000)),
    WATERMARK FOR ts_WM AS ts_WM
) WITH (
     'connector'            = 'mqtt'
    ,'broker.host'          = 'broker_north'                -- Example: your MQTT broker's hostname or IP
    ,'broker.port'          = '1883'                        -- Example: your MQTT broker's port (1883 for non-SSL)
    ,'topic'                = 'factory_iot/north/101'
    ,'format'               = 'json'
    ,'client.id'            = 'flink_iot_north_101_consumer'
    ,'qos'                  = '1'                           -- QoS, 0, 1 or 2
    ,'username'             = 'mqtt_dev'
    ,'password'             = 'abfr24'
    ,'automatic-reconnect'  = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'clean-session'        = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'ssl'                  = 'false'                       -- Set to 'true' if using SSL and configure below
);


CREATE OR REPLACE TABLE hive_catalog.mqtt.factory_iot_102 (
    ts          BIGINT,
    metadata    ROW<
        siteId      INTEGER,
        deviceId    INTEGER,
        sensorId    INTEGER,
        unit        STRING,
        ts_human    STRING,
        location ROW<
            latitude    DOUBLE,
            longitude   DOUBLE>,
        deviceType STRING>,
    measurement DOUBLE,
    ts_WM as TO_TIMESTAMP(FROM_UNIXTIME(CAST(`ts` AS BIGINT) / 1000)),
    WATERMARK FOR ts_WM AS ts_WM
) WITH (
     'connector'            = 'mqtt'
    ,'broker.host'          = 'broker_south'                -- Example: your MQTT broker's hostname or IP
    ,'broker.port'          = '1883'                        -- Example: your MQTT broker's port (1883 for non-SSL)
    ,'topic'                = 'factory_iot/south/102'
    ,'format'               = 'json'
    ,'client.id'            = 'flink_iot_south_102_consumer'
    ,'qos'                  = '1'                           -- QoS, 0, 1 or 2
    ,'username'             = 'mqtt_dev'
    ,'password'             = 'abfr24'
    ,'automatic-reconnect'  = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'clean-session'        = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'ssl'                  = 'false'                       -- Set to 'true' if using SSL and configure below
);


CREATE OR REPLACE TABLE hive_catalog.mqtt.factory_iot_103 (
    ts          BIGINT,
    metadata    ROW<
        siteId      INTEGER,
        deviceId    INTEGER,
        sensorId    INTEGER,
        unit        STRING,
        ts_human    STRING,
        location ROW<
            latitude    DOUBLE,
            longitude   DOUBLE>,
        deviceType STRING>,
    measurement DOUBLE,
    ts_WM as TO_TIMESTAMP(FROM_UNIXTIME(CAST(`ts` AS BIGINT) / 1000)),
    WATERMARK FOR ts_WM AS ts_WM
) WITH (
     'connector'            = 'mqtt'
    ,'broker.host'          = 'broker_east'                 -- Example: your MQTT broker's hostname or IP
    ,'broker.port'          = '1883'                        -- Example: your MQTT broker's port (1883 for non-SSL)
    ,'topic'                = 'factory_iot/east/103'
    ,'format'               = 'json'
    ,'client.id'            = 'flink_iot_east_103_consumer'
    ,'qos'                  = '1'                           -- QoS, 0, 1 or 2
    ,'username'             = 'mqtt_dev'
    ,'password'             = 'abfr24'
    ,'automatic-reconnect'  = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'clean-session'        = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'ssl'                  = 'false'                       -- Set to 'true' if using SSL and configure below
);



CREATE OR REPLACE TABLE hive_catalog.mqtt.factory_iot_104 (
    ts          BIGINT,
    metadata    ROW<
        siteId      INTEGER,
        deviceId    INTEGER,
        sensorId    INTEGER,
        unit        STRING,
        ts_human    STRING,
        location ROW<
            latitude    DOUBLE,
            longitude   DOUBLE>,
        deviceType STRING>,
    measurement DOUBLE,
    ts_WM as TO_TIMESTAMP(FROM_UNIXTIME(CAST(`ts` AS BIGINT) / 1000)),
    WATERMARK FOR ts_WM AS ts_WM
) WITH (
     'connector'            = 'mqtt'
    ,'broker.host'          = 'broker_north'                -- Example: your MQTT broker's hostname or IP
    ,'broker.port'          = '1883'                        -- Example: your MQTT broker's port (1883 for non-SSL)
    ,'topic'                = 'factory_iot/north/104'
    ,'format'               = 'json'
    ,'client.id'            = 'flink_iot_north_104_consumer'
    ,'qos'                  = '1'                           -- QoS, 0, 1 or 2
    ,'username'             = 'mqtt_dev'
    ,'password'             = 'abfr24'
    ,'automatic-reconnect'  = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'clean-session'        = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'ssl'                  = 'false'                       -- Set to 'true' if using SSL and configure below
);



CREATE OR REPLACE TABLE hive_catalog.mqtt.factory_iot_105 (
    ts          BIGINT,
    metadata    ROW<
        siteId      INTEGER,
        deviceId    INTEGER,
        sensorId    INTEGER,
        unit        STRING,
        ts_human    STRING,
        location ROW<
            latitude    DOUBLE,
            longitude   DOUBLE>,
        deviceType STRING>,
    measurement DOUBLE,
    ts_WM as TO_TIMESTAMP(FROM_UNIXTIME(CAST(`ts` AS BIGINT) / 1000)),
    WATERMARK FOR ts_WM AS ts_WM
) WITH (
     'connector'            = 'mqtt'
    ,'broker.host'          = 'broker_south'                -- Example: your MQTT broker's hostname or IP
    ,'broker.port'          = '1883'                        -- Example: your MQTT broker's port (1883 for non-SSL)
    ,'topic'                = 'factory_iot/south/105'
    ,'format'               = 'json'
    ,'client.id'            = 'flink_iot_south_105_consumer'
    ,'qos'                  = '1'                           -- QoS, 0, 1 or 2
    ,'username'             = 'mqtt_dev'
    ,'password'             = 'abfr24'
    ,'automatic-reconnect'  = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'clean-session'        = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'ssl'                  = 'false'                       -- Set to 'true' if using SSL and configure below
);



CREATE OR REPLACE TABLE hive_catalog.mqtt.factory_iot_106 (
    ts          BIGINT,
    metadata    ROW<
        siteId      INTEGER,
        deviceId    INTEGER,
        sensorId    INTEGER,
        unit        STRING,
        ts_human    STRING,
        location ROW<
            latitude    DOUBLE,
            longitude   DOUBLE>,
        deviceType STRING>,
    measurement DOUBLE,
    ts_WM as TO_TIMESTAMP(FROM_UNIXTIME(CAST(`ts` AS BIGINT) / 1000)),
    WATERMARK FOR ts_WM AS ts_WM
) WITH (
     'connector'            = 'mqtt'
    ,'broker.host'          = 'broker_east'                -- Example: your MQTT broker's hostname or IP
    ,'broker.port'          = '1883'                        -- Example: your MQTT broker's port (1883 for non-SSL)
    ,'topic'                = 'factory_iot/east/106'
    ,'format'               = 'json'
    ,'client.id'            = 'flink_iot_east_106_consumer'
    ,'qos'                  = '1'                           -- QoS, 0, 1 or 2
    ,'username'             = 'mqtt_dev'
    ,'password'             = 'abfr24'
    ,'automatic-reconnect'  = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'clean-session'        = 'true'                        -- Valid boolean value ('true' or 'false')
    ,'ssl'                  = 'false'                       -- Set to 'true' if using SSL and configure below
);



