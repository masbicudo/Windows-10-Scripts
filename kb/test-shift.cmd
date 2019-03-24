@echo off
setlocal

:read_next_arg
if "%~1"=="" goto :eof
echo.%1
shift
goto :read_next_arg