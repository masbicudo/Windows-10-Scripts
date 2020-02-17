@ECHO OFF

if "%1"==":some" if "%2"=="" goto :some

SETLOCAL EnableDelayedExpansion

:: Indentation of the outputs
IF defined __IND ( SET "ECHO=ECHO.%__IND%" ) ELSE ( SET "ECHO=ECHO." )

:: Debug messages command (ECHO shows messages, REM hides messages)
::SET DL=%ECHO%
SET DL=REM

:: Colors
IF /I "%__COLORS__%"=="T" call :Sub_Set_Colors

:: the target variable name will be stored in __VAR__
SET "__VAR__=%~1"

FOR /f "usebackq tokens=*" %%a IN (` eat %* `) DO SET TEMP_EAT=%%a
SET TEMP_EAT=%TEMP_EAT:^=^^%
%DL% TEMP_EAT=%TEMP_EAT%

SET "__NEXT__="
SET "__VALUE__="

FOR /f "usebackq tokens=*" %%a IN (` CALL "%~dpnx0" :some `) DO (
  IF not defined __VALUE__ IF defined __NEXT__ SET "__VALUE__=!__NEXT__!"
  SET "__NEXT__=%%a"
)

%DL% varname=%1
%DL% __VALUE__=%__VALUE__%
%DL% %__NEXT__%

:: Last line contains _DIE=number
SET %__NEXT__%

:: TODO: option to undefine the variable if __VALUE__ is empty
if defined __VALUE__ (
  goto :set_value
) else (
  goto :unset_value
)

:set_value
  %ECHO%%W%%__VAR__%%K%=%Y%%__VALUE__%%N%
  ENDLOCAL & SET "%__VAR__%=%__VALUE__%" & %comspec% /c exit %_DIE%
  goto :dieerrlvl
:unset_value
  %ECHO%%W%%__VAR__%%K%=%N%
  ENDLOCAL & SET "%__VAR__%=" & %comspec% /c exit %_DIE%
  goto :dieerrlvl

goto :EOF
:some
  %TEMP_EAT% 2>&1
  ECHO _DIE=%errorlevel%
goto :EOF

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