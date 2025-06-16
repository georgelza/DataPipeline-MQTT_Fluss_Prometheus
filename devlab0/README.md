## Environment configuration and deployment

See the master <root>/`README.md` file for the basic downloading of all the containers and library/jar files and building various containers images used and then see the "Run the stack" lower down.


### To test the stack see:  ->  Create Catalogs

To test the stack see:

it starts with creating a base catalogs, we have 2, `hive_catalog` and `fluss_catalog`.

Inside the `hive_catalog` we have 2 databases, `mqtt` and `prometheus`, inside the `fluss_catalog` we have a single database called `fluss`.

This catalog is created inside Flink, referencing the fluss `bootstrap.servers` which creates the link between the Fluss and Flink environments.

[Manually testing stack](https://alibaba.github.io/fluss-docs/docs/engine-flink/getting-started/#preparation-when-using-flink-sql-client)

```
CREATE CATALOG fluss_catalog WITH (
    'type'              = 'fluss',
    'bootstrap.servers' = 'coordinator-server:9123'
);
```


### Variables and Variables and Variables...

There is sadly no easy way to do this as this is not a small stack, of a single product.

- This blog is dependant on the MQTT source connector, as such first navigate to [MQTT-Flink-Source-connector](https://github.com/georgelza/MQTT-Flink-Source-connector), download and build.
- Then copy the mqtt* jar files located in <root>/mqtt-job/target and <root>/mqtt-source/target to this projects <root>/devlab0/conf/flink/lib/flink dorectory. Ok, Now we can continue

- Start by going into `conf` directory and see the various files there.

- Followed by the `.env` file and then the docker-compose file.

- Also take note of the `configs` section in the `docker-compose.yml` file. These files are mapped into the various services.


### Flink configuration variables.

See the `docker-compose.yaml` file for the various variables passed into the Flink containers.

We use a combination of `enviroment:` values and values from files passed in via the `volumes:` section.

Some of them originate out of the `.env` file, for the Hive environment some originate out of the `hive.env` file and some out of `config.yaml`.

You will also find the logging parameter files are specified in the `configs` section and then mapped into the containers in the services.


### Hive site configuration file for Flink usage.

Take note that the flink images are build with `hive-site.xml`.


### PostgreSQL configuration, 

The credentials are sourced from the `.env` file and the start parameters out of `conf/postgresql.conf` & `conf/pg_hba.conf`.


## Run the stack

### Basic last setup steps.

1. cd <root>/devlab0/flink
   
2. make build
   
3. cd <root>/devlab0
   
4. `make run`

5. `make ps`            -> until all stable, give is 20-30 seconds.

6. `make deploy`        -> this will kick off a couple of scripts to create the flink catalogs and databases and various flink tables and jobs.

   1. `make source`     -> This will create our various Flink tables configured using the MQTT connector exposing the data via `hive_catalog.mqtt.<table_name>` table objects.

   2. `make targets`    -> This will create our Fluss `fluss_catalog.fluss.*` tables and our prometheus output `hive_catalog.prometheus.*`
      
   3. `make inserts`    -> This will start the various inserts of data from our source table objects, namely the Kakfa backed Flink Tables.
      
      1. First is the insert into the `fluss_catalog.fluss.*` tables, where we flatten the data. <Fluss currently does not support complex table structures>.
      
      2. Next is the insert into the `hive_catalog.prometheus` target **TSDB**, onto which we can then define a **Prometheus datasource** and build **Grafana** dashboards.

7. `cd <root>`
   
8. `python3 -m venv ./venv`
   
9. `source venv/bin/activate`

10. `pip install --upgrade pip`
    
11. `pip install -r requirements`
    
12. `cd app_iot1`
    
13. `./site1.sh`
    
14. open another termnal window and execute steps 9, 11 and 12 for `app_iot2` and similar for `app_iot3`
    
15. `make lakehouse` -> This will start our lakehouse persisting job, which will move our `fluss_catalog.fluss` tables to the **Apache Paimon** based table located on our **HDFS** stack.


### Our Data Generator's.

1. To run Python container app (1) - North based factories

`make rp1`          -> New Source=>MQTT=>Flink=>FLUSS=>Datalake flow. App 1, **factory_iot** collection
                    -> New Source=>MQTT=>Flink=>Prometheus TSDB

1. Stop app (1)

`make sp1`

3. To run Python container app (2) - South based factories

`make rp2`          -> New Source=>MQTT=>Flink=>FLUSS=>Datalake flow. App 2, **factory_iot** collection
                    -> New Source=>MQTT=>Flink=>Prometheus TSDB

4. Stop app (2)

`make sp2`

5. To run Python container app (3) - East based factories

`make rp3`          -> New Source=>MQTT=>Flink=>FLUSS=>Datalake flow. App 3, **factory_iot** collection
                    -> New Source=>MQTT=>Flink=>Prometheus TSDB

6. Stop app (3)

`make sp3`