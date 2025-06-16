.DEFAULT_GOAL := help
include ../.env

VERSION=1.0.0
HADOOP_VERSION=3.3.5-java11


define HELP

Based on Ubuntu 24.04 / OpenJDK 11 / Apache Hadoop 3.3.8

Available commands:

- buildhadoopbase: Build the base image project

- buildhdfsbase: Build this project

- build: Build above 2, the completes project

- run: Run the project

- stop: Stop the project

- down: Stop and remove the project

- logs: Show the logs

- ps: Show the status

endef

export HELP
help:
	@echo "$$HELP"
.PHONY: help

buildhadoopbase: 
	docker build --build-arg REPO_NAME=${REPO_NAME} -t ${REPO_NAME}/hadoop-base-$(HADOOP_VERSION):$(VERSION) ./base --no-cache 

buildhdfsbase:
	docker build --build-arg REPO_NAME=${REPO_NAME} -t ${REPO_NAME}/hadoop-namenode-$(HADOOP_VERSION):$(VERSION) ./namenode --no-cache 
	docker build --build-arg REPO_NAME=${REPO_NAME} -t ${REPO_NAME}/hadoop-datanode-$(HADOOP_VERSION):$(VERSION) ./datanode --no-cache 
	docker build --build-arg REPO_NAME=${REPO_NAME} -t ${REPO_NAME}/hadoop-resourcemanager-$(HADOOP_VERSION):$(VERSION) ./resourcemanager --no-cache 
	docker build --build-arg REPO_NAME=${REPO_NAME} -t ${REPO_NAME}/hadoop-nodemanager-$(HADOOP_VERSION):$(VERSION) ./nodemanager --no-cache 
	docker build --build-arg REPO_NAME=${REPO_NAME} -t ${REPO_NAME}/hadoop-historyserver-$(HADOOP_VERSION):$(VERSION) ./historyserver --no-cache 

build: buildhadoopbase buildhdfsbase

run:
	docker compose -p devlab up -d

stop:
	docker compose stop

down:
	docker compose down

logs:
	docker compose logs

ps:
	docker compose ps