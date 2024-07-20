@echo off

rem ************************************************
rem ** Add your local configuration here          **
rem ************************************************

rem ************************************************
rem **           SET PENTAHO_JAVA_HOME            ** 
rem ************************************************
set PENTAHO_JAVA_HOME=
echo - PENTAHO_JAVA_HOME=%PENTAHO_JAVA_HOME%

rem ************************************************
rem **           SET PATH TO DATA-INTEGRATION     ** 
rem ************************************************
set PDI_HOME=
echo - PDI_HOME=%PDI_HOME%

rem ************************************************
rem **           SET Xms || SET Xmx               ** 
rem ************************************************
set PENTAHO_DI_JAVA_OPTIONS=-Xms4096m -Xmx8192m -Dfile.encoding=UTF-8
echo - PENTAHO_DI_JAVA_OPTIONS= %PENTAHO_DI_JAVA_OPTIONS%