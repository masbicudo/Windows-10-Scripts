:: list-sort
::
:: Sorts a list variable whose elements are separated by ";".
::
:: Example:
::  list-sort PATH

:Header
    @echo off
    setlocal DisableDelayedExpansion
    SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&SET N=[0m
    if "%1"=="" SET __HELP=1
    if "%1"=="/?" SET __HELP=1
    if "%1"=="-h" SET __HELP=1
    if "%1"=="--help" SET __HELP=1
    if not defined __HELP goto :no_help
    setlocal EnableDelayedExpansion
    for /f "delims=" %%a in (%~dpnx0) do (
        set __=%%a
        IF not "!__:~0,2!"=="::" goto :eof
        echo.%G%!__:~3!%N%
    )
    endlocal
    goto :eof
    :no_help

:Main
    ::list-print path
    ::echo %1
    for /f "usebackq delims=" %%a in (`
        call %~dp0list-print.cmd %1 ^| sort
        `) do (
            SET "litem=%%~a"
            CALL :proc
        )
    set __=%__:""="%
    set "__=%__:"=""%"
    set "__=%__:;;="";""%"
    set "__=%__:^;^;=;%"
    ::set "__=%__:""="%"
    endlocal & set "%1=%__:""="%"

goto :eof
:proc
    set "litem=%litem:"=""%"
    set "litem=%litem:^=^^%"
    set "litem=%litem:&=^&%"
    set "litem=%litem:|=^|%"
    set "litem=%litem:<=^<%"
    set "litem=%litem:>=^>%"
    if not "%litem:;=%"=="%litem%" set "litem=""%litem%"""
    ::set litem
    if defined __ SET "__=%__%;%litem%"
    if not defined __ SET "__=%litem%"