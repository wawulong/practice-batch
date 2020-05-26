@echo off

set TAG=
set VERSION_HEADER=version.h

setlocal EnableDelayedExpansion

if exist %VERSION_HEADER% (
    del /s/f/q %VERSION_HEADER% > nul
)

echo Step-1:
for /f %%a in ('dir /b') do (
    echo %%a
)

echo Step-2:
for /f "usebackq" %%b in (`"git rev-list --tags --max-count=1"`) do (
    set TAG=%%b
    echo [%TAG%]
    echo [!TAG!]
)
echo Step-3:
if "%TAG%" == "" (
    set TAG=v0000
    echo [%TAG%]
    echo [!TAG!]
) else (
    for /f "usebackq" %%c in (`"git describe --tags %TAG%"`) do (
        set TAG=%%c
        echo %%c
    )
)

echo Step-4:
for /f "usebackq tokens=1,2,3 delims=-" %%d in (`"git describe --abbrev=6 --always --tags"`) do (
    echo %%d %%e %%f
    set DESC=%%d
    echo DESC=!DESC!

REM Below output a c header file

    REM echo #ifndef _VERSION_H > %VERSION_HEADER%
    REM echo #define _VERSION_H >> %VERSION_HEADER%
    REM REM echo #include ^<stdint.h^> >> %VERSION_HEADER%
    REM echo #define FW_STR "%TAG%" >>  %VERSION_HEADER%
    REM echo #define FW_VER 0x%TAG:~1,4% >> %VERSION_HEADER%
    REM echo #define FW_CMT "%%v" >> %VERSION_HEADER%
    REM echo #endif /* _VERSION_H */ >> %VERSION_HEADER%
)