#!/bin/bash

# Check environment parameter
if [ -z "$1" ]; then
    env="prod"
else
    env="$1"
fi

# Check if the parameter is valid
if [[ "$env" != "dev" && "$env" != "test" && "$env" != "prod" ]]; then
    echo "Value not valid, use dev, test or prod!"
    exit 1
fi

# Check log level parameter
if [ -z "$2" ]; then
    LOG_LEVEL="Minimal"
else
    LOG_LEVEL="$2"
fi

echo "Start Job with $env settings and log level $LOG_LEVEL."

# ************************************************
# **           CALL PROJECT SETTINGS            ** 
# ************************************************
. ./project_settings.sh

# ************************************************
# **           CALL ENV SETTINGS                ** 
# ************************************************
. ./env-"$env"/env_settings.sh

# ************************************************
# **           CALL KITCHEN                     ** 
# ************************************************
"$PDI_HOME/kitchen.sh" -file="$PROJECT_HOME/main/jobs/main.kjb" -level="$LOG_LEVEL" "$OPT" >> "$PROJECT_HOME/logs/main_$TIMESTAMP.log" 2>&1