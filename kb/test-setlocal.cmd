@ECHO OFF
SETLOCAL
:A
SET a=1
ECHO.A:%a%
CALL :B
ECHO.A:%a%
CALL :C
ECHO.A:%a%
GOTO :EOF
:B
SETLOCAL
SET a=2
ECHO.B:%a%
GOTO :EOF
:C
SET a=3
ECHO.C:%a%
