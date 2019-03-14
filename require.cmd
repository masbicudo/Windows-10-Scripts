:: require runs the required script a single time
:: the required script cannot receive parameters
:: Example:
::  require some.cmd
::      runs some.cmd a single time, even if the same command is called again
@echo off
setlocal
:next
if "%1"=="" goto :proc
if defined __name set __name=%__name%_%1
if not defined __name set __name=%1
shift
goto :next
:proc
if defined __REQ_[%__name%] goto :eof
set __REQ_[%__name%]=1
if not errorlevel 1 %*
endlocal & set __REQ_[%__name%]=1