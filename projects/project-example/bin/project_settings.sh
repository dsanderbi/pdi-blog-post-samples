#!/bin/bash

# ************************************************
# **           SET CURRENT_DIR                  ** 
# ************************************************
CURRENT_DIR=$(pwd)
echo "- CURRENT_DIR=$CURRENT_DIR"

# ************************************************
# **           SET PROJECT_HOME                 ** 
# ************************************************
export PROJECT_HOME=$(dirname "$CURRENT_DIR")
echo "- PROJECT_HOME=$PROJECT_HOME"

# ************************************************
# **           SET OPT                          ** 
# ************************************************
export OPT="$OPT -DPROJECT_HOME=$PROJECT_HOME"
echo "- OPT=$OPT"

# ************************************************
# **           SET KETTLE_HOME                  ** 
# ************************************************
export KETTLE_HOME="$PROJECT_HOME/config/$env"
echo "- KETTLE_HOME=$KETTLE_HOME"

# ************************************************
# **           SET TIMESTAMP                    ** 
# ************************************************
# Get the date in YYYYMMDD format
datestamp=$(date +%Y%m%d)
# Get the time in HHMMSS format
timestamp=$(date +%H%M%S)
# Combine date and time
TIMESTAMP="${datestamp}_${timestamp}"

# ************************************************
# **           SET LOGS_FOLDER                  ** 
# ************************************************
export LOGS_FOLDER="$PROJECT_HOME/logs"
mkdir -p "$LOGS_FOLDER"
mkdir -p "$LOGS_FOLDER/config_archive/config_$TIMESTAMP"

# ************************************************
# **           BACKUP CONFIGURATION             ** 
# ************************************************
cp -r "$PROJECT_HOME/config" "$LOGS_FOLDER/config_archive/config_$TIMESTAMP"
