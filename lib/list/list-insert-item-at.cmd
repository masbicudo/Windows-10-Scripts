:: list-insert-item-at
::
:: Inserts a new item in a variable at the given position.
:: The variable must be a list of values separated by ";",
:: and also have only unique values.
::
:: Example:
::  list-insert-item-at X 2 item2

:Header
    @echo off
    setlocal EnableDelayedExpansion
    SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&SET N=[0m
    echo %~dpnx0
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
    call set __LIST_IT=%%%1%%
    for /f "tokens=%2 delims=;" %%I in ("%__LIST_IT%") do set __ITEM_NAME=%%I
    call set %1=;%%%1:;=;;%%;
    call set %1=%%%1:;%__ITEM_NAME%;=;%~3;;%__ITEM_NAME%;%%
    call set %1=%%%1:~1,-1%%
    call set __=%%%1:;;=;%%
    endlocal & set %1=%__%