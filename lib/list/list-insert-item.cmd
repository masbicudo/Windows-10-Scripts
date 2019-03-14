:: list-insert-item
::
:: Inserts an item at the end of a variable that is a list
:: of values separated by ";".
::
:: Example:
::  list-insert-item X new-item

:Header
    @echo off
    setlocal EnableDelayedExpansion
    SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&SET N=[0m
    if "%1"=="" SET __HELP=1
    if "%1"=="/?" SET __HELP=1
    if "%1"=="-h" SET __HELP=1
    if "%1"=="--help" SET __HELP=1
    if not defined __HELP goto :no_help
    call help "%~dpnx0"
    goto :eof
    :no_help

:Main
    :: x = x ? x + v : v
    IF defined %1 ( SET "__=!%1!;%~2" ) ELSE ( SET "__=%~2" )
    ENDLOCAL & SET %1=%__%