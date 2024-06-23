@echo off 

rem ************************************************
rem **           SET CURRENT_DIR                  ** 
rem ************************************************
set CURRENT_DIR=%cd%
echo - CURRENT_DIR=%CURRENT_DIR%

rem ************************************************
rem **           SET PROJECT_HOME                 ** 
rem ************************************************
set PROJECT_HOME=%CURRENT_DIR%\..
echo - PROJECT_HOME=%PROJECT_HOME%

rem ************************************************
rem **           SET OPT                          ** 
rem ************************************************
set OPT=-DPROJECT_HOME="%PROJECT_HOME%"
echo - OPT=%OPT%

rem ************************************************
rem **           SET KETTLE_HOME                  ** 
rem ************************************************
set KETTLE_HOME=%PROJECT_HOME%\config\%env%
echo - KETTLE_HOME=%KETTLE_HOME%

rem ************************************************
rem **           SET TIMESTAMP                    ** 
rem ************************************************
rem Get the date in YYYYMMDD format
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set datestamp=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%
rem Get the time in HHMMSS format
set timestamp=%datetime:~8,2%%datetime:~10,2%%datetime:~12,2%
rem Combine date and time
set TIMESTAMP=%datestamp%_%timestamp%

rem ************************************************
rem **           SET LOGS_FOLDER                  ** 
rem ************************************************
set LOGS_FOLDER=%PROJECT_HOME%\logs
mkdir "%LOGS_FOLDER%" 2>nul
mkdir "%LOGS_FOLDER%\config_archive\config_%TIMESTAMP%" 2>nul

rem ************************************************
rem **           BACKUP CONFIGURATION             ** 
rem ************************************************
xcopy "%PROJECT_HOME%\config" "%LOGS_FOLDER%\config_archive\config_%TIMESTAMP%" /E /I /H /Y >nul 2>&1
