@echo off
setlocal
if "%1"=="" set "__USE=    "
if defined __IND set "__IND=%__USE%%__IND%"
if not defined __IND set "__IND=%__USE%"
endlocal & set "__IND=%__IND%"