@ECHO OFF
FOR /D %%D in (lib\*) DO call :Append_Path %%~fD
SET PATH=%PATH%;%CD%;%CD%\lib;%CD%\include
FOR /D %%D in (include\*) DO call :Append_Path %%~fD
set __user=masbicudo
GOTO :EOF
:Append_Path
SET PATH=%PATH%;%1