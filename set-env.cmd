@ECHO OFF

REM :: removing pathexts to avoid bugs in the code
REM :: since many of the apps\*.cmd use the names from
REM :: real applications... only .EXE may be called
REM :: without extension
REM SET PATHEXT=.EXE

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

GOTO :EOF

:Append_Path
SET PATH=%PATH%;%1
