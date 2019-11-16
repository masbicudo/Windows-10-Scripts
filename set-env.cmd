@ECHO OFF

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

call lib\require.cmd places.cmd


:: PROC Append_Path
GOTO :End_Append_Path
:Append_Path
    SET PATH=%PATH%;%1
GOTO :EOF
:End_Append_Path