ARG REPO_NAME="georgelza"

FROM ${REPO_NAME}/apacheflink-base:1.20.1-scala_2.12-java17
SHELL ["/bin/bash", "-c"]

ENV FLINK_HOME=/opt/flink
ENV HIVE_HOME=$FLINK_HOME/conf/
RUN mkdir -p /opt/flink/conf/
RUN mkdir -p /opt/flink/checkpoints
RUN mkdir -p /opt/flink/rocksdb
RUN mkdir -p /opt/sql-client/conf/

# this is where we have flink itself installed.
WORKDIR /opt/flink

RUN echo "--> Install JARs: Flink's S3 plugin" && \
    mkdir ./plugins/s3-fs-hadoop && \
    mv ./opt/flink-s3-fs-hadoop-1.20.1.jar ./plugins/s3-fs-hadoop/

# /usr/local/lib/python3.10/dist-packages/jupyterlab
# Install JARs
# See https://repo.maven.apache.org/maven2/org/apache/flink/


RUN chown -R flink:flink /opt/flink
RUN chown -R flink:flink /opt/sql-client

CMD ./bin/start-cluster.sh && sleep infinity

USER flink:flink
