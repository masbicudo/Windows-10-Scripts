:: require runs the required script a single time
:: the required script cannot receive parameters
:: Example:
::  require some.cmd
::      runs some.cmd a single time, even if the same command is called again
@echo off
setlocal
call set-colors
set PATHEXT=

:retry
echo looking for %1
where %1 1>nul 2>&1 && set __FOUND=1
if exist %1 set __FOUND=1
if not defined __FOUND (
    echo not found
    if exist ".git" (
        echo .git
        echo %red%"%1" not found, please make sure to require files with extension%cdef%
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
echo found

:next
if "%1"=="" goto :proc
if defined __name set __name=%__name%_%1
if not defined __name set __name=%1
shift
goto :next
:proc

if defined __REQ_[%__name%] (
    echo already executed
    goto :end_script
)
set __REQ_[%__name%]=1
if errorlevel 1 goto :end_script
echo execute %*
endlocal & (
    %*
) & set __REQ_[%__name%]=1
goto :eof
:end_script
if defined __PUSHD echo popd
if defined __PUSHD popd