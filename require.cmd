:: require runs the required script a single time
:: the required script cannot receive parameters
:: Example:
::  require some.cmd
::      runs some.cmd a single time, even if the same command is called again
@echo off
setlocal
call set-colors
set PATHEXT=
where %1 1>nul 2>&1 && set __FOUND=1
if exist %1 set __FOUND=1
if not defined __FOUND (
    echo %red%"%1" not found, please make sure to require files with extension%cdef%
    goto :eof
)
:next
if "%1"=="" goto :proc
if defined __name set __name=%__name%_%1
if not defined __name set __name=%1
shift
goto :next
:proc
if defined __REQ_[%__name%] goto :eof
set __REQ_[%__name%]=1
if errorlevel 1 goto :eof
endlocal & (
    %*
) & set __REQ_[%__name%]=1