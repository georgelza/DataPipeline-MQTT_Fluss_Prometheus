#!/bin/bash

. ./.pws

# Do we want to run the historic loop.
export RUNHISTORIC=0

### MQTT Broker information -> see .pws
export MQTT_BROKER_HOST=localhost
export MQTT_BROKER_PORT=1885
export MQTT_CLIENTTAG=factory_east
export MQTT_TOPIC=factory_iot/east

# One by One or multi mode
export MODE=0
# if Mode=1 then specify batch size
export BATCH_SIZE=1

# This is used in app4d, see the README.md for more information
export TIMESTAMP_FIELD=timestamp
export METADATA_FIELD=metadata
export RETENSION_LEVEL=seconds


# Debug Levels:
# 0 Debug       -> Allot of information will be printed, including printing site configuration to logfile.
# 1 Info        -> We just printing that processes is starting/ending
# 2 Warning     -> Will decide
# 3 Error       -> used in any try/except block
# 4 Critical    -> used when we going to kill the programm.

# Console Handler
export CONSOLE_DEBUGLEVEL=0
# File Handler
export FILE_DEBUGLEVEL=0

# Irrespective of debug level, lets control if we want to echo the entire seedfile or not.
export ECHOSEEDFILE=0
export SEEDFILE=conf/Full.json
export SITEIDS=103,106

export LOGDIR=logs
export LOGGINGFILE=logger_east

# TSHUMAN adds when 1 a human readable timestamp to the metadata sub tag
# STRUCMOD adds when 1 a location base on longitude and latitude to the metadata sub tag
# DEVICETYPE adds the deviceType value from the device definision from the full.json file

export TSHUMAN=1
export STRUCTMOD=1
export DEVICETYPE=1

python3 ../app_iot1/main.py
