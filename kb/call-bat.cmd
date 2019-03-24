@echo off
setlocal

if defined __ echo.2) %__%& goto :eof

set X=X
set XY=something

set __=%%%%%%X%%Y%%%%

echo.1) %__%

:: the following line will expand the variable only 1 time
:: even though multiple calls are nested, that happens
:: because the call is being used to call a batch file
call call call call call call "%~dpnx0" "%__%"

:: the following line will expand the variable 2 times
call echo.3) %__%

:: the following line will expand the variable 3 times
call call echo.4) %__%
