:: require runs the required script a single time
:: the required script cannot receive parameters
:: Example:
::  require some.cmd
::      runs some.cmd a single time, even if the same command is called again
@echo off
setlocal
call set-colors abbr
set PATHEXT=

:retry
echo %N%looking for %Y%%1%N%
where %1 1>nul 2>&1 && set __FOUND=1
if exist %1 set __FOUND=1
if not defined __FOUND (
    echo %R%not found%N%
    if exist ".git" (
        echo .git
        echo %R%"%1" not found, please make sure to require files with extension%N%
        goto :end_script
    ) else if defined __PUSHD (
        echo cd..
        cd ..
    ) else (
        echo pushd ..
        set __PUSHD=1
        pushd ..
    )
    goto :retry
)
echo %G%found%N%

:: composing key of the requirement
:: e.g.:
:: - call require foo.cmd param1
::      key = foo.cmd_param1
:next
if "%1"=="" goto :proc
if defined __name set __name=%__name%_%1
if not defined __name set __name=%1
shift
goto :next
:proc

set __VAR__=__REQ_[%__name%]
set __REQ_VALUE=0
if defined %__VAR__% call set __REQ_VALUE=%%%__VAR__%%%

if "%__REQ_VALUE%"=="2" (
    echo %LK%already executed %DY%%*%N%
    goto :end_script
)
if "%__REQ_VALUE%"=="1" (
    echo %LK%recursively executing %DY%%*%N%
    goto :end_script
)
set %__VAR__%=1
if errorlevel 1 goto :end_script
echo %LK%execute %DY%%*%N%
endlocal & set "%__VAR__%=1" & (
    %*
) & set "%__VAR__%=2"
goto :eof
:end_script
if defined __PUSHD echo popd
if defined __PUSHD popd