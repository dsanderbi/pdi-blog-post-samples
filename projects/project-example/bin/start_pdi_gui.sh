#!/bin/bash

# Set the default environment to 'dev' if no parameter is passed
if [ -z "$1" ]; then
    env="dev"
else
    env="$1"
fi

# Check if the parameter is valid
if [[ "$env" != "dev" && "$env" != "test" && "$env" != "prod" ]]; then
    echo "Value not valid, use dev, test or prod!"
    exit 1
fi

echo "Start PDI-GUI with $env settings."
# ************************************************
# **           CALL PROJECT SETTINGS            ** 
# ************************************************
. ./project_settings.sh

# ************************************************
# **           CALL ENV SETTINGS                ** 
# ************************************************
. ./env-$env/env_settings.sh

# ************************************************
# **           CALL PDI-GUI                     ** 
# ************************************************
sh $PDI_HOME/spoon.sh $OPT "$@"