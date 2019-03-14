:: list-item-exists-expand
::
:: Checks whether a value exists in a list variable,
:: expanding the values that contain variables.
::
:: Example:
::  given that:
::      X=%windir%\x.txt
::  list-item-exists-expand X C:\Windows\x.txt && echo.1 || echo.0
::      1
::  list-item-exists-expand X ^%windir^%\x.txt && echo.1 || echo.0
::      1

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
    if not defined %1 %comspec% /c exit 1 & goto :dieerrlvl
    :: The use of call two times, expands the variables
    :: referred to by the source variable. This makes
    :: the search more realistic from the point of view
    :: of the current user, but might have side effects,
    :: since other users could have defined the variables
    :: with other values. This is usefull when dealing
    :: with current user definitions, instead of global.
    call call SET __COPY=%%%1%%
    SET __COPY_REM=%__COPY%
    echo %%2=%2
    echo %__COPY%
    call list-remove-item __COPY_REM %2
    if "%__COPY%"=="%__COPY_REM%" (
        %comspec% /c exit 1 & goto :dieerrlvl
    )
    %comspec% /c exit 0 & goto :dieerrlvl

:Footer
    goto :eof
    :dieerrlvl
    %comspec% /c exit %errorlevel%