@ECHO OFF

if "%1"==":some" if "%2"=="" goto :some

SETLOCAL DisableDelayedExpansion

IF defined __IND ( SET "ECHO=ECHO.%__IND%" ) ELSE ( SET "ECHO=ECHO." )
SET "__VAR__=%~1"

:: Colors
IF /I "%__COLORS__%"=="T" call :SUB_SET_COLORS

FOR /f "usebackq tokens=*" %%a IN (` eat %* `) DO SET TEMP_EAT=%%a
SET TEMP_EAT=%TEMP_EAT:^=^^%
rem %ECHO%TEMP_EAT=%TEMP_EAT%
FOR /f "usebackq tokens=*" %%a IN (` CALL "%~dpnx0" :some `) DO SET "__VALUE__=%%a" & goto :next
:next

IF "%__VALUE__:~0,5%"=="_DIE=" (
    SET %__VALUE__%
    SET __VALUE__=
)

::SET DL=%ECHO%
SET DL=REM

%DL% varname=%1
%DL% _DIE=%_DIE%
%DL% __VALUE__=%__VALUE__%
%ECHO%%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
if defined _DIE %comspec% /c exit %_DIE% & goto :dieerrlvl
if not defined __VALUE__ %comspec% /c exit 1 & goto :dieerrlvl

ENDLOCAL & SET "%__VAR__%=%__VALUE__%"
%comspec% /c exit 0 & goto :dieerrlvl

goto :EOF
:some

%TEMP_EAT%
ECHO _DIE=%errorlevel%

::
:: Set_Colors
::
::  Sets variables that can be used to colorize %ECHO%ed text on screen
GOTO :End_Set_Colors
:Sub_Set_Colors
  SET _k=[30m&SET _r=[31m&SET _g=[32m&SET _y=[33m&SET _b=[34m&SET _m=[35m&SET _c=[36m&SET _w=[37m&
  SET K=[90m&SET R=[91m&SET G=[92m&SET Y=[93m&SET B=[94m&SET M=[95m&SET C=[96m&SET W=[97m&
  SET N=[0m
:End_Set_Colors

::
:: FOOTER
::
::  Allows to correctly specify the script result by
::  setting return-value and error-level
GOTO :EOF
:dieerrlvl
%comspec% /c exit %errorlevel%