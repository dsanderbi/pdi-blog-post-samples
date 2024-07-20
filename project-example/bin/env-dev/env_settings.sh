#!/bin/bash

# ************************************************
# ** Add your local configuration here          **
# ************************************************

# ************************************************
# **           SET PENTAHO_JAVA_HOME            ** 
# ************************************************
export PENTAHO_JAVA_HOME=
echo "- PENTAHO_JAVA_HOME=$PENTAHO_JAVA_HOME"

# ************************************************
# **           SET PATH TO DATA-INTEGRATION     ** 
# ************************************************
export PDI_HOME=
echo "- PDI_HOME=$PDI_HOME"

# ************************************************
# **           SET Xms || SET Xmx               ** 
# ************************************************
export PENTAHO_DI_JAVA_OPTIONS="-Xms4096m -Xmx8192m -Dfile.encoding=UTF-8"
echo "- PENTAHO_DI_JAVA_OPTIONS=$PENTAHO_DI_JAVA_OPTIONS"