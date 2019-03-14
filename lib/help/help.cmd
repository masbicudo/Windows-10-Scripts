@echo off
setlocal EnableDelayedExpansion
for /f "delims=" %%a in (%~dpnx1) do (
    set __=%%a
    IF not "!__:~0,2!"=="::" goto :eof
    echo.%G%!__:~3!%N%
)
