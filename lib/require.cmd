:: require runs the required script a single time
:: the required script cannot receive parameters
:: Example:
::  require some.cmd
::      runs some.cmd a single time, even if the same command is called again
:: The path of the required script must be relative to the project folder,
:: defined in the variable __PROJECT_ROOT
@echo off
setlocal
SET R=[91m
SET web_orange=[38;2;255;165;0m
SET N=[0m
if not defined __PROJECT_ROOT (
    echo  %R%Cannot use %web_orange%require.cmd%R% without first defining the %web_orange%__PROJECT_ROOT%R% variable%N%
    goto :end_script
)

call set-colors abbr weborange
set PATHEXT=

set CStr=%web_darkorange%
IF defined __IND ( SET "ECHO=ECHO.%__IND%" ) ELSE ( SET "ECHO=ECHO." )

%ECHO%%W%Looking for %Y%%1%N%
where %1 1>nul 2>&1 && set "__FOUND=1" & set "__PREPEND="
if exist "%__PROJECT_ROOT%%1" set "__FOUND=1" & set "__PREPEND=%__PROJECT_ROOT%"
if not defined __FOUND (
    %ECHO%  %DR%Not found%N%
    %ECHO%  %R%Not found, please make sure to require files with extension%N%
    goto :end_script
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
    %__PREPEND%%*
) & set "%__VAR__%=2"
goto :eof
:end_script
if defined __PUSHD %ECHO%  popd
if defined __PUSHD popd