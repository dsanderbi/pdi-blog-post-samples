@echo off
setlocal

rem ** check environment parameter **
if "%~1"=="" (
    set "env=prod"
) else (
    set "env=%~1"
)

rem ** check if environment parameter is valid **
if /i "%env%"=="dev" goto valid
if /i "%env%"=="test" goto valid
if /i "%env%"=="prod" goto valid

echo Value not valid, use dev, test or prod!
exit /b 1

:valid

rem ** check log level parameter **
if "%~2"=="" (
    set "LOG_LEVEL=Minimal"
) else (
    set "LOG_LEVEL=%~2"
)

echo Start Job with %env% settings and log level %LOG_LEVEL%.

rem ************************************************
rem **           CALL PROJECT SETTINGS            ** 
rem ************************************************
call project_settings.bat

rem ************************************************
rem **           CALL ENV SETTINGS                ** 
rem ************************************************
call env-%env%\env_settings.bat

rem ************************************************
rem **           CALL KITCHEN                     ** 
rem ************************************************
rem call %PDI_HOME%\spoon.bat %OPT% %*
call %PDI_HOME%\kitchen.bat -file=%PROJECT_HOME%\main\jobs\main.kjb -level=%LOG_LEVEL% %OPT% >> %LOGS_FOLDER%/main_%TIMESTAMP%.log 2>&1

endlocal