#!/bin/bash

# ************************************************
# ** Add your test configuration here           **
# ************************************************

# ************************************************
# **           SET PENTAHO_JAVA_HOME            ** 
# ************************************************
export PENTAHO_JAVA_HOME="/home/dsander/openJDK/openjdk-11.0.23+9"
echo "- PENTAHO_JAVA_HOME=$PENTAHO_JAVA_HOME"

# ************************************************
# **           SET PATH TO DATA-INTEGRATION     ** 
# ************************************************
export PDI_HOME="/home/dsander/pdi-9.3/data-integration"
echo "- PDI_HOME=$PDI_HOME"

# ************************************************
# **           SET Xms || SET Xmx               ** 
# ************************************************
export PENTAHO_DI_JAVA_OPTIONS="-Xms4096m -Xmx8192m -Dfile.encoding=UTF-8"
echo "- PENTAHO_DI_JAVA_OPTIONS=$PENTAHO_DI_JAVA_OPTIONS"