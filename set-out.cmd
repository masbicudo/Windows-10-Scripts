::@ECHO OFF
SETLOCAL
FOR /f "usebackq tokens=*" %%a IN (` eat %* `) DO SET TEMP_EAT=%%a
FOR /f "usebackq tokens=*" %%a IN (` %TEMP_EAT% `) DO SET "__VALUE=%%a"
ENDLOCAL & SET "%1=%__VALUE%"
