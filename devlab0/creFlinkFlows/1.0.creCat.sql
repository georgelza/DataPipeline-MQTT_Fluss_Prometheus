
-- the following commands are executed using the Flink sql-client, this can be executed by running `make fsql` from inside <root>/devlab folder

USE CATALOG default_catalog;

CREATE CATALOG hive_catalog WITH (
  'type'          = 'hive',
  'hive-conf-dir' = './conf/'
);

USE CATALOG hive_catalog;

create database mqtt;
create database prometheus;

#use hive_catalog.mqtt;
#select * from factory_iot_101;

show databases;

USE CATALOG default_catalog;

CREATE CATALOG fluss_catalog WITH (
    'type'              = 'fluss',
    'bootstrap.servers' = 'coordinator-server:9123'
);

USE CATALOG fluss_catalog;

show databases;
