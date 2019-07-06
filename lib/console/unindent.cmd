@echo off
setlocal
if "%1"=="" set "__USE=    "
if defined __IND set "__IND=%__IND:~4%"
endlocal & set "__IND=%__IND%"