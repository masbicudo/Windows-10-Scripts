@ECHO OFF

if not "%1"=="--reset" goto :no_reset
  echo.Reseting variables
  for /f "tokens=1* delims==" %%a in ('set __REQ_') do set %%a=
  for /f "tokens=1* delims==" %%a in ('set where_') do set %%a=
:no_reset

REM :: removing pathexts to avoid bugs in the code
REM :: Major problem: it affects WHERE command
REM SET PATHEXT=.EXE

SET __COLORS__=T

:: adding all folders inside .\lib to the
:: PATH variable including .\lib itself
FOR /D %%D in (lib\*) DO call :Append_Path %%~fD
SET PATH=%PATH%;%CD%;%CD%\lib;%CD%\include

:: adding all folder inside .\include to
:: the PATH variable
FOR /D %%D in (include\*) DO call :Append_Path %%~fD

:: setting the __user variable that is used
:: to customize the fully automatic mode
:: (don't know yet how will this work...
::  probably just open a file called %__user%.txt
::  and run all apps listed in there)
set __user=masbicudo

set "__PROJECT_ROOT=%~dp0"

call lib\require.cmd places.cmd

:: PROC Append_Path
GOTO :End_Append_Path
:Append_Path
  SETLOCAL EnableDelayedExpansion
    SET __TEMP=%PATH%
    SET __TEMP=;%__TEMP:;=;;%;
    CALL SET __TEMP=%%__TEMP:;%~1;=%%
    SET __TEMP=%__TEMP:~1,-1%
    SET __TEMP=%__TEMP:;;=;%
    IF "%PATH%"=="%__TEMP%" SET "PATH=!PATH!;%~1"
  ENDLOCAL & SET PATH=%PATH%
  GOTO :EOF
:End_Append_Path