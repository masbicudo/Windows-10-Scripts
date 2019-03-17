@ECHO OFF
call :Sub_Exit %1
GOTO :End_Exit
:Sub_Exit
EXIT /B %1
:End_Exit
