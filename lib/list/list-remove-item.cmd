:: list-remove-item
::
:: Removes an item from a list variable of values separated by ";".
::
:: Example:
::  list-remove-item PATH ^%windir^%\

:Header
    @echo off
    setlocal EnableDelayedExpansion
    SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&SET N=[0m
    if "%1"=="" SET __HELP=1
    if "%1"=="/?" SET __HELP=1
    if "%1"=="-h" SET __HELP=1
    if "%1"=="--help" SET __HELP=1
    if not defined __HELP goto :no_help
    for /f "delims=" %%a in (%~dpnx0) do (
        set __=%%a
        IF not "!__:~0,2!"=="::" goto :eof
        echo.%G%!__:~3!%N%
    )
    goto :eof
    :no_help

:Main
    @echo off
    SETLOCAL
    call SET __TEMP=%%%1%%
    SET __TEMP=;%__TEMP:;=;;%;
    call SET __TEMP=%%__TEMP:;%~2;=%%
    SET __TEMP=%__TEMP:~1,-1%
    SET __TEMP=%__TEMP:;;=;%
    ENDLOCAL & SET %1=%__TEMP%