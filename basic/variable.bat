@echo off

set CURRENT_PATH=%~dp0
set BATCH_NAME=%~n0
set BATCH_EXTENSION=%~x0

if "%1" == "" (
    echo "cmd echo-string or -h for environment list"
    goto:eof
) else if "%1" == "-h" (
    goto Help
) else (
    echo %1
    exit /b 0
)

:Help
echo %CURRENT_PATH%
echo %BATCH_NAME%
echo %BATCH_EXTENSION%

pause