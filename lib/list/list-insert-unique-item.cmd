:: list-insert-unique-item
::
:: Inserts a new item in a list variable if not already there.
:: The variable must be a list of values separated by ";".
::
:: Example:
::  list-insert-unique-item X unique-item

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
    list-item-exists %1 %2 || list-insert-item %1 %2