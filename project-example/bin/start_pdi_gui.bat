@echo off 
setlocal

rem ** Set the default environment to 'dev' if no parameter is passed **
if "%~1"=="" (
    set "env=dev"
) else (
    set "env=%~1"
)

rem ** check if parameter is valid **
if /i "%env%"=="dev" goto valid
if /i "%env%"=="test" goto valid
if /i "%env%"=="prod" goto valid

echo Value not valid, use dev, test or prod!
exit /b 1

:valid
echo Start PDI-GUI with %env% settings.
rem ************************************************
rem **           CALL PROJECT SETTINGS            ** 
rem ************************************************
call project_settings.bat

rem ************************************************
rem **           CALL ENV SETTINGS                ** 
rem ************************************************
call env-%env%\env_settings.bat

rem ************************************************
rem **           CALL PDI-GUI                     ** 
rem ************************************************
call %PDI_HOME%\spoon.bat %OPT% %*

endlocal