@ECHO OFF
:start
IF [%1]==[] GOTO :EOF
IF [%1]==[1] (ECHO.%2) ELSE (ECHO.%2 1>&%1)
shift
shift
GOTO start