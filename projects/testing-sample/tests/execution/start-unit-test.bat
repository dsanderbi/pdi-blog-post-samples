:: Set PDI_HOME to the data-integration directory
set PDI_HOME="..\..\..\..\..\data-integration"

:: Set Java Options
set PENTAHO_DI_JAVA_OPTIONS=-Xms1g -Xmx8g

:: Set timestamp and current dir
set CURRENT_DIRECTORY=%cd%
set "timestamp=%date:/=-%_%time::=%.log"
set "timestamp=%timestamp: =0%"
set CURRENT_LOG_FILE=UnitTest_%timestamp%
set input_file_name="%1%"

:: Call UnitTest.ktr
call %PDI_HOME%\pan.bat /file:%CURRENT_DIRECTORY%\UnitTest.ktr /level:Basic /param="input_file_name=%input_file_name%" >> "%CURRENT_DIRECTORY%\logs\%CURRENT_LOG_FILE%" 2>&1
