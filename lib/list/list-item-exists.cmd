:: list-item-exists-expand
::
:: Checks whether a value exists in a list variable,
:: expanding the values that contain variables.
::
:: Example:
::  given that:
::      X=%windir%\x.txt
::  list-item-exists-expand X C:\Windows\x.txt && echo.1 || echo.0
::      0
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
    if not defined %1 goto :eof
    :: The use of call one time, will leave items with
    :: variable references unexpanded. This means that
    :: even if two pathes are the same when variable gets
    :: expanded, it won't be seen as being equal to the
    :: value being searched for. This is usefull when
    :: dealing with global definitions, since each user
    :: can define the variables to different values,
    :: so that we cannot know the value for sure.
    call set __COPY=%%%1%%
    SET __COPY_REM=%__COPY%
    set __par=%2
    call list-remove-item __COPY_REM %%__par%%

    if "%__COPY%"=="%__COPY_REM%" (
        set __COPY=
        set __COPY_REM=
        %comspec% /c exit 1 & goto :dieerrlvl
    )
    %comspec% /c exit 0 & goto :dieerrlvl

:Footer
    goto :eof
    :dieerrlvl
    %comspec% /c exit %errorlevel%