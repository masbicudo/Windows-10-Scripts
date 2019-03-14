@ECHO OFF
SETLOCAL EnableDelayedExpansion
ECHO.%1.length=!%1.length!
FOR /L %%i IN (1,1,!%1.length!) DO ECHO.%1[%%i]=!%1[%%i]!