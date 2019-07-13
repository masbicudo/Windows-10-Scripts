:: require runs the required script a single time
:: the required script cannot receive parameters
:: Example:
::  require some.cmd
::      runs some.cmd a single time, even if the same command is called again
@echo off
setlocal
call set-colors abbr weborange
set PATHEXT=

set CStr=%web_darkorange%
IF defined __IND ( SET "ECHO=ECHO.%__IND%" ) ELSE ( SET "ECHO=ECHO." )

:retry
%ECHO%%W%Looking for %Y%%1%N%
where %1 1>nul 2>&1 && set __FOUND=1
if exist %1 set __FOUND=1
if not defined __FOUND (
    %ECHO%  %DR%Not found%N%
    if exist ".git" (
        %ECHO%  .git
        %ECHO%  %R%Not found, please make sure to require files with extension%N%
        goto :end_script
    ) else if defined __PUSHD (
        %ECHO%  cd..
        cd ..
    ) else (
        %ECHO%  pushd ..
        set __PUSHD=1
        pushd ..
    )
    goto :retry
)
%ECHO%  %G%Found%N%

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
    %ECHO%  %LK%Already executed %CStr%%*%N%
    goto :end_script
)
if "%__REQ_VALUE%"=="1" (
    %ECHO%  %LK%Recursively executing %CStr%%*%N%
    goto :end_script
)
set %__VAR__%=1
if errorlevel 1 goto :end_script
%ECHO%  %LK%Execute %DY%%*%N%
endlocal & set "%__VAR__%=1" & (
    %*
) & set "%__VAR__%=2"
goto :eof
:end_script
if defined __PUSHD %ECHO%  popd
if defined __PUSHD popd