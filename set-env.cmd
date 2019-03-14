@ECHO OFF
SET PATH=%PATH%;%CD%;%CD%\lib
FOR /D %%D in (lib\*) DO CALL :Append_Path %%~fD
GOTO :EOF
:Append_Path
SET PATH=%PATH%;%1