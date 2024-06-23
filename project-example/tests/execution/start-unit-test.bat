:: Set path to PDI
set PDI_HOME="C:\Program Files\Pentaho-9.3.0.0-428\data-integration"
:: Set Java Options
set "PENTAHO_DI_JAVA_OPTIONS=-Xms1g -Xmx8g"

:: Set timestamp and current dir
set CURRENT_DIRECTORY=%cd%
set "timestamp=%date:/=-%_%time::=%.log"
set "timestamp=%timestamp: =0%"
set CURRENT_LOG_FILE=UnitTest_%timestamp%
set input_file_name="%1%"

:: call UnitTest job and write output to log file
:: call %PDI_HOME%\kitchen.bat /file:%CURRENT_DIRECTORY%\UnitTest.kjb /level:Basic /param="input_file_name=%input_file_name%" >> "%CURRENT_DIRECTORY%\logs\%CURRENT_LOG_FILE%" 2>&1

:: works with generate rows!
call %PDI_HOME%\pan.bat /file:%CURRENT_DIRECTORY%\UnitTest.ktr /level:Basic /param="input_file_name=%input_file_name%" >> "%CURRENT_DIRECTORY%\logs\%CURRENT_LOG_FILE%" 2>&1
