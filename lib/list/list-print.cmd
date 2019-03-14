:: list-print
::
:: Prints each value in a list variable whose values are separated by ";".
::
:: Example:
::  list-print PATH

:Header
    :: TODO: add a --sort param
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
    :: https://stackoverflow.com/questions/5471556/pretty-print-windows-path-variable-how-to-split-on-in-cmd-shell
    setlocal DisableDelayedExpansion
    call set "__=%%%1:"=""%%"

    ::set "__=%__:"=""%"
    set "__=%__:^=^^%"
    set "__=%__:&=^&%"
    set "__=%__:|=^|%"
    set "__=%__:<=^<%"
    set "__=%__:>=^>%"
    set "__=%__:;=^;^;%"
    rem ** This is the key line, the missing quote is intended
    set __=%__:""="%
    set "__=%__:"=""%"
    set "__=%__:;;="";""%"
    set "__=%__:^;^;=;%"
    set "__=%__:""="%"
    set "__=%__:"=""%"
    set "__=%__:"";""=";"%"
    set "__=%__:"""="%"
    ::set __
    setlocal EnableDelayedExpansion
    for %%a in ("!__!") do (
        endlocal
        echo %%~a
        setlocal EnableDelayedExpansion
    )